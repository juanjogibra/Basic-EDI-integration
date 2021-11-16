table 50154 "ABPEDIEDIBreakdownSalesLine"
{
    Caption = 'ABPEDIEDIBreakdownSalesLine';
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
        field(5; LUGAR; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Destination place EDI Code', Comment = 'Código EDI del lugar de destino de la mercancía';
        }
        field(6; CANTIDAD; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Amount allocated to this place', Comment = 'Cantidad destinada a este lugar';
        }
        field(7; FECHENTR; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Request Delivery Date/Time', Comment = 'Fecha/hora de entrega solicitada';
        }
        field(8; FechUlt; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(9; NOMBRE; Text[70])
        {

            DataClassification = CustomerContent;
            Caption = 'Destination Place Name', Comment = 'Nombre del lugar de destino de la mercancía';
        }
        field(10; LUGARREL; Text[25])
        {

            DataClassification = CustomerContent;
            Caption = 'Related destination place', Comment = 'Lugar de destino relacionado';
        }
    }
    keys
    {
        key(PK; EDIKey1, EDIKey2, EDIKey3)
        {
            Clustered = true;
        }
    }
}