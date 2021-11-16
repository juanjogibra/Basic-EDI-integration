report 50150 "ABPEDIImportEDIOrders"
{
    ProcessingOnly = true;
    UseRequestPage = false;
    Caption = 'Import EDI Orders', Comment = 'Importar Pedidos EDI';

    trigger OnPreReport()
    var
        clave: Text;
        nodo: Text;
        NuPedido: Text;
        aResult: Text;
    begin

        Continue := true; //Controla que los pedidos se importen uno tras otro durante la automatización        

        while Continue do begin

            ClearVariables();

            ImportEDIOrders.GetSalesOrder(OrderText, aResult); //Hacemos la petición para sacar el pedido

            CreateEDIOrder(OrderText, clave, nodo, NuPedido); //Luego de obtener el pedido, lo creamos en la tabla de "Pedido EDI"

            if aResult = '' then
                exit;
            CreateConfirmResponse(clave, nodo, NuPedido, aResult);  //Luego de importar el pedido, enviamos a EDICOM una confirmación de recepción. 
        end;
    end;

    local procedure WriteTableSeparator(iterations: Integer)
    var
        i: Integer;
        char1, char2 : Char;
    begin
        char1 := 13;
        char2 := 10;
        for i := 1 to iterations do
            outS.WriteText('---' + Format(char1) + Format(char2));
    end;

    local procedure ClearVariables()
    begin
        Clear(PreviousOutStream);
        Clear(outS);
        Clear(inS);
        Clear(NewStream);
        Clear(OrderText);
        Clear(texto);
        Clear(TempFile);
        Clear(tempblob);
        Clear(EDIOrderImport);
    end;

    procedure CreateEDIOrder(var _OrderText: text; var clave: Text; var nodo: Text; var NuPedido: Text)
    var
        tag, cust, OldEtiqueta : Text;
        char1, char2 : Char;
    begin
        if _OrderText = '' then begin
            Continue := false;
            Message(Message001);
            exit;
        end;
        char1 := 13;
        char2 := 10;
        OldEtiqueta := '';

        tempblob.CreateOutStream(PreviousOutStream);
        PreviousOutStream.WriteText(_OrderText);
        tempblob.CreateInStream(inS);

        //creamos e inicializamos el fichero temporal OutStream sobre el que escribiremos

        TempFile.CreateOutStream(outS);

        //Recorremos todo el INStream hasta el final

        while not (inS.EOS) do begin
            ins.ReadText(texto);

            tag := DELCHR(CopyStr(texto, 1, 8)); //Para cada línea, leemos los primeros 8 caracteres para ver el tipo. Si es cabecera, insertamos en el outstream               
            case tag of //Si el tipo cambia, insertamos --- en el outstream
                'CABECERA'://Para etiqueta = Cabecera
                    begin
                        clave := DELCHR(CopyStr(texto, 9, 8));
                        nodo := DELCHR(CopyStr(texto, 17, 3));
                        NuPedido := DELCHR(CopyStr(texto, 23, 15));
                        Cust := DELCHR(CopyStr(texto, 172, 17));
                    end;
                'OBSER': //Para etiqueta = observaciones
                    begin
                        if OldEtiqueta = 'CABECERA' then
                            WriteTableSeparator(1);
                    end;
                'LINEA': //Para etiqueta = Linea
                    begin
                        if OldEtiqueta = 'OBSER' then
                            WriteTableSeparator(1)
                        else
                            if OldEtiqueta = 'CABECERA' then
                                WriteTableSeparator(2);
                    end;
                'OBSERL': // Para etiqueta = Observ. Lineas
                    begin
                        if OldEtiqueta = 'LINEA' then
                            WriteTableSeparator(1)
                        else
                            if OldEtiqueta = 'OBSER' then
                                WriteTableSeparator(2)
                            else
                                if OldEtiqueta = 'CABECERA' then
                                    WriteTableSeparator(3);
                    end;
                'LOC': //Para etiqueta = Desglose
                    begin
                        if OldEtiqueta = 'OBSERL' then
                            WriteTableSeparator(1)
                        else
                            if OldEtiqueta = 'LINEA' then
                                WriteTableSeparator(2)
                            else
                                if OldEtiqueta = 'OBSER' then
                                    WriteTableSeparator(3)
                                else
                                    if OldEtiqueta = 'CABECERA' then
                                        WriteTableSeparator(4);
                    end;
                else
                    Error('Formato Desconocido');
            end;
            outS.WriteText(texto + Format(char1) + Format(char2)); //Insertamos la linea
            OldEtiqueta := tag; //Cambiamos el valor de la etiqueta
        end;

        //Colocamos los guiones si el fichero tiene tipos sin determinar
        if OldEtiqueta = 'LOC' then
            WriteTableSeparator(1)
        else
            if OldEtiqueta = 'OBSERL' then
                WriteTableSeparator(2)
            else
                if OldEtiqueta = 'LINEA' then
                    WriteTableSeparator(3)
                else
                    if OldEtiqueta = 'OBSER' then
                        WriteTableSeparator(4)
                    else
                        if OldEtiqueta = 'CABECERA' then
                            WriteTableSeparator(5);

        TempFile.CREATEINSTREAM(NewStream); //Convertimos el OutStream en InStream

        //Importamos el fichero InStream en el XML-Port y lo ejecutamos
        EDIOrderImport.SetSource(NewStream);
        EDIOrderImport.Import;
    end;

    procedure CreateConfirmResponse(var clave: Text; var nodo: Text; var NuPedido: Text; var aResult: Text)
    var
        IsSuccess: Boolean;
    begin
        ImportEDIOrders.CreateConfirmationRequest(aResult, IsSuccess); //Validamos el código de confirmación de pedido
        OrdersEDI.SetRange(EDIKey1, clave);
        OrdersEDI.SetRange(Nodo, nodo);
        OrdersEDI.SetRange(NumPed, NuPedido);
        if OrdersEDI.FindSet() then
            if not OrdersEDI.SuccessfulConfirmation then begin
                OrdersEDI.Validate(SuccessfulConfirmation, IsSuccess);
                OrdersEDI.Modify(true);
            end;
    end;

    var
        EDIReference: Text[250];
        OrdersEDI: Record ABPEDIEDISalesHeader;
        cFM: Codeunit "File Management";
        ImportEDIOrders: Codeunit ABPEDIImportEDIOrder;
        EDIOrderImport: XMLport ABPEDIExampleEDIOrderImport;
        DocumentType: Enum ABPEDIDocumentType;
        TempFile: Codeunit "Temp Blob";
        PreviousOutStream: OutStream;
        NewStream: InStream;
        inS: InStream;
        outS: OutStream;
        i: Integer;
        Continue: Boolean;
        OrderText: Text;
        tempblob: Codeunit "Temp Blob";
        texto: Text;
        Message001: Label 'There´s no more orders to import', Comment = 'Ya no hay más pedidos que importar';
        Text50060: Label 'Do you want to move the Impor files to the backup directory?',
            Comment = '¿Desea mover los ficheros de importación al directorio de Backup?';

}

