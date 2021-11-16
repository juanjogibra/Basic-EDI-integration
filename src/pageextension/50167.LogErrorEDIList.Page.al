#pragma implicitwith disable
page 50167 "ABPEDILogErrorEDIList"
{
    Editable = false;
    PageType = List;
    SourceTable = ABPEDILogErrorEDI;
    UsageCategory = Administration;
    ApplicationArea = all;
    Caption = 'Log Error List', Comment = 'Registro de Errores';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ErrorTxt; Rec.ErrorTxt)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

#pragma implicitwith restore

