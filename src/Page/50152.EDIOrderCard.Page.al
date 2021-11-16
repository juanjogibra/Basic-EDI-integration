page 50152 "ABPEDIEDIOrderCard"
{
    Caption = 'EDI Order Card', Comment = 'Ficha Pedido EDI';
    InsertAllowed = false;   
    PageType = Document;
    SourceTable = ABPEDIEDISalesHeader;
    SourceTableView = SORTING(EDIKey1);

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Etiqueta; Rec.EDILabel)
                {
                    ApplicationArea = all;
                }
                field("Clave_1"; Rec.EDIKey1)
                {
                    ApplicationArea = all;
                }
                field(Nodo; Rec.Nodo)
                {
                    ApplicationArea = all;
                }
                field(Funcion; Rec.Funcion)
                {
                    ApplicationArea = all;
                }
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
                field(Recogida; Rec.Recogida)
                {
                    ApplicationArea = all;
                }
                field(Moneda; Rec.Moneda)
                {
                    ApplicationArea = all;
                }
                field(FRECOGID; Rec.FRECOGID)
                {
                    ApplicationArea = all;
                }
                field(CONDPAGO; Rec.CONDPAGO)
                {
                    ApplicationArea = all;
                }
                field(TRANSPOR; Rec.TRANSPOR)
                {
                    ApplicationArea = all;
                }
                field(NREFCLIENTE; Rec.NREFCLIENTE)
                {
                    ApplicationArea = all;
                }
                field(NPROYECTO; Rec.NPROYECTO)
                {
                    ApplicationArea = all;
                }
                field(MANUFACTURADOR; Rec.MANUFACTURADOR)
                {
                    ApplicationArea = all;
                }
                field(ORDENADOR; Rec.ORDENADOR)
                {
                    ApplicationArea = all;
                }
                field(UCONSIGNADOR; Rec.UCONSIGNADOR)
                {
                    ApplicationArea = all;
                }
                field(EANZZZ; Rec.EANZZZ)
                {
                    ApplicationArea = all;
                }
                field(CONTINFOCOMP; Rec.CONTINFOCOMP)
                {
                    ApplicationArea = all;
                }
                field(CONTPEDCOM; Rec.CONTPEDCOM)
                {
                    ApplicationArea = all;
                }
                field(IMPVENDISC; Rec.IMPVENDISC)
                {
                    ApplicationArea = all;
                }
                field(TRANSPORTCODESC; Rec.TRANSPORTCODESC)
                {
                    ApplicationArea = all;
                }
                field(TRANSPORTDESC; Rec.TRANSPORTDESC)
                {
                    ApplicationArea = all;
                }
            }
            part(Control1000000002; ABPEDIEDIOrderSubform)
            {
                SubPageLink = EDIKey1 = FIELD(EDIKey1);
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ProcPed)
            {
                Caption = 'Order Import', comment = 'Procesar Pedido';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                begin
                    ProcessOrder;
                end;
            }
            action("Ver Errores")
            {
                Caption = 'show Errors', comment = 'Ver Errores';
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

    local procedure ProcessOrder()
    var
        Text002: Label 'Order has been succesfully proccesed', Comment = 'El pedido ha sido procesado correctamente';
    begin
        Rec.CreateSalesOrder();

        if Rec.HasError then
            Message(Rec.GetErrorDescription())
        else begin
            Message(Text002);
            CurrPage.Close();
        end;
    end;
}