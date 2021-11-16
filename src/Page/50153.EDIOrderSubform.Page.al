page 50153 "ABPEDIEDIOrderSubform"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = ABPEDIEDISalesLine;
    SourceTableView = SORTING(EDIKey1, EDIKey2);
    Caption = 'EDI Order Lines', comment = 'Líneas Pedido EDI';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Etiqueta; Rec.EDILabel)
                {
                    ApplicationArea = all;
                }
                field("Clave_1"; Rec.EDIKey1)
                {
                    ApplicationArea = all;
                }
                field("Clave_2"; Rec.EDIKey2)
                {
                    ApplicationArea = all;
                }

                field(RefEAN; Rec.RefEAN)
                {
                    ApplicationArea = all;
                }
                field(RefCli; Rec.RefCli)
                {
                    ApplicationArea = all;
                }
                field(RefProv; Rec.RefProv)
                {
                    ApplicationArea = all;
                }
                field(NumHIBC; Rec.REFETIQ)
                {
                    ApplicationArea = all;
                }
                field(CantPed; Rec.CantPed)
                {
                    ApplicationArea = all;
                }
                field(UMedida; Rec.UMedida)
                {
                    ApplicationArea = all;
                }
                field(PrecioN; Rec.PrecioN)
                {
                    ApplicationArea = all;
                }
                field(PrecioB; Rec.PrecioB)
                {
                    ApplicationArea = all;
                }
                field(Calif1; Rec.Calif1)
                {
                    ApplicationArea = all;
                }
                field(ImporteDto1; Rec.ImporteDto1)
                {
                    ApplicationArea = all;
                }
                field(NUMPEDCOM; Rec.NUMPEDCOM)
                {
                    ApplicationArea = all;
                }
                field(NUMCLIFIN; Rec.NUMCLIFIN)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

