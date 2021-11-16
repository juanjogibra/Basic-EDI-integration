table 50153 "ABPEDIEDISalesComment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EDILabel; Code[8])
        {
            Caption = 'EDI Label', comment = 'Etiqueta';
            DataClassification = CustomerContent;
        }
        field(2; EDIKey1; Code[10])
        {
            Description = 'TODOS: CABECERA, OBSER, LINEA, OBSERL, LOC';
            Caption = 'Clave 1';
            DataClassification = CustomerContent;
        }
        field(3; EDIKey2; Code[10])
        {
            Description = 'OBSER, LINEA(NumLin), OBSERL';
            Caption = 'Clave 2';
            DataClassification = CustomerContent;
        }
        field(4; EDIKey3; Code[10])
        {
            Description = 'OBSERL, LOC';
            Caption = 'Clave 3';
            DataClassification = CustomerContent;
        }
        field(5; Tema; Text[3])
        {
            Description = 'OBSER,OBSERL';
            DataClassification = CustomerContent;
        }
        field(6; Texto1; Text[70])
        {
            Description = 'OBSER,OBSERL';
            DataClassification = CustomerContent;
        }
        field(7; Texto2; Text[70])
        {
            Description = 'OBSER,OBSERL';
            DataClassification = CustomerContent;
        }
        field(8; Texto3; Text[70])
        {
            Description = 'OBSER,OBSERL';
            DataClassification = CustomerContent;
        }
        field(9; Texto4; Text[70])
        {
            Description = 'OBSER,OBSERL';
            DataClassification = CustomerContent;
        }
        field(10; Texto5; Text[70])
        {
            Description = 'OBSER,OBSERL';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; EDIKey1, EDIKey2, EDIKey3)
        {
            Clustered = true;
        }
    }
}