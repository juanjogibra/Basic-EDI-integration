tableextension 50150 ABPEDIShipToAddress extends "Ship-to Address"
{
    fields
    {
        field(50150; ABPEDIEDICode; Code[17])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Code', comment = 'Cód EDI';
        }
        field(50151; ABPEDIQPIDE; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI QPIDE', comment = 'EDI Quien PIDE';
        }
        field(50152; ABPEDIAQSF; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI AQSF', comment = 'EDI A quien se Factura';
        }
    }
}
