tableextension 50153 ABPEDICustomer extends Customer
{
    fields
    {      
        field(50001; ABPEDIEDICode; Code[17])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Code', comment = 'Cód. EDI';
        }
    }
}
