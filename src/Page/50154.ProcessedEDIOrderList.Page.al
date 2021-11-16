page 50154 ABPEDIProcessedEDIOrderList
{

    CardPageID = ABPEDIEDIOrderCard;
    Editable = false;
    PageType = List;
    SourceTable = ABPEDIEDISalesHeader;
    SourceTableView = SORTING(EDIKey1) where(Processed = const(true));
    UsageCategory = Lists;
    caption = 'Processed EDI Orders List', Comment = 'Pedidos EDI procesados';
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
}