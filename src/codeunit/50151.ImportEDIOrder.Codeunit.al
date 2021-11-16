codeunit 50151 "ABPEDIImportEDIOrder"
{
    TableNo = ABPEDIInboundBox;

    trigger OnRun()
    begin
    end;

    var
        EDICommonFunctions: Codeunit ABPEDIEDICommonsFunctions;


    procedure GetSalesOrder(var aMessage: Text; var aResult: Text)
    var
        Setup: record ABPEDISOAPSetup;
        Result: Text;
        char1, char2 : Char;
        SOAPEnvURI: text;
        UebURI: text;
        Parameters: XmlDocument;
        Body: XmlElement;
        Envelope: XmlElement;
        Header: XMLElement;
        SubscriptionWS: XmlElement;
        customWebService: record "ABP Custom Web Service";
        webServiceSetup: record "ABP Web Service Setup";
        webServiceParm: record "ABP Web Service Parm";

    begin
        char1 := 13;
        char2 := 10;
        if not setup.Get() then
            Error('Se necesita la configuración de SOAP, ingrese la URL, el ID de usuario y la contraseña.');

        if not GetWSSetups(customWebService, webServiceSetup) then
            exit;

        //Creamos atributos
        SOAPEnvURI := 'http://schemas.xmlsoap.org/soap/envelope/'; //soapenv
        UebURI := 'UEBIBrokerInterface'; //ueb

        //Añadimos los atributos a la etiqueta padre del XML 
        Envelope := XmlElement.Create('Envelope', SOAPEnvURI);
        Envelope.Add(XmlAttribute.CreateNamespaceDeclaration('soapenv', SOAPEnvURI));
        Envelope.Add(XmlAttribute.CreateNamespaceDeclaration('ueb', UebURI));

        //Rellenamos las etiquetas XML con los valores que necesitamos
        SubscriptionWS := XmlElement.Create('TEBIBrokerInterface_SubscriptionWS', UebURI); //Asignamos el atributo Soapenv a la etiqueta subscriptionWS
        SubscriptionWS.Add(EDICommonFunctions.AddField('aClientId', Setup.User));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aUser', Setup.User));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aPassword', Setup.password));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aDomain', 'PRODUCCION'));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aApplication', setup.User));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aSchema', 'EDI_ORDERS_D_01B_UN_EAN010_27'));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aTransformation', 'IN_EDI_ORDERS_D_01B_UN_EAN010_2_TXT_ORDERS_V24_LOT_B88462726'));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aReference', ''));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aMessage', ''));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aMessageFormat', '1'));

        //Creamos las etiquetas intermedias Body y Header, con sus atributos
        Body := XmlElement.Create('Body', SOAPEnvURI);
        Body.Add(SubscriptionWS); //añadimos el grupo anterior a body

        Header := XmlElement.Create('Header', SOAPEnvURI);

        //Añadimos las etiquetas a la etiqueta padre
        Envelope.Add(Header);
        Envelope.Add(Body);

        //Creamos el documento XML Parametros, y le introducimos el XML creado hasta ahora
        Parameters := XmlDocument.Create();
        Parameters.Add(Envelope);

        Result := EDICommonFunctions.CallWebService(Parameters, customWebService."Request URL"); //hacemos la llamada que nos devuelve el resultado a mostrar      

        EDICommonFunctions.ProcessResponse(Result, aMessage, aResult); //Procesado del XML

    end;


    Procedure CreateConfirmationRequest(var MessageID: Text; var IsSuccess: Boolean) //Creamos la confirmación de que el pedido se ha recibido correctamente
    var
        Setup: record ABPEDISOAPSetup;
        ProcessedResponse: Text;
        Result: Text;
        SOAPEnvURI: text;
        UebURI: text;
        Parameters: XmlDocument;
        customWebService: record "ABP Custom Web Service";
        webServiceSetup: record "ABP Web Service Setup";
        Body: XmlElement;
        Envelope: XmlElement;
        Header: XMLElement;
        SubscriptionWS: XmlElement;

    begin
        if not setup.Get() then
            Error('Se necesita la configuración de SOAP, ingrese la URL, el ID de usuario y la contraseña.');

        if not GetWSSetups(customWebService, webServiceSetup) then
            exit;

        //Creamos atributos
        SOAPEnvURI := 'http://schemas.xmlsoap.org/soap/envelope/'; //soapenv
        UebURI := 'UEBIBrokerInterface'; //ueb

        //Añadimos los atributos a la etiqueta padre del XML 
        Envelope := XmlElement.Create('Envelope', SOAPEnvURI);
        Envelope.Add(XmlAttribute.CreateNamespaceDeclaration('soapenv', SOAPEnvURI));
        Envelope.Add(XmlAttribute.CreateNamespaceDeclaration('ueb', UebURI));

        //Rellenamos las etiquetas XML con los valores que necesitamos
        SubscriptionWS := XmlElement.Create('TEBIBrokerInterface_ConfirmSubscriptionWS', UebURI); //Asignamos el atributo Soapenv a la etiqueta subscriptionWS
        SubscriptionWS.Add(EDICommonFunctions.AddField('aClientId', Setup.User));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aUser', Setup.User));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aPassword', Setup.password));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aDomain', 'PRODUCCION'));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aApplication', setup.User));
        SubscriptionWS.Add(EDICommonFunctions.AddField('aMessageID', MessageID));

        //Creamos las etiquetas intermedias Body y Header, con sus atributos
        Body := XmlElement.Create('Body', SOAPEnvURI);
        Body.Add(SubscriptionWS); //añadimos el grupo anterior a body

        Header := XmlElement.Create('Header', SOAPEnvURI);

        //Añadimos las etiquetas a la etiqueta padre
        Envelope.Add(Header);
        Envelope.Add(Body);

        //Creamos el documento XML Parametros, y le introducimos el XML creado hasta ahora
        Parameters := XmlDocument.Create();
        Parameters.Add(Envelope);

        Result := EDICommonFunctions.CallWebService(Parameters, customWebService."Request URL"); //hacemos la llamada que nos devuelve el resultado a mostrar      
        ProcessConfirmResponse(Result, IsSuccess);
    end;

    local procedure ProcessConfirmResponse(result: text; var Success: boolean)
    var
        FirstTag: integer;
        lastTag: Integer;
        MessageId: Text;
    begin
        FirstTag := (result.IndexOf('<return>')) + (StrLen('<return>'));
        lastTag := (result.LastIndexOf('</return>')) - (StrLen('</return>'));
        MessageId := CopyStr(result, FirstTag, lastTag - FirstTag + StrLen('</return>'));
        Success := EDICommonFunctions.CheckErrorMessage(MessageId);
    end;

    procedure ImportarNumero(var tNum: Text[1024]; iDec: Integer)
    begin
        if tNum <> '' then begin
            tNum := ConvertStr(tNum, '.', ',');
            if StrPos(tNum, ',') = 0 then
                tNum := CopyStr(tNum, 1, StrLen(tNum) - iDec) + ',' + CopyStr(tNum, StrLen(tNum) - iDec + 1)
        end
    end;

    procedure ImportarFecha(var tFecha: Text[1024])
    begin
        if tFecha <> '' then
            tFecha := StrSubstNo('%1%2%3', CopyStr(tFecha, 7, 2), CopyStr(tFecha, 5, 2), CopyStr(tFecha, 1, 4));
    end;

    procedure ImportFile(OrderFile: Text; customer: Text; type: Enum ABPEDIDocumentType)
    var
        ImportExportPanel: Record ABPEDIImportExportPanel;
        char1: char;
        char2: char;
        IStream: InStream;
        OStream: OutStream;
        ExitText: Text;
        fileToImport: Text;
    begin
        ImportExportPanel.Validate("Entry No.", ImportExportPanel.GetLastEntryNo());
        ImportExportPanel.Insert();
        ImportExportPanel.Validate("Creation Date", WorkDate());
        ImportExportPanel.Validate("Document Type", type);
        ImportExportPanel.Validate("Created By", customer);
        Clear(ImportExportPanel.File);
        ImportExportPanel.File.CreateOutStream(OStream);
        OStream.Write(OrderFile);
        ImportExportPanel.Modify();
    end;

    local procedure GetWSSetups(var _CustomWebService: record "ABP Custom Web Service"; var _WebServiceSetup: record "ABP Web Service Setup"): Boolean
    var
        soapSetup: record ABPEDISOAPSetup;
    begin
        soapSetup.Get();

        soapSetup.TestField(WSDefaultAPIRequest);
        _CustomWebService.Get(soapSetup.WSDefaultAPIRequest);

        if not _CustomWebService.Enabled then
            exit(false);

        _WebServiceSetup.Get(_CustomWebService."Connection Code");

        if not _WebServiceSetup.Enabled then
            exit(false);

        exit(true);
    end;
}