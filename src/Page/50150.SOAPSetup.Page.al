page 50150 "ABPEDISOAPSetup"
{
    Caption = 'SOAP Setup', Comment = 'Conf. SOAP';
    PageType = Card;
    SourceTable = ABPEDISOAPSetup;
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {

                field(User; Rec.User)
                {
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;
}