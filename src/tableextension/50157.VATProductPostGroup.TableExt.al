tableextension 50157 ABPEDIVATProductPostGroup extends "VAT Product Posting Group"
{
    fields
    {
        field(50150; ABPEDIEDICode; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Code', comment = 'Código EDI';
        }
    }
}
