page 50151 "ABPEDIEDIOrderList"
{
    CardPageID = ABPEDIEDIOrderCard;
    Editable = false;
    PageType = List;
    SourceTable = ABPEDIEDISalesHeader;
    SourceTableView = SORTING(EDIKey1) where(Processed = const(false));
    UsageCategory = Lists;
    caption = 'Pending EDI Orders List', Comment = 'Pedidos EDI pendientes';
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(NumPed; Rec.NumPed)
                {
                    ApplicationArea = all;
                }
                field(Fecha; Rec.Date)
                {
                    ApplicationArea = all;
                }
                field(QPIDE; Rec.COMPRADOR)
                {
                    ApplicationArea = all;
                }
                field(AQSF; Rec.CLIENTE)
                {
                    ApplicationArea = all;
                }
                field(Receptor; Rec.Receptor)
                {
                    ApplicationArea = all;
                }
                field(Vendedor; Rec.Vendedor)
                {
                    ApplicationArea = all;
                }
                field(CONTINFOCOMP; Rec.CONTINFOCOMP)
                {
                    ApplicationArea = all;
                }
                field(SuccessfulConfirmation; Rec.SuccessfulConfirmation)
                {
                    ApplicationArea = all;
                }
                field(HasError; Rec.HasError)
                {
                    ApplicationArea = all;
                }
                field(ErrorDescription; Rec.GetErrorDescription())
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ImportEDIPrueba)
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CommonFunc: Codeunit ABPEDIEDICommonsFunctions;
                    EDIImportFunc: Codeunit ABPEDIImportEDIOrder;
                    ImportOrderReport: Report ABPEDIImportEDIOrders;
                    EDIOrder: Record ABPEDIEDISalesHeader;
                    txtOut, aMessage, aReturn, clave, nodo, nupedido, Filename : Text;
                    Istream: InStream;
                    Ostream: OutStream;
                    tempBlob: Codeunit "Temp Blob";
                begin
                   // tempBlob.CreateInStream(Istream);
                    if not UploadIntoStream('', '', '', Filename, Istream) then
                        exit;
                    Istream.Read(txtOut);
                    CommonFunc.ProcessResponse(TxtOut, aMessage, aReturn);
                    ImportOrderReport.CreateEDIOrder(aMessage, clave, nodo, nupedido);
                end;
            }
            action(ImpPed)
            {
                Caption = 'Orders Import', comment = 'Importar Pedidos';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                PromotedIsBig = true;
                RunObject = Report ABPEDIImportEDIOrders;
            }

            action(ProcessSelectedOrders)
            {
                Caption = 'Process selected Orders', comment = 'Procesar Pedidos seleccionados';
                Image = SelectField;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                var
                    EDIOrder: Record ABPEDIEDISalesHeader;
                    iI: Integer;
                    iITotal: Integer;
                    dDialog: Dialog;
                    iOk: Integer;
                    iError: Integer;
                begin
                    EDISalesHeader.Reset();
                    CurrPage.SetSelectionFilter(EDISalesHeader);
                    if not EDISalesHeader.FindSet() then
                        exit;
                    ProcessOrders(EDISalesHeader);
                end;
            }

            action(ProcessAllOrders)
            {
                Caption = 'Process All Orders', comment = 'Procesar Todos los Pedidos';
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                var
                begin
                    EDISalesHeader.Reset();
                    EDISalesHeader.SetRange(EDIKey1);
                    EDISalesHeader.FindSet();
                    ProcessOrders(EDISalesHeader);
                end;
            }

            action("Ver Errores")
            {
                Caption = 'View Errors', comment = 'Ver Errores';
                Image = ErrorLog;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                RunObject = Page ABPEDILogErrorEDIList;
                RunPageLink = Clave_1 = FIELD(EDIKey1);
                RunPageView = SORTING(FileType, Clave_1, Clave_2, Clave_3, "Line No.");
            }
        }
    }

    var
        Text50000:
            Label 'Procesing Orders\@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', Comment = 'Procesando pedidos\@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';
        Text50050: Label '%1 orders have been processed correctly from %2', Comment = 'Se han procesado correctamente %1 pedidos de un total de %2';
        Text50051: Label '\Check the %3 orders with error', Comment = '\Revise los %3 pedidos con error.'; 
        EDISalesHeader: Record ABPEDIEDISalesHeader;


    local procedure ProcessOrders(var EDISalesHeader: Record ABPEDIEDISalesHeader)
    var
        int, totalLines, processedOrders, ordersWithErrors : Integer;
        dialog: Dialog;
        ErrorFound: Boolean;
    begin
        ErrorFound := false;
        Clear(processedOrders);
        dialog.Open(Text50000);
        totalLines := EDISalesHeader.Count;
        repeat
            dialog.Update(1, Round(int / totalLines * 10000, 1));
            ClearLastError;
            Commit;
            if EDISalesHeader.CreateSalesOrder() then
                processedOrders += 1
            else begin
                ordersWithErrors += 1;
            end;
        until EDISalesHeader.Next = 0;
        if (processedOrders <> 0) and (totalLines = processedOrders) then
            Message(Text50050, processedOrders, totalLines)
        else
            Message(Text50050 + Text50051, processedOrders, totalLines, totalLines - processedOrders);
        dialog.Close;
    end;
}


