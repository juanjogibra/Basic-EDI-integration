table 50157 "ABPEDIActivitiesCue"
{
    DataClassification = CustomerContent;
    Caption = 'Activities Cue', Comment = 'Actividades';

    fields
    {
        field(1; "Primary Key"; code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key', Locked = true;
        }

        field(12; InboundBox; Integer)
        {
            Caption = 'Inbound Box', Comment = 'Entrantes a la espera';
            FieldClass = FlowField;
            CalcFormula = count(ABPEDIInboundBox where(Created = const(false)));
        }

        field(13; CreatedInboundBox; Integer)
        {
            Caption = 'Created Outbound Box', Comment = 'Entrantes creadas';
            FieldClass = FlowField;
            CalcFormula = count(ABPEDIInboundBox where(Created = const(true)));
        }
        field(14; OutboundBox; Integer)
        {
            Caption = 'Outbound Box', Comment = 'Salientes a la espera';
            FieldClass = FlowField;
            CalcFormula = count(ABPEDIOutboundBox where(Created = const(false)));
        }
        field(15; CreatedOutboundPurchInvsBox; Integer)
        {
            Caption = 'Created Outbound Box', Comment = 'Salientes creadas';
            FieldClass = FlowField;
            CalcFormula = count(ABPEDIOutboundBox where(Created = const(true)));
        }

        // field(16; Setup; Integer)
        // {
        //     Caption = 'Integration Setup', Comment = 'Conf. integración';
        //     FieldClass = FlowField;
        //     CalcFormula = count(ABPEDIIntegrationSetup);
        // }

        field(18; WebServiceConnections; Integer)
        {
            Caption = 'Web Service Connections', Comment = 'Conexiones Servicios Web';
            FieldClass = FlowField;
            CalcFormula = count("ABP Web Service Setup");
        }
        field(19; CustomWebServices; Integer)
        {
            Caption = 'Custom Web Services', Comment = 'Servicios web personalizados';
            FieldClass = FlowField;
            CalcFormula = count("ABP Custom Web Service");
        }
        field(20; RestLog; Integer)
        {
            Caption = 'REST Log', Comment = 'Log REST';
            FieldClass = FlowField;
            CalcFormula = count("ABP REST Log");
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}