tableextension 50156 ABPEDIUnitOfMeasure extends "Unit of Measure"
{
    fields
    {
        field(50001; ABPEDIEDICode; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Code', comment = 'Código EDI';
        }
    }
}
