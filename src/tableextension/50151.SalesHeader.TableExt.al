tableextension 50151 ABPEDISalesHeader extends "Sales Header"
{
    fields
    {
        field(50150; ABPEDIEmisor; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Emisor', comment = 'Emisor';
        }
        field(50151; ABPEDIInvoiceType; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Invoice Type', comment = 'EDI Tipo factura';
        }
        field(50152; ABPEDIInvoiceClass; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Invoice Class', comment = 'EDI Clase factura';
        }
        field(50153; ABPEDIRectificationReason; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI Rectification Reason', comment = 'EDI Motivo rectificación';
        }

        field(50154; ABPEDIExternalConfNo; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'EDI External Confirmation No.', comment = 'EDI Nº Confirmación externo';
        }
        field(50155; ABPEDISentToEDI; Boolean)
        {
            //Creado para guardar relación con campos del histórico
            DataClassification = CustomerContent;
            Caption = 'Sent to EDI', comment = 'Enviado a EDI';
            Editable = false;
        }
        field(50156; ABPEDIVATCashRegime; Boolean)
        {
            Caption = 'VAT Cash Regime', comment = 'IVA de Régimen de caja';
            FieldClass = FlowField;
            CalcFormula = Exist("VAT Entry" WHERE("Document No." = FIELD("No."), "Document Type" = FILTER(Invoice), "VAT Cash Regime" = FILTER(true)));
        }

        field(50157; ABPEDIComesFromEDI; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Comes From EDI', comment = 'Proviene de EDI';
        }

        field(50158; ABPEDISequence; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Sequence', Comment = 'Secuencia';
            Description = 'Se utiliza para diferenciar distintos pedidos con igual Nº Documento Externo';
            Editable = false;
        }
    }
}
