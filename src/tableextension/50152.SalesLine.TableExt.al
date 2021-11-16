tableextension 50152 ABPEDISalesLine extends "Sales Line"
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
            Editable = false;
        }
    }
}
