page 50155 "ABPEDIActivitiesCue"
{
//     Caption = 'Activities', Comment = 'Actividades';
//     PageType = CardPart;
//     SourceTable = "ABPEDIActivitiesCue";
//     RefreshOnActivate = true;
//     ShowFilter = false;
//     layout
//     {
//         area(Content)
//         {
//             cuegroup(SetupEntitiesCue)
//             {
//                 Caption = 'Setup', Comment = 'Configuración';
//                 field(Setup; Rec.Setup)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = "ABPEDIIntegrationSetup";
//                 }

//             }
//             cuegroup(AuxiliaryEntitiesCue)
//             {
//                 Caption = 'Auxiliary entities', Comment = 'Entidades auxiliares';

//             }
//             cuegroup(MainEntitiesCue)
//             {
//                 Caption = 'Main Entities', Comment = 'Entidades principales';

//             }

//             cuegroup(WaitingBoxesCue)
//             {
//                 Caption = 'Waiting Boxes', Comment = 'Buzones a la espera';
//                 field(PurchInvsInboundBox; Rec.InboundPurchInvoicesBox)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = ABPEDIInboundBoxList;
//                 }
//                 field(PurchInvsOutboundBox; Rec.OutboundPurchInvoicesBox)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = ABPEDIOutboundBoxList;
//                 }
//             }

//             cuegroup(CreatedBoxesCue)
//             {
//                 Caption = 'Created Boxes', Comment = 'Integraciones completadas';
//                 field(CreatedInboundPurchInvoicesBox; Rec.CreatedInboundPurchInvoicesBox)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = ABPEDICreatedInboundBoxList;
//                 }
//                 field(CreatedOutboundPurchInvsBox; Rec.CreatedOutboundPurchInvsBox)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = ABPEDICreatedOutboundBoxList;
//                 }
//             }

//             cuegroup(WebServicesCue)
//             {
//                 Caption = 'External Web Services Setup', Comment = 'Conf. servicios web externos';

//                 field(WebServiceConnections; Rec.WebServiceConnections)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = "ABP Web Service Connections";
//                 }
//                 field(CustomWebServices; Rec.CustomWebServices)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = "ABP Custom. Web Service list";
//                 }
//                 field(RESTLog; Rec.RestLog)
//                 {
//                     ApplicationArea = All;
//                     DrillDownPageId = "ABP REST Log List";
//                 }
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         Rec.Reset();
//         if not Rec.Get() then begin
//             Rec.Init();
//             Rec.Insert();
//             Commit();
//         end;
//     end;
}