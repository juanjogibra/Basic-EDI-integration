enum 50151 ABPEDIDocumentType
{
    Extensible = false;
    Caption = 'Document Type', Comment = 'Tipo Documento';

    value(0; "Sales Order")
    {
        Caption = 'Sales Order', comment = 'Pedido de Venta';
    }
    value(1; "Sales Invoice")
    {
        Caption = 'Sales Invoice', comment = 'Factura de Venta';
    }   
}