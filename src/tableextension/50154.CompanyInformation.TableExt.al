tableextension 50154 ABPEDICompanyInformation extends "Company Information"
{
    fields
    {
        field(50150; ABPEDIEDICode; Code[10])
        {
            Caption = 'EDI Code', Comment = 'Cód. EDI';
            Description = 'EDI';
            DataClassification = CustomerContent;
        }
        field(50151; ABPEDIContractNo; Code[30])
        {
            Caption = 'Contract No.', Comment = 'Nº Contrato';
            Description = 'EDI';
            DataClassification = CustomerContent;
        }
    }
}
