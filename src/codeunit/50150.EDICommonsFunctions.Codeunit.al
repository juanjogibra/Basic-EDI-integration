codeunit 50150 "ABPEDIEDICommonsFunctions"
{
    Description = 'EDI.Pedidos, EDI.Facturas, EDI.Albaran';

    
    procedure SetNumberToText(Num: Decimal; LongENT: Integer; LongDEC: Integer) tText: Text[50]
    var
        Signov: Text[1];
        Numv: Text[30];
    begin
        tText := Format(Num * Power(10, LongDEC), 0, StrSubstNo('<Sign><Integer>', LongENT));

        while StrLen(tText) < LongENT do
            if CopyStr(tText, 1, 1) = '-' then
                tText := CopyStr(tText, 1, 1) + '0' + CopyStr(tText, 2)
            else
                tText := '0' + tText;
    end;

    procedure SetDateToText(dFecha: Date) tFecha: Text[8]
    begin
        if dFecha <> 0D then
            tFecha := Format(dFecha, 0, '<Year4,4><Month,2><Day,2>');
    end;

    procedure FormatDate(var FormattedDate: Text[1024]; InitialDate: Date)
    begin
        if InitialDate <> 0D then
            FormattedDate := FORMAT(InitialDate, 0, '<Year4><Month,2><Day,2>');
    end;   


    procedure ProcessResponse(TxtOut: Text; var aMessage: Text; var aReturn: Text)
    var
        XMLBuffer: record "XML Buffer" temporary;
        ImportOrdersFilesEDI: Report ABPEDIImportEDIOrders;
        FirstEnvelope: integer;
        lastEnvelope: Integer;
        ConvertedFile: Text;
        ResponseBase64: Text;
        returnValue: Text;
        xmlText: text;
    begin
        FirstEnvelope := (TxtOut.IndexOf('<aMessage>')) + (StrLen('<aMessage>'));
        lastEnvelope := (TxtOut.LastIndexOf('</aMessage>')) - (StrLen('</aMessage>'));
        xmlText := CopyStr(TxtOut, FirstEnvelope, lastEnvelope - FirstEnvelope + StrLen('</aMessage>'));

        FirstEnvelope := (TxtOut.IndexOf('<return>')) + (StrLen('<return>'));
        lastEnvelope := (TxtOut.LastIndexOf('</return>')) - (StrLen('</return>'));
        returnValue := CopyStr(TxtOut, FirstEnvelope, lastEnvelope - FirstEnvelope + StrLen('</return>'));
        CheckErrorMessage(returnValue);
        aReturn := returnValue;
        aMessage := (ConvertFromBase64(xmlText));
    end;  


    procedure ProcessReturnResponse(TxtIn: Text; var TxtOut: Text)
    var
        FirstTag: integer;
        lastTag: Integer;
    begin
        FirstTag := (TxtIn.IndexOf('<return>')) + (StrLen('<return>'));
        lastTag := (TxtIn.LastIndexOf('</return>')) - (StrLen('</return>'));
        TxtOut := CopyStr(TxtIn, FirstTag, lastTag - FirstTag + StrLen('</return>'));

        CheckErrorMessage(TxtOut);
    end;

    procedure ConvertFromBase64(ResponseBase64: Text): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
    begin
        exit(Base64Convert.FromBase64(ResponseBase64));
    end;

    procedure ConvertToBase64(ResponseText: Text): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
    begin
        exit(Base64Convert.ToBase64(ResponseText));
    end;

    procedure AddField(Name: Text; Value: Text): XmlElement;
    var
        e: XmlElement;
    begin
        e := XmlElement.Create(Name);
        e.Add(Value);
        exit(e);
    end;

    procedure CallWebService(_XMLDoc: XmlDocument; URI: Text[100]): Text
    var
        SOAPSetup: record ABPEDISOAPSetup;
        TypeHelper: Codeunit "Type Helper";
        SOAPSetupIsNeededErr: Label 'Se necesita la configuraci??n de SOAP, ingrese la URL, el ID de usuario y la contrase??a.';
        HttpClient: HttpClient;
        requestContent: HttpContent;
        RequestContenttHeader: HttpHeaders;
        responseMessage: HttpResponseMessage;
        TxtOut, XMLtxt: Text;      
        XmlOut: XmlDocument;
    begin
        if not SOAPSetup.Get() then
            Error(SOAPSetupIsNeededErr);
        _XMLDoc.WriteTo(XmlTxt);

        requestContent.WriteFrom(XMLtxt);
        requestContent.GetHeaders(RequestContenttHeader);
        RequestContenttHeader.Remove('Content-Type');
        RequestContenttHeader.Add('Content-Type', 'text/xml');

        if HttpClient.Post(URI, requestContent, responseMessage) then begin
            if responseMessage.HttpStatusCode() = 200 then begin
                responseMessage.Content().ReadAs(TxtOut);
                exit(TxtOut)
            end else begin
                error('Error en la llamada al m??todo del servicio web (c??digo de estado %1)', responseMessage.HttpStatusCode());
            end;
        end else begin
            error('No se puede contactar con el m??todo %1, error de conexi??n!', URI);
        end;
    end;   

    procedure CheckErrorMessage(ReturnValue: Text): Boolean
    var
        Error1: label 'Error durante la publicacion';
        Error2: label 'Publicacion no autorizada';
        Error3: label 'Aplicaci??n destino no encontrada';
        Error4: label 'Documento incorrecto acorde a la validaci??n sint??ctica del esquema';
        Error5: Label 'La aplicaci??n destino no acepta la suscripci??n';
        Error7: Label 'Usuario no autorizado a la suscripci??n';
        Error8: Label 'La aplicaci??n destino no acepta la suscripci??n';
        Error9: label 'El dominio no permite publicaciones BROADCAST';
        Error10: Label 'El documento no se ha insertado correctamente en la base de datos';
        Error11: Label 'Problema generando las suscripciones';
        Error12: Label 'Error registrando la sesi??n';
        Error16: Label 'Tama??o de la publicaci??n excedido';
        Error21: Label 'Aplicaci??n destino no se encuentra en la lista de aplicaciones permitidas';
        Error22: Label 'Aplicaci??n destino se encuentra en la lista de aplicaciones denegadas';
        Error23: Label 'Aplicaci??n origen no se encuentra en la lista de aplicaciones permitidas';
        Error24: Label 'Aplicaci??n origen se encuentra en la lista de aplicaciones denegadas';

    begin
        case ReturnValue of
            '-1':
                error(Error1);
            '-2':
                error(Error2);
            '-3':
                error(Error3);
            '-4':
                error(Error4);
            '-5':
                error(Error5);
            '-7':
                error(Error7);
            '-8':
                error(Error8);
            '-9':
                error(Error9);
            '-10':
                error(Error10);
            '-11':
                error(Error11);
            '-12':
                error(Error12);
            '-16':
                error(Error16);
            '-21':
                error(Error21);
            '-22':
                error(Error22);
            '-23':
                error(Error23);
            '-24':
                error(Error24);
            else
                exit(true);
        end;
    end;

    procedure ClearVariables(var OStream: OutStream; var IStream: InStream; var Salida: Text; var ConvertedText: Text; var tempBlob: Codeunit "Temp Blob")
    begin
        Clear(ConvertedText);
        Clear(OStream);
        Clear(tempBlob);
        Clear(IStream);
        Clear(Salida);
    end;
}

