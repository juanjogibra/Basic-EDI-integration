table 50159 "ABPEDIOutboundBox"
{
    Caption = 'Outbound Box', Comment = 'Buzón salida';
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
        field(52; ErrorDescription; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Error description', Comment = 'Descripción error';
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
        outboundBox: record ABPEDIOutboundBox;
    begin
        if outboundBox.FindLast() then
            EntryNo := outboundBox.EntryNo + 1
        else
            EntryNo := 1;
    end;

    procedure SetErrorDescription(_ErrorDescription: Text)
    var
        outStr: OutStream;
    begin
        Clear(ErrorDescription);
        ErrorDescription.CreateOutStream(outStr, TextEncoding::UTF8);
        outStr.WriteText(_ErrorDescription);
        Modify();
    end;

    procedure GetErrorDescription(): Text;
    var
        typeHelper: Codeunit "Type Helper";
        inStr: InStream;
    begin
        CalcFields(ErrorDescription);
        ErrorDescription.CreateInStream(inStr, TextEncoding::UTF8);
        exit(typeHelper.ReadAsTextWithSeparator(inStr, typeHelper.LFSeparator()));
    end;

    procedure SendSelected()
    var
        cUSend: Codeunit ABPEDIExportEDIInvoice;
    begin
        ClearLastError();
        if not cUSend.Run(Rec) then begin
            Validate(HasError, true);
            SetErrorDescription(GetLastErrorText());
        end else begin
            Validate(HasError, false);
            SetErrorDescription('');
            Validate(Created, true);
        end;

        Modify(true);
        Commit();
    end;
}