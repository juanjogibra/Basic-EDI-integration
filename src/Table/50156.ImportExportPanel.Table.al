table 50156 "ABPEDIImportExportPanel"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Description = '';
            Caption = 'Entry No.', Comment = 'Nº movimiento';
            DataClassification = CustomerContent;
        }
        field(2; "Document Type"; Enum ABPEDIDocumentType)
        {
            Description = '';
            Caption = 'Document Type', Comment = 'Tipo Documento';
            DataClassification = CustomerContent;
        }
        // field(3; Destination; Enum ABPEDIDestinationRequest)
        // {
        //     Description = '';
        //     Caption = 'Destination', Comment = 'Destino';
        //     DataClassification = CustomerContent;
        // }
        field(4; "File"; Blob)
        {
            Caption = 'File', Comment = 'Fichero';
            DataClassification = CustomerContent;
        }
        field(5; "Creation Date"; Date)
        {
            Caption = 'Creation Date', Comment = 'Fecha de Creación';
            DataClassification = CustomerContent;
        }
        field(6; "Creation Time"; Time)
        {
            Caption = 'Creation Time', Comment = 'Hora de Creación';
            DataClassification = CustomerContent;
        }
        field(7; "Created By"; Code[20])
        {
            Caption = 'Created by', Comment = 'Creado por';
            DataClassification = CustomerContent;
        }
        field(8; Processed; Boolean)
        {
            Caption = 'Processed', Comment = 'Procesado';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Validate("Entry No.", GetLastEntryNo());
    end;

    procedure GetLastEntryNo(): Integer
    var
        ImportExportPanel: Record ABPEDIImportExportPanel;
    begin
        if ImportExportPanel.FindLast() then
            exit(ImportExportPanel."Entry No." + 1)
        else
            exit(1);
    end;

}