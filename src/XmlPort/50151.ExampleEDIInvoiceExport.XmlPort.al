xmlport 50151 "ABPEDIExampleEDIInvoiceExport"
{
    Caption = 'Export EDI Sales Invoice (v26)', comment = 'Exportacion Factura Venta EDI V26';
    Direction = Export;
    Format = FixedText;
    UseRequestPage = false;
    TableSeparator = '<None>';
    RecordSeparator = '<None>';
    schema
    {
        textelement(Root)
        {

            tableelement(CABECERA; "Sales Invoice Header")
            {

                textelement(vETIQUETA) { Width = 8; trigger OnBeforePassVariable() begin vETIQUETA := 'CABECERA'; end; }
                fieldelement(vNUMFAC; CABECERA."No.") { Width = 15; }
                textelement(vVENDEDOR)
                {
                    Width = 17;
                    trigger OnBeforePassVariable()
                    var
                        companyInfo: Record "Company Information";
                    begin
                        if companyInfo.FindSet() then
                            vVENDEDOR := companyInfo.ABPEDIEDICode;  //8473099085005
                    end;
                }
                textelement(vEMISOR) { Width = 17; trigger OnBeforePassVariable() begin vEMISOR := ''; end; }
                textelement(vCOBRADOR) { Width = 17; trigger OnBeforePassVariable() begin vCOBRADOR := ''; end; }
                textelement(vCOMPRADO)
                {
                    Width = 17;
                    trigger OnBeforePassVariable()
                    var
                        Customer: Record Customer;
                        ShipToAddress: Record "Ship-to Address";
                    begin
                        if customer.get(CABECERA."Bill-to Customer No.") then
                            if ShipToAddress.Get(customer."No.", Customer."Ship-to Code") then
                                vCOMPRADO := ShipToAddress.ABPEDIQPIDE;
                    end;
                }
                textelement(vDEPTO) { Width = 13; trigger OnBeforePassVariable() begin vDEPTO := ''; end; }
                textelement(vRECEPTOR)
                {
                    Width = 17;
                    trigger OnBeforePassVariable()
                    var
                        customer: Record Customer;
                    begin
                        if customer.Get(CABECERA."Bill-to Customer No.") then
                            vRECEPTOR := customer.ABPEDIEDICode;
                    end;
                }
                textelement(vCLIENTE)
                {
                    Width = 17;
                    trigger OnBeforePassVariable()
                    var
                        customer: Record Customer;
                        ShipToAddress: Record "Ship-to Address";
                    begin
                        if customer.Get(CABECERA."Bill-to Customer No.") then
                            if ShipToAddress.Get(customer."No.", Customer."Ship-to Code") then
                                vCLIENTE := ShipToAddress.ABPEDIAQSF;
                    end;
                }
                textelement(vPAGADOR) { Width = 17; trigger OnBeforePassVariable() begin vPAGADOR := ''; end; }
                fieldelement(vPEDIDO; CABECERA."External Document No.") { Width = 17; } //>JGF 2021/07/27 Hemos revertido "Order No" por "External Document No"
                textelement(vFECHA)
                {
                    Width = 12;
                    trigger OnBeforePassVariable()
                    begin
                        if CABECERA."Document Date" <> 0D then
                            cEDI.FormatDate(vFECHA, CABECERA."Document Date");
                    end;
                }
                textelement(vNODO) { Width = 3; trigger OnBeforePassVariable() begin vNODO := '380'; end; }
                textelement(vFUNCION) { Width = 3; trigger OnBeforePassVariable() begin vFUNCION := '9'; end; }
                fieldelement(vRSOCIAL; CABECERA."Bill-to Name") { Width = 70; }
                fieldelement(vCALLE; CABECERA."Bill-to Address") { Width = 35; }
                fieldelement(vCIUDAD; CABECERA."Bill-to City") { Width = 35; }
                fieldelement(vCP; CABECERA."Bill-to Post Code") { Width = 5; }
                textelement(vNIF)
                {
                    Width = 17;
                    trigger OnBeforePassVariable()
                    var
                        vCust: Record customer;
                    begin
                        if (CABECERA."VAT Country/Region Code" <> '') and (CABECERA."VAT Registration No." <> '') then
                            vNIF := CABECERA."VAT Country/Region Code" + CABECERA."VAT Registration No."
                        else
                            if vCust.get(CABECERA."Bill-to Customer No.") then
                                vNIF := vCust."Country/Region Code" + vCust."VAT Registration No.";
                    end;
                }
                textelement(vRAZON) { Width = 3; trigger OnBeforePassVariable() begin vRAZON := ''; end; }
                textelement(vALBARAN)
                {
                    Width = 17;
                    trigger OnBeforePassVariable()
                    var
                        SalesShipmentHeader: Record "Sales Shipment Header";
                    begin
                        SalesShipmentHeader.SetRange("Order No.", CABECERA."Order No.");
                        if SalesShipmentHeader.FindSet() then
                            ShipmentNo := SalesShipmentHeader."No.";
                        vALBARAN := ShipmentNo;
                    end;
                }
                textelement(vCONTRATO)
                {
                    Width = 19; //Anteriormente 17
                    trigger OnBeforePassVariable()
                    begin
                        vCONTRATO := CompanyInfo.ABPEDIContractNo; //ES8473099085005INVI
                    end;
                }
                textelement(vNFACSUS) { Width = 17; trigger OnBeforePassVariable() begin vNFACSUS := ''; end; }
                textelement(vFPAG) { Width = 3; trigger OnBeforePassVariable() begin vFPAG := ''; end; }
                textelement(vDIVISA) { Width = 3; trigger OnBeforePassVariable() begin vDIVISA := 'EUR'; end; }
                textelement(vSUMBRUTO)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvoiceLine: Record "Sales Invoice Line";
                    begin
                        Clear(TotalGrossAmount);
                        SalesInvoiceLine.SetRange("Document No.", CABECERA."No.");
                        if SalesInvoiceLine.FindSet() then
                            repeat
                                TotalGrossAmount := TotalGrossAmount + (SalesInvoiceLine."Unit Price" * SalesInvoiceLine.Quantity);
                            until SalesInvoiceLine.Next() = 0;
                        vSUMBRUTO := cEDI.SetNumberToText(TotalGrossAmount, 15, 3);
                    end;
                }
                textelement(vSUMNETOS)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvoiceLine: Record "Sales Invoice Line";
                    begin
                        Clear(TotalNetAmount);
                        SalesInvoiceLine.SetRange("Document No.", CABECERA."No.");
                        if SalesInvoiceLine.FindSet() then
                            repeat
                                TotalNetAmount := TotalNetAmount + SalesInvoiceLine."Line Amount";
                            until SalesInvoiceLine.Next() = 0;
                        vSUMNETOS := cEDI.SetNumberToText(TotalNetAmount, 15, 3);
                    end;
                }
                textelement(vCARGOS) { Width = 15; trigger OnBeforePassVariable() begin vCARGOS := '0'; end; }
                textelement(vDESCUEN)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvoiceLine: Record "Sales Invoice Line";
                        InvDiscAmount: Decimal;
                        PmtDiscAmount: Decimal;
                    begin
                        Clear(TotalInvDiscAmount);
                        SalesInvoiceLine.SetRange("Document No.", CABECERA."No.");
                        if SalesInvoiceLine.FindSet() then
                            repeat
                                InvDiscAmount := InvDiscAmount + SalesInvoiceLine."Inv. Discount Amount";
                                PmtDiscAmount := PmtDiscAmount + SalesInvoiceLine."Pmt. Discount Amount";
                                TotalInvDiscAmount := TotalInvDiscAmount + (InvDiscAmount + PmtDiscAmount);
                            until SalesInvoiceLine.Next() = 0;
                        vDESCUEN := cEDI.SetNumberToText(TotalInvDiscAmount, 15, 3);
                    end;
                }
                textelement(vBASEIMP1)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        vBASEIMP1 := cEDI.SetNumberToText(BaseImp[1], 15, 3);
                    end;
                }
                textelement(vTIPOIMP1)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    begin
                        vTIPOIMP1 := TipoImp[1];
                    end;
                }
                textelement(vTASAIMP1)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        vTASAIMP1 := cEDI.SetNumberToText(PorcImp[1], 8, 3);
                    end;
                }
                textelement(vIMPIMP1)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvLine: record "Sales Invoice Line";
                    begin
                        vIMPIMP1 := cEDI.SetNumberToText(ImpImp[1], 15, 3);
                    end;
                }
                textelement(vBASEIMP2)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if BaseImp[2] = 0 then
                            vBASEIMP2 := ''
                        else
                            vBASEIMP2 := cEDI.SetNumberToText(BaseImp[2], 15, 3);
                    end;
                }
                textelement(vTIPOIMP2)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    begin
                        if TipoImp[2] = '' then
                            vTIPOIMP2 := ''
                        else
                            vTIPOIMP2 := TipoImp[2];
                    end;
                }
                textelement(vTASAIMP2)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        if PorcImp[2] = 0 then
                            vTASAIMP2 := ''
                        else
                            vTASAIMP2 := cEDI.SetNumberToText(PorcImp[2], 8, 3);
                    end;
                }
                textelement(vIMPIMP2)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if ImpImp[2] = 0 then
                            vIMPIMP2 := ''
                        else
                            vIMPIMP2 := cEDI.SetNumberToText(ImpImp[2], 15, 3);
                    end;
                }
                textelement(vBASEIMP3)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if BaseImp[3] = 0 then
                            vBASEIMP3 := ''
                        else
                            vBASEIMP3 := cEDI.SetNumberToText(BaseImp[3], 15, 3);
                    end;
                }
                textelement(vTIPOIMP3)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    begin
                        if TipoImp[3] = '' then
                            vTIPOIMP3 := ''
                        else
                            vTIPOIMP3 := TipoImp[3];
                    end;
                }
                textelement(vTASAIMP3)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        if PorcImp[3] = 0 then
                            vTASAIMP3 := ''
                        else
                            vTASAIMP3 := cEDI.SetNumberToText(PorcImp[3], 8, 3);
                    end;
                }
                textelement(vIMPIMP3)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if PorcImp[3] = 0 then
                            vTASAIMP3 := ''
                        else
                            vIMPIMP3 := cEDI.SetNumberToText(ImpImp[3], 15, 3);
                    end;
                }
                textelement(vBASEIMP4)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if BaseImp[4] = 0 then
                            vBASEIMP4 := ''
                        else
                            vBASEIMP4 := cEDI.SetNumberToText(BaseImp[4], 15, 3);
                    end;
                }
                textelement(vTIPOIMP4)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    begin
                        if TipoImp[4] = '' then
                            vTIPOIMP4 := ''
                        else
                            vTIPOIMP4 := TipoImp[4];
                    end;
                }
                textelement(vTASAIMP4)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        if PorcImp[4] = 0 then
                            vTASAIMP4 := ''
                        else
                            vTASAIMP4 := cEDI.SetNumberToText(PorcImp[4], 8, 3);
                    end;
                }
                textelement(vIMPIMP4)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if ImpImp[4] = 0 then
                            vIMPIMP4 := ''
                        else
                            vIMPIMP4 := cEDI.SetNumberToText(ImpImp[4], 15, 3);
                    end;
                }
                textelement(vBASEIMP5)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if BaseImp[5] = 0 then
                            vBASEIMP5 := ''
                        else
                            vBASEIMP5 := cEDI.SetNumberToText(BaseImp[5], 15, 3);
                    end;
                }
                textelement(vTIPOIMP5)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    begin
                        if TipoImp[5] = '' then
                            vTIPOIMP5 := ''
                        else
                            vTIPOIMP5 := TipoImp[5];
                    end;
                }
                textelement(vTASAIMP5)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        if PorcImp[5] = 0 then
                            vTASAIMP5 := ''
                        else
                            vTASAIMP5 := cEDI.SetNumberToText(PorcImp[5], 8, 3);
                    end;
                }
                textelement(vIMPIMP5)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if ImpImp[5] = 0 then
                            vIMPIMP5 := ''
                        else
                            vIMPIMP5 := cEDI.SetNumberToText(ImpImp[5], 15, 3);
                    end;
                }
                textelement(vBASEIMP6)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if BaseImp[6] = 0 then
                            vBASEIMP6 := ''
                        else
                            vBASEIMP6 := cEDI.SetNumberToText(BaseImp[6], 15, 3);
                    end;
                }
                textelement(vTIPOIMP6)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    begin
                        if TipoImp[6] = '' then
                            vTIPOIMP6 := ''
                        else
                            vTIPOIMP6 := TipoImp[6];
                    end;
                }
                textelement(vTASAIMP6)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        if PorcImp[6] = 0 then
                            vTASAIMP6 := ''
                        else
                            vTASAIMP6 := cEDI.SetNumberToText(PorcImp[6], 8, 3);
                    end;
                }
                textelement(vIMPIMP6)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    begin
                        if ImpImp[6] = 0 then
                            vIMPIMP6 := ''
                        else
                            vIMPIMP6 := cEDI.SetNumberToText(ImpImp[6], 15, 3);
                    end;
                }
                textelement(vBASIMPFA)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvoiceLine: Record "Sales Invoice Line";
                    begin
                        Clear(TotalGrossAmount);
                        SalesInvoiceLine.SetRange("Document No.", CABECERA."No.");
                        if SalesInvoiceLine.FindSet() then
                            repeat
                                TotalGrossAmount := TotalGrossAmount + SalesInvoiceLine."Line Amount";
                            until SalesInvoiceLine.Next() = 0;
                        //vBASIMPFA := Format(TotalGrossAmount);
                        vBASIMPFA := cEDI.SetNumberToText(TotalGrossAmount, 15, 3);
                    end;
                }
                textelement(vTOTIMP)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvoiceLine: Record "Sales Invoice Line";
                    begin
                        Clear(TotalInvDiscAmount);
                        SalesInvoiceLine.SetRange("Document No.", CABECERA."No.");
                        if SalesInvoiceLine.FindSet() then
                            repeat
                                //TotalInvDiscAmount := TotalInvDiscAmount + SalesInvoiceLine."Inv. Discount Amount";
                                if SalesInvoiceLine."Amount Including VAT" >= SalesInvoiceLine.Amount then
                                    TotalInvDiscAmount := TotalInvDiscAmount + (SalesInvoiceLine."Amount Including VAT" - SalesInvoiceLine.Amount)
                            until SalesInvoiceLine.Next() = 0;
                        vTOTIMP := cEDI.SetNumberToText(TotalInvDiscAmount, 15, 3);
                    end;
                }
                textelement(vTOTAL)
                {
                    Width = 15;
                    trigger OnBeforePassVariable()
                    var
                        SalesInvoiceLine: Record "Sales Invoice Line";
                    begin
                        Clear(TotalNetAmount);
                        SalesInvoiceLine.SetRange("Document No.", CABECERA."No.");
                        if SalesInvoiceLine.FindSet() then
                            repeat
                                TotalNetAmount := TotalNetAmount + SalesInvoiceLine."Amount Including VAT";
                            until SalesInvoiceLine.Next() = 0;
                        //vTOTAL := Format(TotalNetAmount);
                        vTOTAL := cEDI.SetNumberToText(TotalNetAmount, 15, 3);
                    end;
                }
                textelement(vVTO1) { Width = 8; trigger OnBeforePassVariable() begin vVTO1 := ''; end; }
                textelement(vIMPVTO1) { Width = 15; trigger OnBeforePassVariable() begin vIMPVTO1 := ''; end; }
                textelement(vVTO2) { Width = 8; trigger OnBeforePassVariable() begin vVTO2 := ''; end; }
                textelement(vIMPVTO2) { Width = 15; trigger OnBeforePassVariable() begin vIMPVTO2 := ''; end; }
                textelement(vVTO3) { Width = 8; trigger OnBeforePassVariable() begin vVTO3 := ''; end; }
                textelement(vIMPVTO3) { Width = 15; trigger OnBeforePassVariable() begin vIMPVTO3 := ''; end; }
                textelement(vTPVERDE) { Width = 15; trigger OnBeforePassVariable() begin vTPVERDE := ''; end; }
                textelement(vCALIF1) { Width = 3; trigger OnBeforePassVariable() begin vCALIF1 := 'C'; end; }
                textelement(vSECUEN1) { Width = 2; trigger OnBeforePassVariable() begin vSECUEN1 := '1'; end; }
                textelement(vTIPO1)
                {
                    Width = 3;
                    trigger OnBeforePassVariable()
                    var
                        Item: Record Item;
                        SIL: Record "Sales Invoice Line";
                    begin
                        SIL.SetRange("Document No.", CABECERA."No.");
                        if SIL.FindFirst() then
                            if SIL.ABPEDICanonType <> '' then
                                vTIPO1 := SIL.ABPEDICanonType
                            else
                                if item.Get(SIL."No.") then
                                    if item."Item Category Code" <> '' then
                                        vTIPO1 := item."Item Category Code";
                    end;
                }
                textelement(vPORCEN1) { Width = 8; trigger OnBeforePassVariable() begin vPORCEN1 := ''; end; }
                textelement(vIMPDES1) { Width = 15; trigger OnBeforePassVariable() begin vIMPDES1 := ''; end; }
                textelement(vCALIF2) { Width = 3; trigger OnBeforePassVariable() begin vCALIF2 := ''; end; }
                textelement(vSECUEN2) { Width = 2; trigger OnBeforePassVariable() begin vSECUEN2 := ''; end; }
                textelement(vTIPO2) { Width = 3; trigger OnBeforePassVariable() begin vTIPO2 := ''; end; }
                textelement(vPORCEN2) { Width = 8; trigger OnBeforePassVariable() begin vPORCEN2 := ''; end; }
                textelement(vIMPDES2) { Width = 15; trigger OnBeforePassVariable() begin vIMPDES2 := ''; end; }
                textelement(vCALIF3) { Width = 3; trigger OnBeforePassVariable() begin vCALIF3 := ''; end; }
                textelement(vSECUEN3) { Width = 2; trigger OnBeforePassVariable() begin vSECUEN3 := ''; end; }
                textelement(vTIPO3) { Width = 3; trigger OnBeforePassVariable() begin vTIPO3 := ''; end; }
                textelement(vPORCEN3) { Width = 8; trigger OnBeforePassVariable() begin vPORCEN3 := ''; end; }
                textelement(vIMPDES3) { Width = 15; trigger OnBeforePassVariable() begin vIMPDES3 := ''; end; }
                textelement(vCALIF4) { Width = 3; trigger OnBeforePassVariable() begin vCALIF4 := ''; end; }
                textelement(vSECUEN4) { Width = 2; trigger OnBeforePassVariable() begin vSECUEN4 := ''; end; }
                textelement(vTIPO4) { Width = 3; trigger OnBeforePassVariable() begin vTIPO4 := ''; end; }
                textelement(vPORCEN4) { Width = 8; trigger OnBeforePassVariable() begin vPORCEN4 := ''; end; }
                textelement(vIMPDES4) { Width = 15; trigger OnBeforePassVariable() begin vIMPDES4 := ''; end; }
                textelement(vCALIF5) { Width = 3; trigger OnBeforePassVariable() begin vCALIF5 := ''; end; }
                textelement(vSECUEN5) { Width = 2; trigger OnBeforePassVariable() begin vSECUEN5 := ''; end; }
                textelement(vTIPO5) { Width = 3; trigger OnBeforePassVariable() begin vTIPO5 := ''; end; }
                textelement(vPORCEN5) { Width = 8; trigger OnBeforePassVariable() begin vPORCEN5 := ''; end; }
                textelement(vIMPDES5) { Width = 15; trigger OnBeforePassVariable() begin vIMPDES5 := ''; end; }
                textelement(vERSOCIAL) { Width = 70; trigger OnBeforePassVariable() begin vERSOCIAL := CompanyInfo.Name; end; }
                textelement(vECALLE) { Width = 35; trigger OnBeforePassVariable() begin vECALLE := CompanyInfo.Address; end; }
                textelement(vEPOBLAC) { Width = 35; trigger OnBeforePassVariable() begin vEPOBLAC := CompanyInfo.City; end; }
                textelement(vECP) { Width = 5; trigger OnBeforePassVariable() begin vECP := CompanyInfo."Post Code"; end; }
                textelement(vENIF) { Width = 17; trigger OnBeforePassVariable() begin vENIF := CompanyInfo."VAT Registration No."; end; }
                textelement(vERMERCA)
                {
                    Width = 70;
                    trigger OnBeforePassVariable()
                    begin
                        //   vERMERCA := CompanyInfo."Registration No.";
                        vERMERCA := 'Madrid, Tomo 39600, Folio 22, Sección 8, Hoja M 702844, Inscripción 1';
                    end;
                }
                textelement(vNOTAC) { Width = 17; trigger OnBeforePassVariable() begin vNOTAC := ''; end; }
                textelement(vNUMREL) { Width = 17; trigger OnBeforePassVariable() begin vNUMREL := ''; end; }
                textelement(vRECOGIDA) { Width = 17; trigger OnBeforePassVariable() begin vRECOGIDA := ''; end; }
                textelement(vDESTINO) { Width = 17; trigger OnBeforePassVariable() begin vDESTINO := ''; end; }
                textelement(vFECHAEFE)
                {
                    Width = 12;
                    trigger OnBeforePassVariable()
                    begin
                        if CABECERA."Document Date" <> 0D then
                            cEDI.FormatDate(vFECHAEFE, CABECERA."Document Date");
                    end;
                }
                textelement(vNCONFREC) { Width = 17; trigger OnBeforePassVariable() begin vNCONFREC := ''; end; }
                textelement(vNIDENTICKET) { Width = 17; trigger OnBeforePassVariable() begin vNIDENTICKET := ''; end; }
                textelement(vCONTACTO) { Width = 35; trigger OnBeforePassVariable() begin vCONTACTO := CompanyInfo."Contact Person" end; }
                textelement(vTELEFONO) { Width = 35; trigger OnBeforePassVariable() begin vTELEFONO := CompanyInfo."E-Mail" end; }
                textelement(vFAX) { Width = 35; trigger OnBeforePassVariable() begin vFAX := ''; end; }
                textelement(vCODPROV) { Width = 25; trigger OnBeforePassVariable() begin vCODPROV := ''; end; }
                textelement(vFECALB)
                {
                    Width = 12;
                    trigger OnBeforePassVariable()
                    begin
                        if CABECERA."Shipment Date" <> 0D then
                            cEDI.FormatDate(vFECALB, CABECERA."Shipment Date");
                    end;
                }
                textelement(vNORMEXEN1) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXEN1 := ''; end; }
                textelement(vNORMEXEN2) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXEN2 := ''; end; }
                textelement(vNORMEXEN3) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXEN3 := ''; end; }
                textelement(vNORMEXEN4) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXEN4 := ''; end; }
                textelement(vNORMEXEN5) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXEN5 := ''; end; }
                textelement(vNORMEXEN6) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXEN6 := ''; end; }
                textelement(vFECHADOC) { Width = 8; trigger OnBeforePassVariable() begin vFECHADOC := ''; end; }
                textelement(vREFPAGO) { Width = 35; trigger OnBeforePassVariable() begin vREFPAGO := ''; end; }
                textelement(vORIGEN) { Width = 17; trigger OnBeforePassVariable() begin vORIGEN := ''; end; }
                textelement(vNIFII) { Width = 17; trigger OnBeforePassVariable() begin vNIFII := CompanyInfo."VAT Registration No."; end; }
                textelement(vNIFPE) { Width = 17; trigger OnBeforePassVariable() begin vNIFPE := CompanyInfo."VAT Registration No."; end; }
                fieldelement(vNIFIV; CABECERA."VAT Registration No.") { Width = 17; }
                fieldelement(vNIFPR; CABECERA."VAT Registration No.") { Width = 17; }
                textelement(vNIFSU) { Width = 17; trigger OnBeforePassVariable() begin vNIFSU := CompanyInfo."VAT Registration No."; end; }
                textelement(vNUMMOVI) { Width = 17; trigger OnBeforePassVariable() begin vNUMMOVI := ''; end; }
                textelement(vNUMINCOR) { Width = 17; trigger OnBeforePassVariable() begin vNUMINCOR := ''; end; }
                textelement(vIMPINCOR) { Width = 15; trigger OnBeforePassVariable() begin vIMPINCOR := ''; end; }
                textelement(vFENTMER) { Width = 8; trigger OnBeforePassVariable() begin vFENTMER := ''; end; }
                textelement(vFEMIMEN) { Width = 8; trigger OnBeforePassVariable() begin vFEMIMEN := ''; end; }
                textelement(vNUMMEN) { Width = 35; trigger OnBeforePassVariable() begin vNUMMEN := ''; end; }
                textelement(vPERCFAC) { Width = 16; trigger OnBeforePassVariable() begin vPERCFAC := ''; end; }
                textelement(vFPEDIDO)
                {
                    Width = 12;
                    trigger OnBeforePassVariable()
                    begin
                        if CABECERA."Order Date" <> 0D then
                            cEDI.FormatDate(vFPEDIDO, CABECERA."Order Date");
                    end;
                }
                textelement(vCODAPROB) { Width = 17; trigger OnBeforePassVariable() begin vCODAPROB := ''; end; }
                textelement(vNUMDEVOL) { Width = 17; trigger OnBeforePassVariable() begin vNUMDEVOL := ''; end; }
                textelement(vFNUMDEVOL) { Width = 12; trigger OnBeforePassVariable() begin vFNUMDEVOL := ''; end; }
                textelement(vNOTIFDEVOL) { Width = 17; trigger OnBeforePassVariable() begin vNOTIFDEVOL := ''; end; }
                textelement(vFNOTIFDEVOL) { Width = 12; trigger OnBeforePassVariable() begin vFNOTIFDEVOL := ''; end; }
                textelement(vSEDESOC) { Width = 17; trigger OnBeforePassVariable() begin vSEDESOC := ''; end; }
                textelement(vBUQUE) { Width = 35; trigger OnBeforePassVariable() begin vBUQUE := ''; end; }
                textelement(vFEMBARQUE) { Width = 12; trigger OnBeforePassVariable() begin vFEMBARQUE := ''; end; }
                textelement(vFORWARDER) { Width = 35; trigger OnBeforePassVariable() begin vFORWARDER := ''; end; }
                textelement(vRRSOCIAL) { Width = 70; trigger OnBeforePassVariable() begin vRRSOCIAL := ''; end; }
                textelement(vRCALLE) { Width = 35; trigger OnBeforePassVariable() begin vRCALLE := ''; end; }
                textelement(vRCIUDAD) { Width = 35; trigger OnBeforePassVariable() begin vRCIUDAD := ''; end; }
                textelement(vRCP) { Width = 17; trigger OnBeforePassVariable() begin vRCP := ''; end; }
                textelement(vAGENENIF) { Width = 3; trigger OnBeforePassVariable() begin vAGENENIF := 'ES'; end; }
                textelement(vECAPSOCIAL) { Width = 35; trigger OnBeforePassVariable() begin vECAPSOCIAL := ''; end; }
                textelement(vLUGCARGA) { Width = 35; trigger OnBeforePassVariable() begin vLUGCARGA := ''; end; }
                textelement(vFCARGA) { Width = 12; trigger OnBeforePassVariable() begin vFCARGA := ''; end; }
                textelement(vLUGDESCARGA) { Width = 35; trigger OnBeforePassVariable() begin vLUGDESCARGA := ''; end; }
                textelement(vMATRICULA) { Width = 17; trigger OnBeforePassVariable() begin vMATRICULA := ''; end; }
                textelement(vFENTREGA) { Width = 12; trigger OnBeforePassVariable() begin vFENTREGA := ''; end; }
                textelement(vNUMVEN) { Width = 35; trigger OnBeforePassVariable() begin vNUMVEN := ''; end; }
                textelement(vCPEXT) { Width = 17; trigger OnBeforePassVariable() begin vCPEXT := ''; end; }
                textelement(vECPEXT) { Width = 17; trigger OnBeforePassVariable() begin vECPEXT := ''; end; }
                textelement(vFECFACSUS) { Width = 12; trigger OnBeforePassVariable() begin vFECFACSUS := ''; end; }
                textelement(vEPAIS) { Width = 3; trigger OnBeforePassVariable() begin vEPAIS := 'ES'; end; }
                textelement(vRELVTO) { Width = 3; trigger OnBeforePassVariable() begin vRELVTO := '7'; end; }
                textelement(vDIASVTO) { Width = 3; trigger OnBeforePassVariable() begin vDIASVTO := '0'; end; }
                fieldelement(vPORCVTO; CABECERA."Payment Discount %") { Width = 8; }
                textelement(vTIPOIMPDES1) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPDES1 := 'VAT'; end; }
                textelement(vTASAIMPDES1)
                {
                    Width = 8;
                    trigger OnBeforePassVariable()
                    begin
                        vTASAIMPDES1 := cEDI.SetNumberToText(PorcImp[1], 8, 3);

                    end;
                }
                textelement(vIMPIMPDES1) { Width = 15; trigger OnBeforePassVariable() begin vIMPIMPDES1 := cEDI.SetNumberToText(LINEA.ABPEDICanonAmount, 15, 3); end; }
                textelement(vBASEIMPDES1) { Width = 15; trigger OnBeforePassVariable() begin vBASEIMPDES1 := ''; end; }
                textelement(vTIPOIMPDES2) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPDES2 := ''; end; }
                textelement(vTASAIMPDES2) { Width = 8; trigger OnBeforePassVariable() begin vTASAIMPDES2 := ''; end; }
                textelement(vIMPIMPDES2) { Width = 15; trigger OnBeforePassVariable() begin vIMPIMPDES2 := ''; end; }
                textelement(vBASEIMPDES2) { Width = 15; trigger OnBeforePassVariable() begin vBASEIMPDES2 := ''; end; }
                textelement(vTIPOIMPDES3) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPDES3 := ''; end; }
                textelement(vTASAIMPDES3) { Width = 8; trigger OnBeforePassVariable() begin vTASAIMPDES3 := ''; end; }
                textelement(vIMPIMPDES3) { Width = 15; trigger OnBeforePassVariable() begin vIMPIMPDES3 := ''; end; }
                textelement(vBASEIMPDES3) { Width = 15; trigger OnBeforePassVariable() begin vBASEIMPDES3 := ''; end; }
                textelement(vTIPOIMPDES4) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPDES4 := ''; end; }
                textelement(vTASAIMPDES4) { Width = 8; trigger OnBeforePassVariable() begin vTASAIMPDES4 := ''; end; }
                textelement(vIMPIMPDES4) { Width = 15; trigger OnBeforePassVariable() begin vIMPIMPDES4 := ''; end; }
                textelement(vBASEIMPDES4) { Width = 15; trigger OnBeforePassVariable() begin vBASEIMPDES4 := ''; end; }
                textelement(vTIPOIMPDES5) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPDES5 := ''; end; }
                textelement(vTASAIMPDES5) { Width = 8; trigger OnBeforePassVariable() begin vTASAIMPDES5 := ''; end; }
                textelement(vIMPIMPDES5) { Width = 15; trigger OnBeforePassVariable() begin vIMPIMPDES5 := ''; end; }
                textelement(vBASEIMPDES5) { Width = 15; trigger OnBeforePassVariable() begin vBASEIMPDES5 := ''; end; }
                textelement(vPAISBY) { Width = 3; trigger OnBeforePassVariable() begin vPAISBY := ''; end; }
                textelement(vREGCRITCAJA) { Width = 1; trigger OnBeforePassVariable() begin vREGCRITCAJA := ''; end; }
                textelement(vTAXCAT) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT := ''; end; }
                textelement(vTAXCAT1) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT1 := ''; end; }
                textelement(vTAXCAT2) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT2 := ''; end; }
                textelement(vTAXCAT3) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT3 := ''; end; }
                textelement(vTAXCAT4) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT4 := ''; end; }
                textelement(vTAXCAT5) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT5 := ''; end; }
                textelement(vTAXCAT6) { Width = 3; trigger OnBeforePassVariable() begin vTAXCAT6 := ''; end; }
                textelement(vAUTORIZDEV) { Width = 35; trigger OnBeforePassVariable() begin vAUTORIZDEV := ''; end; }
                textelement(vNUMPEDVEND) { Width = 35; trigger OnBeforePassVariable() begin vNUMPEDVEND := ''; end; }
                textelement(vFECTAX) { Width = 12; trigger OnBeforePassVariable() begin vFECTAX := ''; end; }

                tableelement(OBSFAC; "Sales Comment Line")
                {
                    LinkTable = CABECERA;
                    LinkFields = "No." = field("No.");
                    SourceTableView = where("Document Line No." = filter(= 0));

                    textelement(EspacioComentariosCAB)
                    {
                        Width = 1;
                        trigger OnBeforePassVariable()
                        begin
                            EspacioComentariosCAB := (Format(chr1) + Format(chr2));
                        end;
                    }

                    textelement(vETIQUETAOBS) { Width = 8; trigger OnBeforePassVariable() begin vETIQUETAOBS := 'OBSFAC'; end; }
                    fieldelement(vNUMFAC; OBSFAC."No.") { Width = 15; }
                    fieldelement(vNUMLIN; OBSFAC."Line No.") { Width = 5; }
                    textelement(vTEMA) { Width = 3; trigger OnBeforePassVariable() begin vTEMA := 'AAI'; end; }
                    fieldelement(vTEXTOOBS1; OBSFAC.Comment) { Width = 70; }
                    textelement(vTEXTOOBS2) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBS2 := ''; end; }
                    textelement(vTEXTOOBS3) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBS3 := ''; end; }
                    textelement(vTEXTOOBS4) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBS4 := ''; end; }
                    textelement(vTEXTOOBS5) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBS5 := ''; end; }
                    textelement(vIDIOMA) { Width = 3; trigger OnBeforePassVariable() begin vIDIOMA := 'ES'; end; }
                }
                tableelement(LINEA; "Sales Invoice Line")
                {
                    LinkTable = CABECERA;
                    LinkFields = "Document No." = field("No.");
                    SourceTableView = where(Quantity = filter(<> 0), Type = filter(2));

                    textelement(EspacioLINEA)
                    {
                        Width = 1;
                        trigger OnBeforePassVariable()
                        begin
                            EspacioLINEA := (Format(chr1) + Format(chr2));
                        end;
                    }

                    textelement(vETIQUETALIN) { Width = 8; trigger OnBeforePassVariable() begin vETIQUETALIN := 'LINEA'; end; }
                    fieldelement(vNUMFACLIN; LINEA."Document No.") { Width = 15; }
                    textelement(vNUMLIN)
                    {
                        Width = 5;

                        trigger OnBeforePassVariable()
                        begin
                            iLinea += 1;
                            vNUMLIN := format(iLinea);
                        end;
                    }
                    textelement(vREFEAN)
                    {
                        Width = 17;
                        trigger OnBeforePassVariable()
                        var
                            #pragma warning disable AL0432 // TODO - Revisar, ya que esta obsoleto y en alguna versión futura puede desaparecer
                            ItemCrossReference: Record "Item Cross Reference";
                        begin
                            ItemCrossReference.SetRange("Item No.", LINEA."No.");
                            ItemCrossReference.SetRange("Cross-Reference Type", ItemCrossReference."Cross-Reference Type"::Customer);
                            ItemCrossReference.SetRange("Cross-Reference Type No.", LINEA."Bill-to Customer No.");
                            ItemCrossReference.FindSet();
                            vREFEAN := ItemCrossReference."Cross-Reference No.";
                        end;
                    }
                    textelement(vREFCLI) { Width = 35; trigger OnBeforePassVariable() begin vREFCLI := LINEA."No."; end; }
                    textelement(vREFPRO) { Width = 35; trigger OnBeforePassVariable() begin vREFPRO := ''; end; }
                    textelement(vVP) { Width = 2; trigger OnBeforePassVariable() begin vVP := ''; end; }
                    textelement(vCODIGODUN14)
                    {
                        Width = 14;
                        trigger OnBeforePassVariable()
                        begin
                            vCODIGODUN14 := '';
                        end;
                    }
                    textelement(vDESC) { Width = 70; trigger OnBeforePassVariable() begin vDESC := LINEA.Description; end; }
                    textelement(vCFACT)
                    {
                        Width = 15;
                        trigger OnBeforePassVariable()
                        begin
                            vCFACT := cEDI.SetNumberToText(LINEA.Quantity, 15, 3);
                        end;
                    }
                    textelement(vCENT) { Width = 10; trigger OnBeforePassVariable() begin vCENT := ''; end; }
                    textelement(vUMEDIDA)
                    {
                        Width = 3;
                        trigger OnBeforePassVariable()
                        begin
                            if not rUnitofMeasure.Get(LINEA."Unit of Measure Code") then
                                Clear(rUnitofMeasure);
                            vUMEDIDA := rUnitofMeasure.ABPEDIEDICode;
                        end;
                    }
                    textelement(vPRECIOB)
                    {
                        Width = 15;
                        trigger OnBeforePassVariable()
                        var
                            Bruto: Decimal;
                        begin
                            /* Bruto := LINEA."Unit Price" - LINEA."Importe Canon"; //Media Markt ya no requiere el precio bruto
                            vPRECIOB := cEDI.AjustarNumero(Bruto, 15, 3); */
                            vPRECIOB := '';
                        end;
                    }
                    textelement(vPRECION)
                    {
                        Width = 15;
                        trigger OnBeforePassVariable()
                        var
                            ImpNeto: Decimal;
                            PrecioNeto: Decimal;
                        begin
                            Clear(ImpNeto);
                            Clear(PrecioNeto);

                            ImpNeto := (LINEA."Unit Price" * LINEA.Quantity) - LINEA."Line Discount Amount";
                            PrecioNeto := ImpNeto / LINEA.Quantity;
                            vPRECION := cEDI.SetNumberToText(PrecioNeto, 15, 3);
                        end;
                    }
                    textelement(vTIPOIMPLIN1)
                    {
                        Width = 3;
                        trigger OnBeforePassVariable()
                        begin
                            vTIPOIMPLIN1 := 'VAT';
                        end;
                    }
                    textelement(vTASAIMPLIN1)
                    {
                        Width = 8;
                        trigger OnBeforePassVariable()
                        begin
                            vTASAIMPLIN1 := cEDI.SetNumberToText(LINEA."VAT %", 8, 3);
                        end;
                    }
                    textelement(vIMPTASA1)
                    {
                        Width = 15;
                        trigger OnBeforePassVariable()
                        begin
                            Clear(ImpTasa1);
                            ImpTasa1 := LINEA.Amount * LINEA."VAT %" / 100;
                            vIMPTASA1 := cEDI.SetNumberToText(ImpTasa1, 15, 3);
                        end;
                    }
                    textelement(vTIPOIMPLIN2) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPLIN2 := ''; end; }
                    textelement(vTASAIMPLIN2) { Width = 8; trigger OnBeforePassVariable() begin vTASAIMPLIN2 := ''; end; }
                    textelement(vIMPTASA2) { Width = 15; trigger OnBeforePassVariable() begin vIMPTASA2 := ''; end; }
                    textelement(vTIPOIMPLIN3) { Width = 3; trigger OnBeforePassVariable() begin vTIPOIMPLIN3 := ''; end; }
                    textelement(vTASAIMPLIN3) { Width = 8; trigger OnBeforePassVariable() begin vTASAIMPLIN3 := ''; end; }
                    textelement(vIMPTASA3) { Width = 15; trigger OnBeforePassVariable() begin vIMPTASA3 := ''; end; }
                    textelement(vCALIFLIN1) { Width = 3; trigger OnBeforePassVariable() begin vCALIFLIN1 := 'C'; end; }
                    textelement(vSECUENLIN1) { Width = 2; trigger OnBeforePassVariable() begin vSECUENLIN1 := '1'; end; }
                    textelement(vTIPOLIN1)
                    {
                        Width = 3;
                        trigger OnBeforePassVariable()
                        var
                            Item: Record Item;
                        begin
                            if LINEA.ABPEDICanonType <> '' then
                                vTIPOLIN1 := LINEA.ABPEDICanonType
                            else
                                if item.Get(LINEA."No.") then
                                    if item."Item Category Code" <> '' then
                                        vTIPOLIN1 := item."Item Category Code";
                        end;
                    }
                    textelement(vPORCENLIN1) { Width = 8; trigger OnBeforePassVariable() begin vPORCENLIN1 := ''; end; }
                    textelement(vIMPDTO1)
                    {
                        Width = 15;
                        trigger OnBeforePassVariable()
                        var
                            TotalCanonAmount: Decimal;
                        begin

                            if LINEA.Quantity > 0 then
                                TotalCanonAmount := LINEA.ABPEDICanonAmount * LINEA.Quantity;
                            vIMPDTO1 := cEDI.SetNumberToText(TotalCanonAmount, 15, 3);
                        end;
                    }
                    textelement(vCALIFLIN2) { Width = 3; trigger OnBeforePassVariable() begin vCALIFLIN2 := ''; end; }
                    textelement(vSECUENLIN2) { Width = 2; trigger OnBeforePassVariable() begin vSECUENLIN2 := ''; end; }
                    textelement(vTIPOLIN2) { Width = 3; trigger OnBeforePassVariable() begin vTIPOLIN2 := ''; end; }
                    textelement(vPORCENLIN2) { Width = 8; trigger OnBeforePassVariable() begin vPORCENLIN2 := ''; end; }
                    textelement(vIMPDTO2) { Width = 15; trigger OnBeforePassVariable() begin vIMPDTO2 := ''; end; }
                    textelement(vCALIFLIN3) { Width = 3; trigger OnBeforePassVariable() begin vCALIFLIN3 := ''; end; }
                    textelement(vSECUENLIN3) { Width = 2; trigger OnBeforePassVariable() begin vSECUENLIN3 := ''; end; }
                    textelement(vTIPOLIN3) { Width = 3; trigger OnBeforePassVariable() begin vTIPOLIN3 := ''; end; }
                    textelement(vPORCENLIN3) { Width = 8; trigger OnBeforePassVariable() begin vPORCENLIN3 := ''; end; }
                    textelement(vIMPDTO3) { Width = 15; trigger OnBeforePassVariable() begin vIMPDTO3 := ''; end; }
                    textelement(vCALIFLIN4) { Width = 3; trigger OnBeforePassVariable() begin vCALIFLIN4 := ''; end; }
                    textelement(vSECUENLIN4) { Width = 2; trigger OnBeforePassVariable() begin vSECUENLIN4 := ''; end; }
                    textelement(vTIPOLIN4) { Width = 3; trigger OnBeforePassVariable() begin vTIPOLIN4 := ''; end; }
                    textelement(vPORCENLIN4) { Width = 8; trigger OnBeforePassVariable() begin vPORCENLIN4 := ''; end; }
                    textelement(vIMDTO4) { Width = 15; trigger OnBeforePassVariable() begin vIMDTO4 := ''; end; }
                    textelement(vCBONI) { Width = 15; trigger OnBeforePassVariable() begin vCBONI := ''; end; }
                    textelement(vNETO)
                    {
                        Width = 15;
                        trigger OnBeforePassVariable()
                        var
                            ImpNeto: Decimal;
                        begin
                            Clear(ImpNeto);
                            ImpNeto := (LINEA."Unit Price" * LINEA.Quantity) - LINEA."Line Discount Amount";
                            vNETO := cEDI.SetNumberToText(ImpNeto, 15, 3);
                        end;
                    }
                    textelement(vPVERDE) { Width = 15; trigger OnBeforePassVariable() begin vPVERDE := ''; end; }
                    fieldelement(vPEDIDOLIN; CABECERA."External Document No.") { Width = 17; } //JGF >> Revertido el proceso. Vuelve a ser External Document No.
                    textelement(vALBARANLIN) { Width = 17; trigger OnBeforePassVariable() begin vALBARANLIN := ShipmentNo; end; }
                    textelement(vLOTE) { Width = 17; trigger OnBeforePassVariable() begin vLOTE := ''; end; }
                    textelement(vFCARGALIN) { Width = 12; trigger OnBeforePassVariable() begin vFCARGALIN := ''; end; }
                    textelement(vFENTREGALIN) { Width = 12; trigger OnBeforePassVariable() begin vFENTREGALIN := ''; end; }
                    textelement(vMATRICULALIN) { Width = 17; trigger OnBeforePassVariable() begin vMATRICULALIN := ''; end; }
                    textelement(vTIPART) { Width = 3; trigger OnBeforePassVariable() begin vTIPART := 'M'; end; }
                    textelement(vCANTDEV) { Width = 15; trigger OnBeforePassVariable() begin vCANTDEV := ''; end; }
                    textelement(vSECCION) { Width = 17; trigger OnBeforePassVariable() begin vSECCION := ''; end; }
                    textelement(vNIDENTICKETLIN) { Width = 17; trigger OnBeforePassVariable() begin vNIDENTICKETLIN := ''; end; }
                    fieldelement(vBRUTO; LINEA."Unit Price") { Width = 15; }
                    textelement(vFECALBLIN)
                    {
                        Width = 12;
                        trigger OnBeforePassVariable()
                        begin
                            if LINEA."Shipment Date" <> 0D then
                                cEDI.FormatDate(vFECALBLIN, LINEA."Shipment Date");
                        end;
                    }
                    textelement(vAUTOR) { Width = 35; trigger OnBeforePassVariable() begin vAUTOR := ''; end; }
                    textelement(vTITULO) { Width = 35; trigger OnBeforePassVariable() begin vTITULO := ''; end; }
                    textelement(vCUEXP) { Width = 15; trigger OnBeforePassVariable() begin vCUEXP := ''; end; }
                    textelement(vUMCUEXP) { Width = 3; trigger OnBeforePassVariable() begin vUMCUEXP := ''; end; }
                    textelement(vFECHAEFELIN) { Width = 12; trigger OnBeforePassVariable() begin vFECHAEFELIN := ''; end; }
                    textelement(vCATEGORIA) { Width = 35; trigger OnBeforePassVariable() begin vCATEGORIA := ''; end; }
                    textelement(vSUBLIN) { Width = 3; trigger OnBeforePassVariable() begin vSUBLIN := ''; end; }
                    textelement(vNORMEXENLIN1) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXENLIN1 := ''; end; }
                    textelement(vNORMEXENLIN2) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXENLIN2 := ''; end; }
                    textelement(vNORMEXENLIN3) { Width = 35; trigger OnBeforePassVariable() begin vNORMEXENLIN3 := ''; end; }
                    textelement(vTIPOEMBALAJE) { Width = 17; trigger OnBeforePassVariable() begin vTIPOEMBALAJE := ''; end; }
                    fieldelement(vNUMLINPED; LINEA.ABPEDIExternalLineNo) { Width = 35; }
                    textelement(vGRPLINCOM) { Width = 35; trigger OnBeforePassVariable() begin vGRPLINCOM := ''; end; }
                    textelement(vPOSLININT) { Width = 35; trigger OnBeforePassVariable() begin vPOSLININT := ''; end; }
                    textelement(vFPEDIDOLIN)
                    {
                        Width = 12;
                        trigger OnBeforePassVariable()
                        begin
                            if CABECERA."Order Date" <> 0D then
                                cEDI.FormatDate(vFPEDIDOLIN, CABECERA."Order Date");
                        end;
                    }
                    textelement(vUBASEPN) { Width = 9; trigger OnBeforePassVariable() begin vUBASEPN := ''; end; }
                    fieldelement(vUMEDPN; LINEA."Unit of Measure Code") { Width = 3; }
                    textelement(vTAXCATLIN) { Width = 3; trigger OnBeforePassVariable() begin vTAXCATLIN := ''; end; }
                    textelement(vMODELO) { Width = 35; trigger OnBeforePassVariable() begin vMODELO := ''; end; }
                    textelement(vCOLOR) { Width = 35; trigger OnBeforePassVariable() begin vCOLOR := ''; end; }
                    textelement(vIMPRAPPEL) { Width = 18; trigger OnBeforePassVariable() begin vIMPRAPPEL := ''; end; }
                    textelement(vPRECIODIS) { Width = 15; trigger OnBeforePassVariable() begin vPRECIODIS := ''; end; }
                    textelement(vPESO) { Width = 18; trigger OnBeforePassVariable() begin vPESO := ''; end; }
                    textelement(vUPESO) { Width = 3; trigger OnBeforePassVariable() begin vUPESO := ''; end; }
                    textelement(vNUMEMB) { Width = 35; trigger OnBeforePassVariable() begin vNUMEMB := ''; end; }
                    textelement(vNUMLINSUBLIN) { Width = 5; trigger OnBeforePassVariable() begin vNUMLINSUBLIN := ''; end; }
                    textelement(vTIPOIMPDTO1)
                    {
                        Width = 3;
                        trigger OnBeforePassVariable()
                        begin
                            vTIPOIMPDTO1 := 'VAT';
                        end;
                    }
                    textelement(vTASAIMPDTO1)
                    {
                        Width = 8;
                        trigger OnBeforePassVariable()
                        var
                            porcent: Decimal;
                        begin
                            /*   porcent := LINEA."Unit Price" / (Linea."Unit Price" - Linea."Importe Canon");
                              vTASAIMPDTO1 := cEDI.AjustarNumero(porcent, 8, 3) */
                            // vTASAIMPDTO1 := cEDI.AjustarNumero(PorcImp[1], 8, 3)
                            vTASAIMPDTO1 := cEDI.SetNumberToText(LINEA."VAT %", 8, 3);
                        end;

                    }

                    tableelement(OBSLIN; "Sales Comment Line")
                    {
                        LinkTable = LINEA;
                        LinkFields = "No." = field("Document No."), "Document Line No." = field("Line No.");
                        SourceTableView = where("Document Line No." = filter(<> 0));

                        textelement(EspacioComentariosLIN)
                        {
                            Width = 1;
                            trigger OnBeforePassVariable()
                            begin
                                EspacioComentariosLIN := (Format(chr1) + Format(chr2));
                            end;
                        }

                        textelement(vETIQUETAOBSLIN) { Width = 8; trigger OnBeforePassVariable() begin vETIQUETAOBSLIN := 'OBSLIN'; end; }
                        fieldelement(vNUMFAC; OBSLIN."No.") { Width = 15; }
                        fieldelement(vNUMLIN; OBSLIN."Line No.") { Width = 5; }
                        fieldelement(vNUMOBS; OBSLIN."Document Line No.") { Width = 3; }
                        textelement(vTEMAOBSLIN) { Width = 3; trigger OnBeforePassVariable() begin vTEMAOBSLIN := 'AAI'; end; }
                        fieldelement(vTEXTOOBSLIN1; OBSLIN.Comment) { Width = 70; }
                        textelement(vTEXTOOBSLIN2) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBSLIN2 := ''; end; }
                        textelement(vTEXTOOBSLIN3) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBSLIN3 := ''; end; }
                        textelement(vTEXTOOBSLIN4) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBSLIN4 := ''; end; }
                        textelement(vTEXTOOBSLIN5) { Width = 70; trigger OnBeforePassVariable() begin vTEXTOOBSLIN5 := ''; end; }

                    }
                }

                trigger OnPreXmlItem() //Calcular Impuestos
                begin
                    //                    rSIL.CalcVATAmountLines(CABECERA, TempVATAmountLines);

                    if not CABECERA.FindSet() then
                        exit;

                    TempVATAmountLines.DeleteAll();
                    rSIL.SetRange("Document No.", CABECERA."No.");
                    if rSIL.Findset() then
                        repeat
                            TempVATAmountLines.Init();
                            TempVATAmountLines.CopyFromSalesInvLine(rSIL);
                            TempVATAmountLines."Prices Including VAT" := true;
                            TempVATAmountLines.InsertLine;
                        until rSIL.Next = 0;

                    Clear(BaseImp);
                    Clear(TipoImp);
                    Clear(PorcImp);
                    Clear(ImpImp);
                    Clear(i);
                    Clear(TotBaseImp);
                    Clear(TotImp);
                    Clear(TotFAC);
                    Clear(TotalImpuestos);

                    i := 0;

                    iLinea := 0; //Corrección: Reseteamos la variable cada vez que calculamos un nuevo documento. 

                    if TempVATAmountLines.Findset() then
                        repeat
                            i += 1;
                            BaseImp[i] := TempVATAmountLines."VAT Base";

                            if not VATProdPostGrp.Get(TempVATAmountLines."VAT Identifier") then
                                exit;

                            TipoImp[i] := VATProdPostGrp.ABPEDIEDICode;
                            PorcImp[i] := TempVATAmountLines."VAT %";
                            ImpImp[i] := TempVATAmountLines."VAT Amount";
                            TotBaseImp += TempVATAmountLines."VAT Base";
                            TotImp += TempVATAmountLines."Line Amount";
                            TotFAC += TempVATAmountLines."VAT Base" + TempVATAmountLines."VAT Amount";
                            TotalImpuestos += TempVATAmountLines."VAT Amount"
                        until (TempVATAmountLines.Next = 0)
                end;
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        chr1 := 13;
        chr2 := 10;

        CompanyInfo.Init();
        CompanyInfo.FindSet();
    end;

    var
        chr1, chr2 : char;
        TotalGrossAmount: Decimal;
        TotalNetAmount: Decimal;
        TotalInvDiscAmount: Decimal;
        CompanyInfo: Record "Company Information";
        cEDI: Codeunit ABPEDIEDICommonsFunctions;
        TempVATAmountLines: Record "VAT Amount Line" temporary;
        iLinea: Integer;
        TotalBaseImp: Decimal;

        rSIL: Record "Sales Invoice Line";
        rUnitofMeasure: Record "Unit of Measure";
        BaseImp: array[6] of Decimal;
        TipoImp: array[6] of Code[3];
        PorcImp: array[6] of Decimal;
        ImpImp: array[6] of Decimal;
        i: Integer;
        TotBaseImp: Decimal;
        ImpTasa1: Decimal;
        TotImp: Decimal;
        TotFAC: Decimal;
        TotalImpuestos: Decimal;
        VATProdPostGrp: Record "VAT Product Posting Group";
        ShipmentNo: Code[20];
}