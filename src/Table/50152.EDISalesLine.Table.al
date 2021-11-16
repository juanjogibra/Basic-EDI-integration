table 50152 ABPEDIEDISalesLine
{
    Caption = 'EDI Orders V24', Comment = 'Pedidos EDI V24';
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
        field(4; RefEAN; Text[17])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(5; DUN14; Text[14])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(6; VP; Text[2])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(7; RefCli; Text[35])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(8; RefProv; Text[35])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(9; REFETIQ; Text[35])
        {
            Description = 'LINEA" - Referencia para etiqueta';
            DataClassification = CustomerContent;
        }
        field(10; DescMer; Text[35])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(11; DescMer2; Text[35])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(12; DESCCONS; Text[35])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(13; CantPed; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            Caption = 'Quantity', Comment = 'Cantidad';
            DataClassification = CustomerContent;
        }
        field(14; UMedida; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
            Caption = 'Unit of M. Code', Comment = 'Cod. Ud. Medida';
        }
        field(15; CantGrat; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(16; CantUE; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(17; CantBoni; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(18; FechaE; Date)
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(19; PrecioN; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            Caption = 'Net Price', Comment = 'Precio Neto';
            DataClassification = CustomerContent;
        }
        field(20; PrecioB; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            Caption = 'Gross Price', Comment = 'Precio Bruto';
            DataClassification = CustomerContent;
        }
        field(21; PVP; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(22; Neto; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(23; Calif1; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 1';
            DataClassification = CustomerContent;
            Caption = 'Discount/Charge', Comment = 'Descuento/Cargo';
        }
        field(24; Secuen1; Integer)
        {
            Description = 'CABECERA Secuen1';
            DataClassification = CustomerContent;
        }
        field(25; TipoDto1; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(26; PorcenDto1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(27; ImporteDto1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
            Caption = 'Disc. Amount', Comment = 'Importe Dto.';
        }
        field(28; Calif2; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 2';
            DataClassification = CustomerContent;
        }
        field(29; Secuen2; Integer)
        {
            Description = 'LOC Secuen2';
            DataClassification = CustomerContent;
        }
        field(30; TipoDto2; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(31; PorcenDto2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(32; ImporteDto2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(33; Calif3; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 3';
            DataClassification = CustomerContent;
        }
        field(34; Secuen3; Integer)
        {
            Description = 'LOC Secuen3';
            DataClassification = CustomerContent;
        }
        field(35; TipoDto3; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(36; PorcenDto3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(37; ImporteDto3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(38; Calif4; Text[3])
        {
            Description = 'LOC : A=Descuento ; C = Cargo 4';
            DataClassification = CustomerContent;
        }
        field(39; Secuen4; Integer)
        {
            Description = 'LOC Secuen4';
            DataClassification = CustomerContent;
        }
        field(40; TipoDto4; Text[3])
        {
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(41; PorcenDto4; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(42; ImporteDto4; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LOC';
            DataClassification = CustomerContent;
        }
        field(43; TipoImp1; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(44; TasaImp1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(45; ImpImp1; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(46; TipoImp2; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(47; TasaImp2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(48; ImpImp2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(49; TipoImp3; Text[3])
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(50; TasaImp3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(51; ImpImp3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(52; NUCUE; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Number of consumption units in the unit of measure', Comment = 'Número de unidades de consumo en la unidad de medida';
        }
        field(53; FORMATO; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Expedition Format Type', Comment = 'Tipo Formato de la unidad de expedicion';
        }
        field(54; NUEXP; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'No of expeditions', Comment = 'Número de unidades de expedición';
        }

        field(55; PNCAJA; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Net Weight of Box', Comment = 'Peso Neto de la Caja';
        }
        field(56; MONEDAPRECIO; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Price Currency', Comment = 'Divisa del precio';
        }
        field(57; MARCA; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Model/Brand', Comment = 'Modelo/Marca';
        }
        field(58; COLOR; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Color according to ECI', Comment = 'Color segun ECI';
        }
        field(59; TAMAÑO; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Size or Last', Comment = 'Tamaño u Horma';
        }
        field(60; PRESENTACION; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Presentation Format', Comment = 'Presentacion Formato';
        }
        field(61; UNIDCOM; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Purchase Unit', Comment = 'Unidad de Compra';
        }
        field(62; PUM; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Purchase Unit', Comment = 'Unidad de Compra';
        }
        field(63; FORMATO2; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Format Type 2', Comment = 'Tipo de formato 2';
        }
        field(64; NUEXP2; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'No of expeditions 2', Comment = 'Número de unidades de expedición 2';
        }
        field(65; FORMATO3; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Format Type 3', Comment = 'Tipo Formato 3';
        }
        field(66; NUEXP3; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'No of expeditions 3', Comment = 'Número de unidades de expedición 3';
        }

        field(67; CANTSUB; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Subpackage units', Comment = 'Unidades de subembalaje';
        }
        field(68; FechaCad; Date)
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(69; CAJASXCAP; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Number of boxes per pallet layer', Comment = 'Número de cajas por capa de palet';
        }
        field(70; CAPAXPAL; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Number of layer per pallet', Comment = 'Número de capas por palet';
        }
        field(71; CIUDADCLF; text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Final Customer City and County Name', Comment = 'Nombre de ciudad y provincia del cliente final';
        }
        field(72; AUTOR; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Author name', Comment = 'Nombre del autor';
        }
        field(73; TITULO; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Title of work', Comment = 'Título de la obra';
        }
        field(74; FechaEPR; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(75; FechaTOP; Date)
        {
            Description = 'CABECERA';
            DataClassification = CustomerContent;
        }
        field(76; TALLA; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Size', Comment = 'Talla del artículo';
        }
        field(77; PBCAJA; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Gross Box Weight', Comment = 'Peso Bruto de caja';
        }
        field(78; CLIENTEFIN; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'EAN code of the end customer', Comment = 'Código EAN del cliente final';
        }
        field(79; DOMICILIOCLF; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'End customer address', Comment = 'Domicilio del cliente final';
        }
        field(80; CPCLF; Text[9])
        {
            DataClassification = CustomerContent;
            Caption = 'End customer postal code', Comment = 'Código Postal del cliente final';
        }

        field(81; CONTACTINFOCLF; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'End customer information contact', Comment = 'Persona de contacto de información del cliente final';
        }
        field(82; CONTACTPEDCLF; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'End customer information order', Comment = 'Persona de contacto de pedidos del cliente final';
        }
        field(83; CONTACTCOMPCLF; Text[70])
        {
            DataClassification = CustomerContent;
            Caption = 'End customer information purchase', Comment = 'Persona de contacto de compras del cliente final';
        }
        field(84; GRUPOPRODIN; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Buyers Internal Product Group', Comment = 'Grupo de producto Interno del comprador';
        }
        field(85; IDENTIFPROD; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Product or service Identifier', Comment = 'Identificador de producto o servicio';
        }

        field(86; INFOETIQ1; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Additional text for label, line 1', Comment = 'Texto adicional para etiqueta, linea 1';
        }
        field(87; INFOETIQ2; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Additional text for label, line 2', Comment = 'Texto adicional para etiqueta, linea 2';
        }
        field(88; INFOETIQ3; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Additional text for label, line 3', Comment = 'Texto adicional para etiqueta, linea 3';
        }
        field(89; MODELO; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Model Name according to ECI', Comment = 'Nombre del modelo segun ECI';
        }
        field(90; SERIE; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial Name according to ECI', Comment = 'Nombre de la serie segun ECI';
        }
        field(91; PrecioI; Decimal)
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }
        field(92; NUMPEDCOM; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Order No (Purchaser)', Comment = 'Numero de pedido (Comprador)';
        }
        field(93; FECNUMPEDCOM; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reference date', Comment = 'Fecha de referencia';
        }
        field(94; NUMCLIFIN; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'End customer reference number', Comment = 'Número de referencia del cliente final';
        }
        field(95; FECNUMCLIFIN; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Request Delivery date', Comment = 'Fecha de entrega solicitada';
        }
        field(96; DESCOD; Text[17])
        {
            DataClassification = CustomerContent;
            Caption = 'Coded Item Description', Comment = 'Descripción del artículo codíficada';
        }
        field(97; CODISBN; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'ISBN Code', Comment = 'Código ISBN';
        }
        field(98; UMCANTUE; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of measure for the quantity in the CANTUE field', Comment = 'Unidad de medida de la cantidad del campo CANTUE';
        }
        field(99; UMPBCAJA; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of measure for gross box weight', Comment = 'Unidad de medida del peso bruto de la caja';
        }
        field(100; UMPNCAJA; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of measure for net box weight', Comment = 'Unidad de medida del peso neto de la caja';
        }
        field(101; UPRECION; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of measure of net unit price', Comment = 'Unidad de medida del precio neto unitario';
        }
        field(102; UPRECIOB; Text[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of measure of gross unit price', Comment = 'Unidad de medida del precio bruto unitario';
        }
        field(103; TIPEMB; Text[35])
        {
            DataClassification = CustomerContent;
            Caption = 'EAN13 or DUN14 code of the packaging', Comment = 'Código EAN13 o DUN14 del embalaje';
        }
        field(104; VOLUMEN; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Line volume, for import orders', Comment = 'Volumen de línea, para pedidos de importación';
        }
        field(105; VOLUMUM; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of measure for volume, for import orders', Comment = 'Unidad de medida del volumen, para pedidos de importación';
        }
        field(106; FECHAENV; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Shipment Date', Comment = 'Fecha de envío';
        }
        field(107; IDENTADU; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Customs Identity', Comment = 'Identidad Aduanera';
        }





        field(571; TasaImp; Decimal)
        {
            Description = 'LINEA';
            DataClassification = CustomerContent;
        }

        field(3100; "Item No."; Code[20])
        {
            Caption = 'No.', Comment = 'Nº';
            Editable = false;
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(3101; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code', Comment = 'Cód. unidad medida';
            Editable = false;
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item No."));
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; EDIKey1, EDIKey2)
        {
            Clustered = true;
        }
    }
}