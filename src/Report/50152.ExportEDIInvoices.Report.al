// report 50152 "ABPEDIExportEDIInvoices"
// {
//     Permissions = TableData "Sales Invoice Header" = rm;
//     ProcessingOnly = true;
//     UseRequestPage = false;
//     caption = 'Export EDI Invoices', Comment = 'Exportar facturas EDI';

//     dataset
//     {
//         dataitem("Sales Invoice Header"; "Sales Invoice Header")
//         {

//             DataItemTableView = SORTING("No.") ORDER(Ascending);
//             RequestFilterFields = "No.", "Sell-to Customer No.", ABPEDISentToEDI;

//             dataitem("Sales Invoice Line"; "Sales Invoice Line")
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Type = CONST(Item));
//             }


//             trigger OnAfterGetRecord()
//             begin

//                 ClearVar();

//                 if (not "Sales Invoice Header".FindSet() or "Sales Invoice Header".ABPEDISentToEDI) then
//                     exit;

//                 tempBlob.CreateOutStream(OStream);
//                 Xmlport.Export(Xmlport::ABPEDIExampleEDIInvoiceExport, OStream, "Sales Invoice Header");
//                 tempBlob.CreateInStream(IStream);
//                 IStream.Read(Salida);
//                 ConvertedText := Base64Convert.ToBase64(Salida);

//                 FuncEDI.SendSalesInvoice(ConvertedText, "Sales Invoice Header"."No.");
//             end;
//         }
//     }

//     trigger OnPreReport()
//     begin

//     end;

//     procedure ClearVar()
//     begin
//         Clear(ConvertedText);
//         Clear(OStream);
//         Clear(tempBlob);
//         Clear(IStream);
//         Clear(Salida);
//     end;

//     var
//         OStream: OutStream;
//         IStream: InStream;
//         Salida: Text;
//         ConvertedText: Text;
//         tempBlob: Codeunit "Temp Blob";
//         FuncEDI: Codeunit ABPEDIEDICommonsFunctions;
//         Base64Convert: Codeunit "Base64 Convert";
// }