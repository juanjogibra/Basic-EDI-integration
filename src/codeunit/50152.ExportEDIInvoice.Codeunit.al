codeunit 50152 "ABPEDIExportEDIInvoice"
{
    TableNo = ABPEDIOutboundBox;
    trigger OnRun()
    begin

    end;

    var
        EDICommonFunctions: Codeunit ABPEDIEDICommonsFunctions;


    procedure SendSalesInvoice(var aMessage: Text; var aReference: Code[20])
    var
        Setup: record ABPEDISOAPSetup;
        SalesInvoice: Record "Sales Invoice Header";
        Result: Text;
        Parameters: XmlDocument;
        SOAPEnvURI: text;
        UebURI: text;
        Body: XmlElement;
        Envelope: XmlElement;
        Header: XMLElement;
        PublishWS: XmlElement;
        Response: Text;
        RESTHelper: Codeunit "ABP REST Helper";
        EDICommonFunctions: Codeunit ABPEDIEDICommonsFunctions;
        customWebService: record "ABP Custom Web Service";
        webServiceParm: record "ABP Web Service Parm";
        webServiceSetup: record "ABP Web Service Setup";
        OAuth2Helper: Codeunit "ABP OAuth2 Helper";
    begin
        if not setup.Get() then
            Error('Se necesita la configuración de SOAP, ingrese la URL, el ID de usuario y la contraseña.');

        if not GetWSSetups(customWebService, webServiceSetup) then
            exit;

        //Creation attributes
        SOAPEnvURI := 'http://schemas.xmlsoap.org/soap/envelope/'; //soapenv
        UebURI := 'UEBIBrokerInterface'; //ueb       

        //Creation Tags
        Envelope := XmlElement.Create('Envelope', SOAPEnvURI);
        Header := XmlElement.Create('Header', SOAPEnvURI);
        Body := XmlElement.Create('Body', SOAPEnvURI);
        PublishWS := XmlElement.Create('TEBIBrokerInterface_PublishWS', UebURI); //Asignamos el atributo Soapenv a la etiqueta subscriptionWS

        //Adding Attributes
        Envelope.Add(XmlAttribute.CreateNamespaceDeclaration('soapenv', SOAPEnvURI));
        Envelope.Add(XmlAttribute.CreateNamespaceDeclaration('ueb', UebURI));

        PublishWS.Add(EDICommonFunctions.AddField('aClientId', Setup.User));
        PublishWS.Add(EDICommonFunctions.AddField('aUser', Setup.User));
        PublishWS.Add(EDICommonFunctions.AddField('aPassword', Setup.password));
        PublishWS.Add(EDICommonFunctions.AddField('aDomain', 'PRODUCCION'));
        PublishWS.Add(EDICommonFunctions.AddField('aApplication', setup.User));
        PublishWS.Add(EDICommonFunctions.AddField('aSchema', 'FACTURA_D93V26_LOT_B88462726'));
        PublishWS.Add(EDICommonFunctions.AddField('aDestination', 'B88462726_EDIWIN'));
        PublishWS.Add(EDICommonFunctions.AddField('aReference', aReference));
        PublishWS.Add(EDICommonFunctions.AddField('aMessage', aMessage));
        PublishWS.Add(EDICommonFunctions.AddField('aMessageFormat', '1'));
        PublishWS.Add(EDICommonFunctions.AddField('aDuplicates', '0'));

        Body.Add(PublishWS);

        Envelope.Add(Header);
        Envelope.Add(Body);

        //XML Document
        Parameters := XmlDocument.Create();
        Parameters.Add(Envelope);

        Result := EDICommonFunctions.CallWebService(Parameters, customWebService."Request URL");

        EDICommonFunctions.ProcessReturnResponse(Result, Response);

    end;




    local procedure SendTo(_OutboundBox: Record ABPEDIOutboundBox)
    var
        customWebService: record "ABP Custom Web Service";
        webServiceParm: record "ABP Web Service Parm";
        webServiceSetup: record "ABP Web Service Setup";
        OAuth2Helper: Codeunit "ABP OAuth2 Helper";
        RESTHelper: Codeunit "ABP REST Helper";
        base64Convert: codeunit "Base64 Convert";
        httpRequest: Enum ABPEDIHTTPRequest;
        requestUrlLbl: Label '%1(%2)', Locked = true;
        bearerLbl: Label 'Bearer %1', Locked = true;
        accessToken: Text;
        authorizationText: Text;
        URL: Text;
    begin
        if not GetWSSetups(customWebService, webServiceSetup) then
            exit;

        RESTHelper.Initialize(format(httpRequest::POST), '');


        case webServiceSetup."Auth Type" of
            webServiceSetup."Auth Type"::Basic:
                begin
                    authorizationText := StrSubstNo('%1:%2', webServiceSetup.User, webServiceSetup.Password);
                    authorizationText := base64Convert.ToBase64(authorizationText);
                    restHelper.AddRequestHeader('Authorization', StrSubstNo('Basic %1', authorizationText));
                end;
            webServiceSetup."Auth Type"::Bearer:
                begin
                    accessToken := webServiceSetup.Token; //Opción 1        
                    RESTHelper.AddRequestHeader('Authorization', StrSubstNo(bearerLbl, accessToken));
                end;
            webServiceSetup."Auth Type"::OAuth2:
                begin
                    webServiceParm.SetCurrentKey(Code);
                    webServiceParm.SetRange(Code, webServiceSetup.Code);
                    accessToken := OAuth2Helper.GetAccessToken(webServiceSetup."Token URL", webServiceParm);
                    RESTHelper.AddRequestHeader('Authorization', StrSubstNo(bearerLbl, accessToken));
                end;
        end;

        RESTHelper.AddRequestHeader('', '');
        RESTHelper.SetContentType('application/json');
        RESTHelper.AddBody('');
        RESTHelper.Send();
        if not RESTHelper.GetIsSuccessStatusCode() then
            Error(RESTHelper.GetResponseContentAsText());
        Commit();
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