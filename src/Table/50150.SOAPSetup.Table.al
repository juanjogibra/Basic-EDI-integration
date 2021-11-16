table 50150 "ABPEDISOAPSetup"
{
    DataClassification = CustomerContent;
    Caption = 'SOAP Setup', Comment = 'Conf. SOAP';
    fields
    {

        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key', Comment = 'Clave primaria';
        }

        field(3; User; Text[10])
        {

            DataClassification = CustomerContent;
            Caption = 'user', Comment = 'Usuario';
        }
        field(4; password; Text[15])
        {

            DataClassification = CustomerContent;
            Caption = 'password', Comment = 'Contraseña';
        }
        field(5; WSDefaultAPIRequest; code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'WS Default API Request', comment = 'WS Petición web por defecto';
            Description = 'Permite seleccionar de la tabla Servicios Web Personalizados, aquel que necesitemos definir para un proceso en concreto.';
            TableRelation = "ABP Custom Web Service".Code;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}