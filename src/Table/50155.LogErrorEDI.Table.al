table 50155 "ABPEDILogErrorEDI"
{
    DrillDownPageID = ABPEDILogErrorEDIList;
    LookupPageID = ABPEDILogErrorEDIList;
    caption = 'Log Error EDI', Comment = 'Log Error EDI';

    fields
    {
        field(1; "Clave_1"; Code[10])
        {
            Description = 'TODOS: CABPED, OBSPED, LINPED, OBSLPED, DTOLPED';
            DataClassification = CustomerContent;
        }
        field(2; "Clave_2"; Code[10])
        {
            Description = 'OBSPED, LINPED(NumLin), OBSLPED';
            DataClassification = CustomerContent;
        }
        field(3; "Clave_3"; Code[10])
        {
            Description = 'OBSLPED, DTOLPED';
            DataClassification = CustomerContent;
        }
        field(4; ErrorTxt; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(5; FileType; Enum ABPEDIFileType)
        {
            Caption = 'Type', Comment = 'ESP="Tipo"';
            Description = 'No viene en el fichero. Marca el fichero TODOS: CABPED, OBSPED, LINPED, OBSLPED, DTOLPED';
            DataClassification = CustomerContent;
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.', comment = 'ESP="Nº Línea"';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; FileType, Clave_1, Clave_2, Clave_3, "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        rLog.Reset;
        rLog.SetRange(FileType, FileType);
        rLog.SetRange(Clave_1, Clave_1);
        rLog.SetRange(Clave_2, Clave_2);
        rLog.SetRange(Clave_3, Clave_3);
        if rLog.FindLast then
            "Line No." := rLog."Line No." + 1
        else
            "Line No." := 1;
    end;

    var
        rLog: Record ABPEDILogErrorEDI;
}

