table 50158 "ABPEDIInboundBox"
{
    Caption = 'Inbound Box', Comment = 'Buzón entrada';
    DataClassification = CustomerContent;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.', Comment = 'No. movimiento';
            Editable = false;
        }

        field(50; Created; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Created', Comment = 'Creado';
            Editable = false;
        }
        field(51; HasError; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Has Error', Comment = 'Error';
            Editable = false;
        }
        
    }

    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        inboundBox: record ABPEDIInboundBox;
    begin
        if inboundBox.FindLast() then
            EntryNo := inboundBox.EntryNo + 1
        else
            EntryNo := 1;
    end;

}