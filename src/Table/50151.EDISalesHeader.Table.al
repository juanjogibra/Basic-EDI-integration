table 50151 "ABPEDIEDISalesHeader"
{
    Caption = 'EDI Orders V24', Comment = 'Pedidos EDI V24';
    fields
    {

        // ____ CAMPOS DE EDI _____ //

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
        field(3; Nodo; Text[3])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(4; Funcion; Text[3])
        {
            Description = 'CABECERA : Función del mensaje';
            DataClassification = CustomerContent;
            Caption = 'Function', Comment = 'Función';
        }
        field(5; NumPed; Text[15])
        {
            Description = 'CABECERA';
            Caption = 'Order No.', Comment = 'Nº Pedido';
            DataClassification = CustomerContent;
        }
        field(6; Date; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(7; FechaEPR; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(8; FechaERE; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(9; FechaTOP; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(10; FormaPag; Text[3])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(11; CondESP; Text[3])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(12; PedAbier; Text[17])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(13; LPrecios; Text[17])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(14; NContrat; Text[17])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(15; FContrat; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(16; Emisor; Text[17])
        {
            Description = 'CABECERA : Código EAN del emisor del Pedido';
            DataClassification = CustomerContent;
        }
        field(17; COMPRADOR; Text[17])
        {
            Description = 'CABECERA : Código EAN de Quien pide (Comprador)';
            DataClassification = CustomerContent;
            Caption = 'QPide', Comment = 'Quien pide';
        }
        field(18; CLIENTE; Text[17])
        {
            Description = 'CABECERA : Código EAN a quien se factura';
            DataClassification = CustomerContent;
            Caption = 'AQSF', Comment = 'A quien se factura';
        }
        field(19; Depto; Text[17])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(20; Receptor; Text[17])
        {
            Description = 'CABECERA : Código EAN del receptor de la mercancía';
            DataClassification = CustomerContent;
        }
        field(21; Muelle; Text[17])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(22; Vendedor; Text[17])
        {
            Description = 'CABECERA : Código EAN a quien se pide';
            DataClassification = CustomerContent;
        }
        field(23; EDIQPAGA; Text[17])
        {
            Description = 'CABECERA: Código EAN de quien paga (Emisor de pago)';
            DataClassification = CustomerContent;
        }
        field(24; Portes; Text[3])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(25; Recogida; Text[3])
        {
            Description = 'CABECERA : Código para indicar quien recoge la mercancía';
            DataClassification = CustomerContent;
        }
        field(26; Reposi; Text[35])
        {
            Description = 'CABECERA : Número de reposición individual en un pedido abierto.';
            DataClassification = CustomerContent;
        }
        field(27; Entrega; Text[35])
        {
            Description = 'CABECERA : Número de entrega programada en un pedido abierto.';
            DataClassification = CustomerContent;
        }
        field(28; Moneda; Text[3])
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(29; Calif1; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 1';
            DataClassification = CustomerContent;
            Caption = 'Discount/Charge', Comment = 'Descuento/Cargo';
        }
        field(30; Secuen1; Integer)
        {
            Description = 'CABECERA Secuen1';
            DataClassification = CustomerContent;
        }
        field(31; TipoDto1; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(32; PorcenDto1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(33; ImporteDto1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
            Caption = 'Disc. Amount', Comment = 'Importe Dto.';
        }
        field(34; Calif2; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 2';
            DataClassification = CustomerContent;
        }
        field(35; Secuen2; Integer)
        {
            Description = 'LOC Secuen2';
            DataClassification = CustomerContent;
        }
        field(36; TipoDto2; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(37; PorcenDto2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(38; ImporteDto2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }

        field(39; Calif3; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 3';
            DataClassification = CustomerContent;
        }
        field(40; Secuen3; Integer)
        {
            Description = 'LOC Secuen3';
            DataClassification = CustomerContent;
        }
        field(41; TipoDto3; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(42; PorcenDto3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(43; ImporteDto3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(44; Calif4; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 4';
            DataClassification = CustomerContent;
        }
        field(45; Secuen4; Integer)
        {
            Description = 'LOC Secuen4';
            DataClassification = CustomerContent;
        }
        field(46; TipoDto4; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(47; PorcenDto4; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(48; ImporteDto4; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(49; Calif5; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 5';
            DataClassification = CustomerContent;
        }
        field(50; Secuen5; Integer)
        {
            Description = 'LOC Secuen5';
            DataClassification = CustomerContent;
        }
        field(51; TipoDto5; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(52; PorcenDto5; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(53; ImporteDto5; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(54; TipoImp1; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(55; TasaImp1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(56; BaseImp1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(57; ImpImp1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(58; TipoImp2; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(59; TasaImp2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(60; BaseImp2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(61; ImpImp2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(62; TipoImp3; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(63; TasaImp3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(64; BaseImp3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(65; ImpImp3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(66; PATREF; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment time Ref.', Comment = 'Ref. tiempo pago';
        }
        field(67; PATDIAS; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. days for payment', Comment = 'Nº Dias para el pago';
        }
        field(68; PATMESES; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. months for payment', Comment = 'Nº meses para el pago';
        }
        field(69; FECHAV; Text[12])
        {
            DataClassification = CustomerContent;
            Caption = 'Reference value date', Comment = 'Fecha valor referencia';
        }
        field(70; VTO1; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expiration date 1', Comment = 'Fecha vencimiento 1';
        }
        field(71; IMPVTO1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Expiration amount 1', Comment = 'Importe vencimiento 1';
        }
        field(72; VTO2; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expiration date 2', Comment = 'Fecha vencimiento 2';
        }
        field(73; IMPVTO2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Expiration amount 2', Comment = 'Importe vencimiento 2';
        }
        field(74; VTO3; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expiration date 3', Comment = 'Fecha vencimiento 3';
        }

        field(75; IMPVTO3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Expiration amount 3', Comment = 'Importe vencimiento 3';
        }
        field(76; TBruto; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Gross Total Amount', Comment = 'Importe total Bruto';
        }
        field(77; TNeto; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Net Total Amount', Comment = 'Importe total Neto';
        }
        field(78; TCARDES; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Total Charges and Discounts', Comment = 'Total Cargos y Descuentos';
        }
        field(79; BASEIMP; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Tax Base', Comment = 'Base Imponible';
        }
        field(80; TotImpue; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Total taxes', Comment = 'Total Impuestos';
        }
        field(81; TotalPagar; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Total Payable', Comment = 'Total a Pagar';
        }
        field(82; FRECOGID; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Pickup Date', Comment = 'Fecha Recogida';
        }
        field(83; TRANSPOR; Code[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Transporter Code', Comment = 'Cód Transportista';
        }
        field(84; ALMRECOGID; Code[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Warehouse Checkout Code', Comment = 'Código Almacen Recogida';
        }
        field(85; FREFPAG; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Payday Date', Comment = 'Fecha del día de pago CORTEFIEL';
        }
        field(86; TOTCANT; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Item Ordered', Comment = 'Cantidad Total de artículos pedidos';
        }
        field(87; TEMPORADA; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Order Season According to ECI', Comment = 'Temporada de pedidos segun ECI';
        }
        field(88; DEPTOVENTA; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Departament According to ECI', Comment = 'Departamento de Venta segun ECI';
        }
        field(89; SUCURSAL; code[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Branch office Code according to ECI', Comment = 'Código sucursal que hizo el pedido segun ECI';
        }
        field(90; DESTMSG; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Destination of Message', Comment = 'Destino del mensaje';
        }
        field(91; CONDPAGO; Text[5])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Conditions', Comment = 'Condiciones de pago';
        }
        field(92; TRANSPORT; Text[5])
        {
            DataClassification = CustomerContent;
            Caption = 'Transport Mode', Comment = 'Modo de transporte';
        }
        field(93; LUGADIENT; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Aditional Identification Delivery Place', Comment = 'Identificacion Adicional del lugar de entrega';
        }
        field(94; CODPROD; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Internal Vendor Code', Comment = 'Código Interno Proveedor';
        }

        field(95; DESTFINAL; Code[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient Code', Comment = 'Código Destinatario Final';
        }
        field(96; NOMDESTFIN; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient Name', Comment = 'Nombre Destinatario Final';
        }
        field(97; DIRDESTFIN; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient Address', Comment = 'Dirección Destinatario Final';
        }
        field(98; POBDESTFIN; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient City', Comment = 'Población Destinatario Final';
        }
        field(99; PROVDESTFIN; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient County', Comment = 'Provincia Destinatario Final';
        }
        field(100; TELFDESTFIN; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient phone', Comment = 'Teléfono Destinatario Final';
        }
        field(101; TELFDESTFIN2; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Recipient phone 2', Comment = 'Teléfono 2 Destinatario Final';
        }
        field(102; CPDESTFIN; Text[9])
        {
            DataClassification = CustomerContent;
            Caption = 'FInal Recipient Postal Code', Comment = 'Cód Postal Destinatario Final';
        }
        field(103; NUMTALON; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Heel Number', Comment = 'Número de Talón';
        }
        field(104; NUMRESERVA; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Number', Comment = 'Número de Reserva';
        }
        field(105; PESBRUTOT; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Total Gross Weight', Comment = 'Peso Bruto Total';
        }

        field(106; NUMTOBUL; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Total Package Order', Comment = 'Total bultos del pedido';
        }

        field(107; CONDESP2; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Special Conditions 2', Comment = 'Condiciones especiales 2';
        }
        field(108; CONDESP3; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Special Conditions 3', Comment = 'Condiciones especiales 3';
        }
        field(109; CONDESP4; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Special Conditions 4', Comment = 'Condiciones especiales 4';
        }
        field(110; CONDESP5; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Special Conditions 5', Comment = 'Condiciones especiales 5';
        }

        field(111; NOMCONREC; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Merchandise recipient contact name', Comment = 'Nombre contacto receptor mercancía';
        }
        field(112; TIPOCTA; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'AMAZON Account Type Identifier', Comment = 'Identificador Tipo Cuenta AMAZON';
        }
        field(113; NUMPROMO; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Promotion number assigned by AMAZON', Comment = 'Número de promoción asignado por AMAZON';
        }

        field(114; CODRES; code[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Response Type Code', Comment = 'Código de tipo de Respuesta';
        }
        field(115; NREFCLIENTE; code[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Reference Number', Comment = 'Número de Referencia de Cliente';
        }
        field(116; FNREFCLIENTE; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Reference Number Date', Comment = 'Fecha número de Referencia de Cliente';
        }
        field(117; NPROYECTO; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Project Specification Number', Comment = 'Número de especificación de proyecto';
        }
        field(118; FNPROYECTO; Text[12])
        {
            DataClassification = CustomerContent;
            Caption = 'Project Specification Number', Comment = 'Número de especificación de proyecto';
        }

        field(119; MANUFACTURADOR; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Manufacturer EAN Code', Comment = 'Codigo EAN del manufacturador';
        }

        field(120; ORDENADOR; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'EAN Code Who placing the order', Comment = 'Codigo EAN de quien realiza el pedido';
        }
        field(121; UCONSIGNADOR; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'EAN code of the last consignor', Comment = 'Codigo EAN del último consignador';
        }

        field(122; DIRUCONSIG; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Address of the last consignor', Comment = 'Dirección del último consignador';
        }
        field(123; POBUCONSIG; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'City of the last consignor', Comment = 'Población del último consignador';
        }
        field(124; CPUCONSIG; Text[9])
        {
            DataClassification = CustomerContent;
            Caption = 'Address of the last consignor', Comment = 'Código Postal del último consignador';
        }
        field(125; PROVUCONSIG; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'County of the last consignor', Comment = 'Provincia del último consignador';
        }

        field(126; EANZZZ; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Mutually defined partner EAN Code', Comment = 'Código EAN del interlocutor definido mutuamente';
        }
        field(127; CONTINFOCOMP; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Buy-to information Contact', Comment = 'Persona de contacto de información del comprador';
        }
        field(128; CONTPEDCOM; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Buy-to order Contact', Comment = 'Persona de contacto de pedidos del comprador';
        }
        field(129; IMPVENDISC; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Discount Expiration Amount', Comment = 'Importe del vencimiento del descuento';
        }
        field(130; TRANSPORTCODESC; Text[8])
        {
            DataClassification = CustomerContent;
            Caption = 'Transport mode description code', Comment = 'Código de descripción del modo de transporte';
        }

        field(131; TRANSPORTDESC; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Transport mode description', Comment = 'Descripción del modo de transporte';
        }
        field(132; CONDENTREGA; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Transport terms description', Comment = 'Descripción de términos de entrega o transporte';
        }
        field(133; TELEFCOMP; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Transport mode description', Comment = 'Teléfono Contacto Proveedor';
        }
        field(134; RECEPTORPAIS; Code[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Receiver Country Code', Comment = 'Código del país del receptor';
        }
        field(135; COMPRADORPAIS; Code[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Buy-to country Code', Comment = 'Código del país del comprador';
        }
        field(136; RECEPTORCONTCOD; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Delivery Place Employee or department Code', Comment = 'Código del departamento o del empleado del lugar de entrega de la mercancía';
        }
        field(137; NUMPEDTIENDA; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Order No.', Comment = 'Número de pedido de la tienda';
        }
        field(138; DESCPAGO; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Method Description', Comment = 'Descripción de la forma de pago';
        }
        field(139; NUMPEDPROV; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Provisional Order No.', Comment = 'Número de pedido del pedido provisional';
        }
        field(140; NUMALB; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Shipment No.', Comment = 'Número de albarán del proveedor';
        }

        field(179; Processed; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Processed', Comment = 'Procesado';
        }


        // __ CAMPOS ADICIONALES __ //

        field(180; CustomerNo; Code[20])
        {
            Caption = 'Customer No.', Comment = 'Nº cliente';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                rCust: Record Customer;
            begin
                if CustomerNo = '' then
                    Clear(rCust)
                else
                    rCust.Get(CustomerNo);
            end;
        }
        field(181; ShipToCode; Code[10])
        {
            Caption = 'Ship-to Code', comment = 'Cód. dirección envío cliente';
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD(CustomerNo));
            DataClassification = CustomerContent;
        }
        field(182; BillToCustomerNo; Code[20])
        {
            Caption = 'Bill-to Customer No.', Comment = 'Factura-a Nº cliente';
            NotBlank = true;
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }


        field(200; SuccessfulConfirmation; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Successful Confirmation', Comment = 'Confirmación Exitosa';
        }
        field(400; HasError; Boolean)
        {
            Caption = 'Has Error', Comment = 'Tiene Error';
            DataClassification = CustomerContent;
        }
        field(401; ErrorDescription; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Error description', Comment = 'Descripción error';
        }
    }

    keys
    {
        key(Key1; EDIKey1)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    // __ TRIGGERS DE LA TABLA __ //

    trigger OnDelete()
    begin
        EDISalesLine.SetRange(EDIKey1, EDIKey1);
        EDISalesLine.DeleteAll(true);
        EDISalesComment.SetRange(EDIKey1, EDIKey1);
        EDISalesComment.DeleteAll(true);
        EDIBreakdownSalesLine.SetRange(EDIKey1, EDIKey1);
        EDIBreakdownSalesLine.DeleteAll(true);
    end;


    // __ VARIABLES GLOBALES __ //

    var
        NotEANCustomerErr: Label '***** ERROR:No se encuentra ningún cliente con EAN %1, AQSF %2 y Receptor %3',
            comment = '***** ERROR:No se encuentra ningún cliente con EAN %1, AQSF %2 y Receptor %3';
        NotAdrressCustomerErr: Label '***** ERROR:No se encuenta una dirección de entrega para el cliente %1 con EAN %2',
            comment = '***** ERROR:No se encuenta una dirección de entrega para el cliente %1 con EAN %2';
        NotReferenceItemErr: Label '***** ERROR:El producto referenciado en el EAN %1 con código %2 no existe',
            comment = '***** ERROR:El producto referenciado en el EAN %1 con código %2 no existe';
        MoreThanOneItemEANErr: Label '***** ERROR:Existe más de un producto con EAN %1 en el sistema. Revisar.',
            comment = '***** ERROR:Existe más de un producto con EAN %1 en el sistema. Revisar.';
        MoreThanOneItemEANCustErr: Label '***** ERROR:Existe más de un producto con EAN %1 en el sistema para el cliente %2. Revisar.',
            comment = '***** ERROR:Existe más de un producto con EAN %1 en el sistema para el cliente %2. Revisar.';

        MoreThanShipToCustErr: Label '***** ERROR:Existe más de una direccion de entrega para el cliente %1 con EAN %2 en el sistema. Revisar.',
            comment = '***** ERROR:Existe más de una direccion de entrega para el cliente %1 con EAN %2 en el sistema. Revisar.';
        BlockedErr: Label '***** ERROR:El %1 con código %2 esta bloqueado. Revisar.',
            comment = '***** ERROR:El %1 con código %2 esta bloqueado. Revisar.';
        AlreadyExistOrderErr: Label '***** ERROR:El pedido %1 para el cliente %2 ya existe en Navision con el numero %3',
            comment = '***** ERROR:El pedido %1 para el cliente %2 ya existe en Navision con el numero %3';
        AlreadyExistAndSentOrderErr: Label '***** ERROR:El pedido %1 para el cliente %2 ya existe en Navision con el numero %3 y se ha enviado en el albaran %4',
            comment = '***** ERROR:El pedido %1 para el cliente %2 ya existe en Navision con el numero %3 y se ha enviado en el albaran %4';
        ProcessErr: Label '***** ERROR: Al procesar el registro:%1',
            comment = '***** ERROR: Al procesar el registro:%1';
        VATRegGrNotFoundErr: Label '***** ERROR: No se encuentra ningún IVA con Grupo Registro IVA %1 y %2',
            comment = '***** ERROR: No se encuentra ningún IVA con Grupo Registro IVA %1 y %2';
        VATErr: Label '***** ERROR: El IVA del fichero %2 no coincide con el definido en Navision %1',
            comment = '***** ERROR: El IVA del fichero %2 no coincide con el definido en Navision %1';

        EDISalesLine: Record ABPEDIEDISalesLine;
        EDISalesComment: Record ABPEDIEDISalesComment;
        EDIBreakdownSalesLine: record ABPEDIEDIBreakdownSalesLine;
        EDILogError: Record ABPEDILogErrorEDI;


    // __ MÉTODOS GET Y SET __ //

    local procedure GetCustomerValues()
    var
        customer: Record Customer;
        shipToAddress: Record "Ship-to Address";
    begin
        shipToAddress.Reset;
        shipToAddress.SetCurrentKey(ABPEDIQPIDE);
        shipToAddress.SetRange(ABPEDIQPIDE, COMPRADOR);
        if shipToAddress.FindFirst then;
        customer.Reset;
        if not customer.Get(shipToAddress."Customer No.") then
            Clear(customer);
        Validate(CustomerNo, customer."No.");
    end;

    local procedure GetCustPmtAddress(_CustomerNo: Code[20]) _CustomerPmtAddrCode: Code[20]
    var
        customerPmtAddress: Record "Customer Pmt. Address";
    begin
        _CustomerPmtAddrCode := '';
        customerPmtAddress.Reset;
        customerPmtAddress.SetRange("Customer No.", _CustomerNo);
        if customerPmtAddress.FindFirst then
            _CustomerPmtAddrCode := customerPmtAddress.Code;
    end;

    local procedure GenerateSequenceNumber(var _SalesHeader: Record "Sales Header")
    var
        salesHeader: Record "Sales Header";
    begin
        salesHeader.SetRange("Document Type", salesHeader."Document Type"::Order);
        salesHeader.SetRange("External Document No.", Rec.NumPed);
        if not salesHeader.FindLast() then
            _SalesHeader.Validate(ABPEDISequence, 0)
        else
            _SalesHeader.Validate(ABPEDISequence, (salesHeader.ABPEDISequence + 1));
    end;

    local procedure CreateSalesHeader(var salesHeader: Record "Sales Header")
    begin
        salesHeader.Init;
        salesHeader."Document Type" := salesHeader."Document Type"::Order;
        salesHeader."No." := '';
        salesHeader.Insert(true);
        salesHeader.SetHideValidationDialog(true);
        salesHeader.Validate("Sell-to Customer No.", CustomerNo);
        salesHeader.Validate("Ship-to Code", ShipToCode);
        salesHeader.Validate("Bill-to Customer No.", BillToCustomerNo);
        salesHeader.Validate("Order Date", Date);
        salesHeader.Validate("External Document No.", NumPed);

        GenerateSequenceNumber(salesHeader);

        salesHeader.Validate(ABPEDIEmisor, Emisor);
        salesHeader.Validate("Pay-at Code", GetCustPmtAddress(salesHeader."Bill-to Customer No."));
        salesHeader.Validate(ABPEDIComesFromEDI, true);
        salesHeader.Modify(true);
    end;

    local procedure CreateCommentLines(var salesHeader: Record "Sales Header"; var lineNo: Integer)
    var
        salesCommentLine: Record "Sales Comment Line";
        EDISalesComment: Record ABPEDIEDISalesComment;
        salesComment: Text[70];
        int: Integer;
    begin
        EDISalesComment.SetCurrentKey(EDIKey1, EDIKey2);
        EDISalesComment.SetRange(EDIKey1, EDIKey1);
        lineNo := 0;
        if EDISalesComment.FindSet() then begin
            lineNo := 0;
            repeat
                for int := 1 to 5 do begin
                    case int of
                        1:
                            salesComment := EDISalesComment.Texto1;
                        2:
                            salesComment := EDISalesComment.Texto2;
                        3:
                            salesComment := EDISalesComment.Texto3;
                        4:
                            salesComment := EDISalesComment.Texto4;
                        5:
                            salesComment := EDISalesComment.Texto5;
                    end;
                    if salesComment <> '' then begin
                        lineNo := lineNo + 10000;
                        salesCommentLine.Init;
                        salesCommentLine."Document Type" := salesCommentLine."Document Type"::Order;
                        salesCommentLine."No." := salesHeader."No.";
                        salesCommentLine."Document Line No." := 0;
                        salesCommentLine."Line No." := lineNo;
                        salesCommentLine.Validate(Comment, StrSubstNo('%1-%2', EDISalesComment.Tema));
                        salesCommentLine.Insert(true);
                    end;
                end;
            until EDISalesComment.Next = 0;
        end;
    end;

    local procedure CreateSalesLine(var salesHeader: Record "Sales Header"; var lineNo: Integer)
    var
        salesLine: Record "Sales Line";
        EDISalesLine: Record ABPEDIEDISalesLine;
    begin
        EDISalesLine.SetCurrentKey(EDIKey1);
        EDISalesLine.SetRange(EDIKey1, EDIKey1);
        if EDISalesLine.FindSet() then
            repeat
                salesLine.Reset;
                salesLine.SetRange("Document Type", salesHeader."Document Type");
                salesLine.SetRange("Document No.", salesHeader."No.");
                if salesLine.Find('+') then
                    lineNo := salesLine."Line No."
                else
                    lineNo := 0;

                lineNo := lineNo + 10000;
                salesLine.Init;
                salesLine.SetHideValidationDialog(true);
                salesLine."Document Type" := salesHeader."Document Type";
                salesLine."Document No." := salesHeader."No.";
                salesLine."Line No." := lineNo;
                salesLine.Insert(true);
                salesLine.Validate(Type, salesLine.Type::Item);
                salesLine.Validate("No.", EDISalesLine."Item No.");
                salesLine.Validate("Unit of Measure Code", EDISalesLine."Unit of Measure Code");
                salesLine.Validate(Quantity, EDISalesLine.CantPed);
                if EDISalesLine.PrecioN <> 0 then
                    salesLine.Validate("Unit Price", EDISalesLine.PrecioN);
                Evaluate(salesLine.ABPEDIExternalLineNo, EDISalesLine.EDIKey2);
                salesLine.Modify(true);
            until EDISalesLine.Next = 0;
    end;


    // __ CREAR PEDIDO VENTA __ //

    procedure CreateSalesOrder(): Boolean
    var
        salesHeader: Record "Sales Header";
        lineNo: Integer;
    begin

        CheckEDIOrder;
        Commit();

        if HasError then
            exit(false);

        CreateSalesHeader(salesHeader); // Cabecera del pedido

        CreateCommentLines(salesHeader, lineNo); // Comentarios

        CreateSalesLine(salesHeader, lineNo); // Lineas

        // Tras procesar el pedido 

        Rec.Validate(Processed, true);
        Rec.Modify();
        exit(true);
    end;



    // __ GESTIÓN DE ERRORES __ //

    procedure CheckEDIOrder()
    var
        EDISalesLine, EDISalesLine2 : Record ABPEDIEDISalesLine;
        customer, invoiceCustomer : Record Customer;
        item, itemError : Record Item;
#pragma warning disable AL0432 // TODO - Revisar, ya que esta obsoleto y en alguna versión futura puede desaparecer
        itemCrossReference: Record "Item Cross Reference";

        salesHeader: Record "Sales Header";
        salesShipmentHeader: Record "Sales Shipment Header";
        salesShipmentLine, salesShipmentLine2 : Record "Sales Shipment Line";
        rShiptoAddress: Record "Ship-to Address";
        shipToAddress: Record "Ship-to Address";
        VATPostingGroup: Record "VAT Posting Setup";
        customerVATPostingGr: Code[10];
        itemVATGr: Code[10];
        unitOfMeasure: Code[10];
        itemCode: Code[20];
        lineNo, shipmentLineLineNo : Integer;
    begin

        HasError := false;

        //Inicializamos registro de errores para este caso.
        EDILogError.Reset;
        EDILogError.SetRange(Clave_1, EDIKey1);
        EDILogError.DeleteAll;

        GetCustomerValues;

        rShiptoAddress.Reset;
        rShiptoAddress.SetCurrentKey(ABPEDIQPide);
        rShiptoAddress.SetRange(ABPEDIQPide, COMPRADOR);
        if CLIENTE <> '' then
            rShiptoAddress.SetRange(ABPEDIAQSF, CLIENTE);
        if Receptor <> '' then
            rShiptoAddress.SetRange(ABPEDIEDICode, Receptor);
        if rShiptoAddress.FindFirst then;

        customer.Reset;
        if not customer.Get(rShiptoAddress."Customer No.") then
            SetError(StrSubstNo(NotEANCustomerErr, COMPRADOR, CLIENTE, Receptor), false);


        if customer.Blocked <> customer.Blocked::" " then
            SetError(StrSubstNo(BlockedErr, customer.TableCaption, customer."No."), false);

        invoiceCustomer := customer;

        if invoiceCustomer.Blocked <> invoiceCustomer.Blocked::" " then
            SetError(StrSubstNo(BlockedErr, invoiceCustomer.TableCaption, invoiceCustomer."No."), false);

        customerVATPostingGr := invoiceCustomer."VAT Bus. Posting Group";

        if Receptor <> '' then begin
            shipToAddress.Reset;
            shipToAddress.SetCurrentKey(ABPEDIEDICode);
            shipToAddress.SetRange("Customer No.", customer."No.");
            shipToAddress.SetRange(ABPEDIEDICode, Receptor);
            if not shipToAddress.Find('-') then
                SetError(StrSubstNo(NotAdrressCustomerErr, customer."No.", Receptor), false)
            else
                if (shipToAddress.Count <> 1) then
                    SetError(StrSubstNo(MoreThanShipToCustErr, customer."No.", Receptor), false)
        end else
            Clear(shipToAddress);

        salesHeader.Reset;
        salesHeader.SetCurrentKey("Sell-to Customer No.", "External Document No.");
        salesHeader.SetRange("Document Type", salesHeader."Document Type"::Order);
        salesHeader.SetRange("Sell-to Customer No.", customer."No.");
        salesHeader.SetRange("External Document No.", NumPed);
        if salesHeader.Find('-') then
            SetError(StrSubstNo(AlreadyExistOrderErr, NumPed, customer."No.", salesHeader."No."), false)
        else begin
            salesShipmentHeader.Reset;
            salesShipmentHeader.SetCurrentKey("Sell-to Customer No.", "External Document No.");
            salesShipmentHeader.SetRange("Sell-to Customer No.", customer."No.");
            salesShipmentHeader.SetRange("External Document No.", NumPed);
            if salesShipmentHeader.Find('-') then
                SetError(StrSubstNo(AlreadyExistAndSentOrderErr, NumPed, customer."No.", salesShipmentHeader."Order No.", salesShipmentHeader."No."), false)
        end;

        // Lineas
        EDISalesLine.SetCurrentKey(EDIKey1, EDIKey2);
        EDISalesLine.SetRange(EDIKey1, EDIKey1);
        if EDISalesLine.Findset() then
            repeat
                itemCode := '';
                unitOfMeasure := '';
                if (EDISalesLine.RefEAN = '0000000000000') or (EDISalesLine.RefEAN = '') then begin
                    EDISalesLine.RefEAN := EDISalesLine.DUN14;
                    EDISalesLine.Modify;
                end;

                if (EDISalesLine.RefEAN = '0000000000000') or (EDISalesLine.RefEAN = '') then
                    itemCode := CopyStr(EDISalesLine.RefProv, 1, 20)
                else begin
                    itemCode := '';
                    unitOfMeasure := '';
                    itemCrossReference.Reset;
                    itemCrossReference.SetRange("Cross-Reference Type", itemCrossReference."Cross-Reference Type"::Customer);
                    itemCrossReference.SetRange("Cross-Reference Type No.", CustomerNo);
                    itemCrossReference.SetRange("Cross-Reference No.", EDISalesLine.RefEAN);
                    itemCrossReference.SetRange("Discontinue Bar Code", false);
                    if itemCrossReference.Find('-') then begin
                        if itemCrossReference.Count <> 1 then
                            SetError(StrSubstNo(MoreThanOneItemEANCustErr, EDISalesLine.RefEAN, CustomerNo), false)
                        else begin
                            itemCode := itemCrossReference."Item No.";
                            unitOfMeasure := itemCrossReference."Unit of Measure";
                        end;
                    end else begin
                        itemCrossReference.Reset;
                        itemCrossReference.SetRange("Cross-Reference Type", itemCrossReference."Cross-Reference Type"::"Bar Code");
                        itemCrossReference.SetRange("Cross-Reference No.", EDISalesLine.RefEAN);
                        itemCrossReference.SetRange("Discontinue Bar Code", false);
                        if not itemCrossReference.Find('-') then begin
                            itemCode := EDISalesLine.RefProv;
                        end else
                            if itemCrossReference.Count <> 1 then
                                SetError(StrSubstNo(MoreThanOneItemEANErr, EDISalesLine.RefEAN), false)
                            else begin
                                itemCode := itemCrossReference."Item No.";
                                unitOfMeasure := itemCrossReference."Unit of Measure";
                            end;
                    end;
                end;
                if item.Get(itemCode) then begin
                    EDISalesLine.Validate("Item No.", itemCode);
                    if unitOfMeasure = '' then
                        unitOfMeasure := item."Base Unit of Measure";
                    EDISalesLine.Validate("Unit of Measure Code", unitOfMeasure);
                    itemVATGr := item."VAT Prod. Posting Group";
                    if not VATPostingGroup.Get(customerVATPostingGr, itemVATGr) then
                        SetError(StrSubstNo(VATRegGrNotFoundErr, customerVATPostingGr, itemVATGr), false)
                    else
                        if (EDISalesLine.TasaImp <> 0) and (VATPostingGroup."VAT %" <> EDISalesLine.TasaImp) then
                            SetError(StrSubstNo(VATErr, VATPostingGroup."VAT %", EDISalesLine.TasaImp), false);
                    if (EDISalesLine.TasaImp = 0) then
                        EDISalesLine.TasaImp := VATPostingGroup."VAT %";
                end else
                    SetError(StrSubstNo(NotReferenceItemErr, EDISalesLine.RefEAN, itemCode), false);
                EDISalesLine.Modify;
            until EDISalesLine.Next = 0;

        Validate(CustomerNo, customer."No.");
        Validate(BillToCustomerNo, invoiceCustomer."No.");
        Validate(ShipToCode, shipToAddress.Code);
        Modify;
    end;

    procedure SetError(_ErrorText: Text[1024]; _Processing: boolean)
    var
        errorDesc: Text;
    begin
        EDILogError.Reset;
        EDILogError.Init;
        EDILogError.Validate(Clave_1, EDIKey1);
        if _Processing then
            errorDesc := StrSubstNo(ProcessErr, _ErrorText)
        else
            errorDesc := _ErrorText;

        EDILogError.Validate(ErrorTxt, errorDesc);
        EDILogError.Insert(true);
        Rec.SetErrorDescription(errorDesc);
        HasError := true;
        Modify;
    end;

    procedure OpenError()
    var
        EDILogError: Record ABPEDILogErrorEDI;
    begin
        if HasError then begin
            EDILogError.Reset;
            EDILogError.SetRange(Clave_1, EDIKey1);
            PAGE.RunModal(PAGE::ABPEDILogErrorEDIList, EDILogError);
        end;
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
}