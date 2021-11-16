tableextension 50155 ABPEDISalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50150; ABPEDIExternalLineNo; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'External Line No.', comment = 'Nº línea externo';
        }
        field(50151; ABPEDICanonAmount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Canon Amount ', comment = 'Importe Canon EDI';
            // Editable = false;
        }
        field(50152; ABPEDICanonType; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Canon Type', comment = 'Tipo Canon EDI';
            TableRelation = "Item Category".Code;
        }
    }
}
