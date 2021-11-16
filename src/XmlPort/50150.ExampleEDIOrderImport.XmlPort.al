xmlport 50150 "ABPEDIExampleEDIOrderImport"
{
    Caption = 'Import EDI Sales Order (v24)', comment = 'Importación Pedido Venta EDI V24';
    Direction = Import;
    //Encoding = UTF8;
    Format = FixedText;
    PreserveWhiteSpace = true;
    TableSeparator = '---<NewLine>';
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(CABECERA; ABPEDIEDISalesHeader) //2.1 Cabecera y pie del Pedido
            {
                XmlName = 'CABECERA';
                UseTemporary = true;

                fieldelement(vEtiqueta; CABECERA.EDILabel)
                {
                    Width = 8;
                    trigger OnAfterAssignField()
                    begin
                        if CABECERA.EDILabel <> 'CABECERA' then
                            currXMLport.Break();
                        currentLine := CABECERA.EDILabel;
                    end;
                }
                fieldelement(vClave1; "CABECERA".EDIKey1)
                {
                    Width = 8;
                }
                
                fieldelement(vNodo; "CABECERA".Nodo)
                {
                    Width = 3;
                }
                fieldelement(vFuncion; CABECERA.Funcion)
                {
                    Width = 3;
                }
                fieldelement(vNumPed; "CABECERA".NumPed)
                {
                    Width = 15;
                }
                textelement(vFecha)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFecha <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFecha);
                            Evaluate(CABECERA.Date, vFecha);
                        end;
                    end;
                }
                textelement(vFechaEPR)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaEPR <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaEPR);
                            Evaluate(CABECERA.FechaEPR, vFechaEPR);
                        end;
                    end;
                }
                textelement(vFechaEre)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaEre <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaEre);
                            Evaluate(CABECERA.FechaERE, vFechaEre);
                        end;
                    end;
                }
                textelement(vFechaTop)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaTop <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaTop);
                            Evaluate(CABECERA.FechaTOP, vFechaTop);
                        end;
                    end;
                }
                fieldelement(vFormaPag; CABECERA.FormaPag)
                {
                    Width = 3;
                }
                fieldelement(vCondEsp; CABECERA.CondESP)
                {
                    Width = 3;
                }
                fieldelement(vPedAbier; "CABECERA".PedAbier)
                {
                    Width = 17;
                }
                fieldelement(vLPrecios; "CABECERA".LPrecios)
                {
                    Width = 17;
                }
                fieldelement(vNContrat; "CABECERA".NContrat)
                {
                    Width = 17;
                }
                fieldelement(vFContrat; "CABECERA".FContrat)
                {
                    Width = 12;
                }

                fieldelement(vEmisor; CABECERA.Emisor)
                {
                    Width = 17;
                }

                fieldelement(vComprador; "CABECERA".COMPRADOR)
                {
                    Width = 17;
                    Description = 'COMPRADOR';
                    
                }
                fieldelement(vCliente; "CABECERA".CLIENTE)
                {
                    Width = 17;
                }
                fieldelement(vDepto; CABECERA.Depto)
                {
                    Width = 17;
                }
                fieldelement(vReceptor; "CABECERA".Receptor)
                {
                    Width = 17;
                }
                fieldelement(vMuelle; CABECERA.Muelle)
                {
                    Width = 17;
                }
                fieldelement(vVendedor; "CABECERA".Vendedor)
                {
                    Width = 17;
                }
                fieldelement(vQPaga; CABECERA.EDIQPAGA)
                {
                    Width = 17;
                }
                fieldelement(vPortes; CABECERA.Portes)
                {
                    Width = 3;
                }                
                fieldelement(vRecogida; "CABECERA".Recogida)
                {
                    Width = 3;
                }
                fieldelement(vReposi; CABECERA.Reposi)
                {
                    Width = 35;
                }
                fieldelement(vEntrega; CABECERA.Entrega)
                {
                    Width = 35;
                }
                fieldelement(vMoneda; "CABECERA".Moneda)
                {
                    Width = 3;
                }
                fieldelement(vCalif1; CABECERA.Calif1)
                {
                    Width = 3;
                }
                fieldelement(vSecuen1; CABECERA.Secuen1)
                {
                    Width = 2;
                }
                fieldelement(vTipo1; CABECERA.TipoDto1)
                {
                    Width = 3;
                }

                textelement(vPorcenDto1)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPorcenDto1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPorcenDto1, 3);
                            Evaluate(CABECERA.PorcenDto1, vPorcenDto1);
                        end;
                    end;
                }
                textelement(vImpDto1)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpDto1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpDto1, 3);
                            Evaluate(CABECERA.ImporteDto1, vImpDto1);
                        end;
                    end;
                }

                fieldelement(vCalif2; CABECERA.Calif2)
                {
                    Width = 3;
                }
                fieldelement(vSecuen2; CABECERA.Secuen2)
                {
                    Width = 2;
                }
                fieldelement(vTipo2; CABECERA.TipoDto2)
                {
                    Width = 3;
                }

                textelement(vPorcenDto2)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPorcenDto2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPorcenDto2, 3);
                            Evaluate(CABECERA.PorcenDto2, vPorcenDto2);
                        end;
                    end;
                }
                textelement(vImpDto2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpDto2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpDto2, 3);
                            Evaluate(CABECERA.ImporteDto2, vImpDto2);
                        end;
                    end;
                }
                fieldelement(vCalif3; CABECERA.Calif3)
                {
                    Width = 3;
                }
                fieldelement(vSecuen3; CABECERA.Secuen3)
                {
                    Width = 2;
                }
                fieldelement(vTipo3; CABECERA.TipoDto3)
                {
                    Width = 3;
                }

                textelement(vPorcenDto3)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPorcenDto3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPorcenDto3, 3);
                            Evaluate(CABECERA.PorcenDto3, vPorcenDto3);
                        end;
                    end;
                }
                textelement(vImpDto3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpDto3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpDto3, 3);
                            Evaluate(CABECERA.ImporteDto3, vImpDto3);
                        end;
                    end;
                }

                fieldelement(vCalif4; CABECERA.Calif4)
                {
                    Width = 3;
                }
                fieldelement(vSecuen4; CABECERA.Secuen4)
                {
                    Width = 2;
                }
                fieldelement(vTipo4; CABECERA.TipoDto4)
                {
                    Width = 3;
                }

                textelement(vPorcenDto4)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPorcenDto4 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPorcenDto4, 3);
                            Evaluate(CABECERA.PorcenDto4, vPorcenDto4);
                        end;
                    end;
                }
                textelement(vImpDto4)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpDto4 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpDto4, 3);
                            Evaluate(CABECERA.ImporteDto4, vImpDto4);
                        end;
                    end;
                }
                fieldelement(vCalif5; CABECERA.Calif5)
                {
                    Width = 3;
                }
                fieldelement(vSecuen5; CABECERA.Secuen5)
                {
                    Width = 2;
                }
                fieldelement(vTipo5; CABECERA.TipoDto5)
                {
                    Width = 3;
                }
                textelement(vPorcenDto5)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPorcenDto5 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPorcenDto5, 3);
                            Evaluate(CABECERA.PorcenDto5, vPorcenDto5);
                        end;
                    end;
                }
                textelement(vImpDto5)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpDto5 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpDto5, 3);
                            Evaluate(CABECERA.ImporteDto5, vImpDto5);
                        end;
                    end;
                }

                fieldelement(vTipoImp1; CABECERA.TipoImp1)
                {
                    Width = 3;
                }
                textelement(vTasaImp1)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTasaImp1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTasaImp1, 3);
                            Evaluate(CABECERA.TasaImp1, vTasaImp1);
                        end;
                    end;
                }
                textelement(vBaseImp1)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vBaseImp1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vBaseImp1, 3);
                            Evaluate(CABECERA.BaseImp1, vBaseImp1);
                        end;
                    end;
                }
                textelement(vImpImp1)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpImp1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpImp1, 3);
                            Evaluate(CABECERA.ImpImp1, vImpImp1);
                        end;
                    end;
                }
                fieldelement(vTipoImp2; CABECERA.TipoImp2)
                {
                    Width = 3;
                }
                textelement(vTasaImp2)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTasaImp2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTasaImp2, 3);
                            Evaluate(CABECERA.TasaImp2, vTasaImp2);
                        end;
                    end;
                }
                textelement(vBaseImp2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vBaseImp2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vBaseImp2, 3);
                            Evaluate(CABECERA.BaseImp2, vBaseImp2);
                        end;
                    end;
                }
                textelement(vImpImp2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpImp2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpImp2, 3);
                            Evaluate(CABECERA.ImpImp2, vImpImp2);
                        end;
                    end;
                }
                fieldelement(vTipoImp3; CABECERA.TipoImp3)
                {
                    Width = 3;
                }
                textelement(vTasaImp3)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTasaImp3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTasaImp3, 3);
                            Evaluate(CABECERA.TasaImp3, vTasaImp3);
                        end;
                    end;
                }
                textelement(vBaseImp3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vBaseImp3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vBaseImp3, 3);
                            Evaluate(CABECERA.BaseImp3, vBaseImp3);
                        end;
                    end;
                }
                textelement(vImpImp3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vImpImp3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vImpImp3, 3);
                            Evaluate(CABECERA.ImpImp3, vImpImp3);
                        end;
                    end;
                }                

                fieldelement(vPaTRef; CABECERA.PATREF)
                {
                    Width = 3;
                }
                fieldelement(vPaTDias; CABECERA.PATDIAS)
                {
                    Width = 3;
                }
                fieldelement(vPaTMes; CABECERA.PATMESES)
                {
                    Width = 3;
                }
                textelement(vVTO1)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vVTO1 <> '' then begin
                            ImportEDIOrder.ImportarFecha(vVTO1);
                            Evaluate(CABECERA.VTO1, vVTO1);
                        end;
                    end;
                }

                textelement(vIMPVTO1)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vIMPVTO1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vIMPVTO1, 3);
                            Evaluate(CABECERA.IMPVTO1, vIMPVTO1);
                        end;
                    end;
                }
                textelement(vVTO2)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vVTO2 <> '' then begin
                            ImportEDIOrder.ImportarFecha(vVTO2);
                            Evaluate(CABECERA.VTO2, vVTO2);
                        end;
                    end;
                }

                textelement(vIMPVTO2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vIMPVTO2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vIMPVTO2, 3);
                            Evaluate(CABECERA.IMPVTO2, vIMPVTO2);
                        end;
                    end;
                }

                textelement(vVTO3)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vVTO3 <> '' then begin
                            ImportEDIOrder.ImportarFecha(vVTO3);
                            Evaluate(CABECERA.VTO3, vVTO3);
                        end;
                    end;
                }
                textelement(vIMPVTO3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vIMPVTO3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vIMPVTO3, 3);
                            Evaluate(CABECERA.IMPVTO3, vIMPVTO3);
                        end;
                    end;
                }

                textelement(vTBruto)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTBruto <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTBruto, 3);
                            Evaluate(CABECERA.TBruto, vTBruto);
                        end;
                    end;
                }

                textelement(vTNeto)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTNeto <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTNeto, 3);
                            Evaluate(CABECERA.TNeto, vTNeto);
                        end;
                    end;
                }
                textelement(vTCargDes)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTCargDes <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTCargDes, 3);
                            Evaluate(CABECERA.TCARDES, vTCargDes);
                        end;
                    end;
                }
                textelement(vBaseImp)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vBaseImp <> '' then begin
                            ImportEDIOrder.ImportarNumero(vBaseImp, 3);
                            Evaluate(CABECERA.BASEIMP, vBaseImp);
                        end;
                    end;
                }
                textelement(vtotalImp)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vtotalImp <> '' then begin
                            ImportEDIOrder.ImportarNumero(vtotalImp, 3);
                            Evaluate(CABECERA.TotImpue, vtotalImp);
                        end;
                    end;
                }
                textelement(vTotalPagar)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vTotalPagar <> '' then begin
                            ImportEDIOrder.ImportarNumero(vTotalPagar, 3);
                            Evaluate(CABECERA.TotalPagar, vTotalPagar);
                        end;
                    end;
                }

                textelement(vfechaRec)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vfechaRec <> '' then begin
                            ImportEDIOrder.ImportarFecha(vfechaRec);
                            Evaluate(CABECERA.FRECOGID, vfechaRec);
                        end;
                    end;
                }
                fieldelement(vCodTransp; CABECERA.TRANSPOR)
                {
                    Width = 17;
                }
                fieldelement(vAlmRec; CABECERA.ALMRECOGID)
                {
                    Width = 17;
                }
                textelement(vFecPago)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFecPago <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFecPago);
                            Evaluate(CABECERA.FREFPAG, vFecPago);
                        end;
                    end;
                }
                fieldelement(vTotalCant; "CABECERA".TOTCANT)
                {
                    Width = 15;
                }
                fieldelement(vTemporada; CABECERA.TEMPORADA)
                {
                    Width = 35;
                }
                fieldelement(vDeptVent; CABECERA.DEPTOVENTA)
                {
                    Width = 17;
                }
                fieldelement(vSucursal; CABECERA.SUCURSAL)
                {
                    Width = 17;
                }
                fieldelement(vDestinoMsg; CABECERA.DESTMSG)
                {
                    Width = 17;
                }
                fieldelement(vCondPago; CABECERA.CONDPAGO)
                {
                    Width = 5;
                }
                fieldelement(vTransport; CABECERA.TRANSPORT)
                {
                    Width = 5;
                }
                fieldelement(vLugAdiEnt; CABECERA.LUGADIENT)
                {
                    Width = 17;
                }
                fieldelement(vCodProd; CABECERA.CODPROD)
                {
                    Width = 17;
                }

                fieldelement(vDestFinal; CABECERA.DESTFINAL)
                {
                    Width = 17;
                }

                fieldelement(vNombDestFinal; CABECERA.NOMDESTFIN)
                {
                    Width = 70;
                }
                fieldelement(vDirDestFinal; CABECERA.DIRDESTFIN)
                {
                    Width = 70;
                }
                fieldelement(vPobDestFinal; CABECERA.POBDESTFIN)
                {
                    Width = 35;
                }

                fieldelement(vProvDestFinal; CABECERA.PROVDESTFIN)
                {
                    Width = 35;
                }
                fieldelement(vCPDestFinal; CABECERA.CPDESTFIN)
                {
                    Width = 9;
                }
                fieldelement(vTelDestFin; CABECERA.TELFDESTFIN)
                {
                    Width = 35;
                }
                fieldelement(vTelDestFin2; CABECERA.TELFDESTFIN2)
                {
                    Width = 35;
                }
                fieldelement(vNumTalon; CABECERA.NUMTALON)
                {
                    Width = 17;
                }
                fieldelement(vNumReserva; CABECERA.NUMRESERVA)
                {
                    Width = 17;
                }

                textelement(vPesBrutTotal)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPesBrutTotal <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPesBrutTotal, 3);
                            Evaluate(CABECERA.PESBRUTOT, vPesBrutTotal);
                        end;
                    end;
                }
                textelement(vNumToBult)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vNumToBult <> '' then begin
                            ImportEDIOrder.ImportarNumero(vNumToBult, 3);
                            Evaluate(CABECERA.NUMTOBUL, vNumToBult);
                        end;
                    end;
                }

                fieldelement(vCondeSP2; CABECERA.CONDESP2)
                {
                    Width = 3;
                }
                fieldelement(vCondeSP3; CABECERA.CONDESP3)
                {
                    Width = 3;
                }
                fieldelement(vCondeSP4; CABECERA.CONDESP4)
                {
                    Width = 3;
                }
                fieldelement(vCondeSP5; CABECERA.CONDESP5)
                {
                    Width = 3;
                }
                fieldelement(vNomCondRec; CABECERA.NOMCONREC)
                {
                    Width = 35;
                }
                fieldelement(vTipoCta; CABECERA.TIPOCTA)
                {
                    Width = 35;
                }
                fieldelement(NumPromo; CABECERA.NUMPROMO)
                {
                    Width = 35;
                }
                fieldelement(vCodRes; CABECERA.CODRES)
                {
                    Width = 3;
                }
                fieldelement(vNRefCliente; CABECERA.NREFCLIENTE)
                {
                    Width = 70;
                }
                fieldelement(vFNRefCliente; CABECERA.FNREFCLIENTE)
                {
                    Width = 12;
                }
                fieldelement(vNProyecto; CABECERA.NPROYECTO)
                {
                    Width = 70;
                }
                fieldelement(vFnProyecto; CABECERA.FNPROYECTO)
                {
                    Width = 12;
                }
                fieldelement(vManuFacturador; CABECERA.MANUFACTURADOR)
                {
                    Width = 35;
                }
                fieldelement(vOrdenador; CABECERA.ORDENADOR)
                {
                    Width = 35;
                }
                fieldelement(vUconsignador; CABECERA.UCONSIGNADOR)
                {
                    Width = 35;
                }
                fieldelement(vDiruConsig; CABECERA.DIRUCONSIG)
                {
                    Width = 70;
                }
                fieldelement(vPobuConsig; CABECERA.POBUCONSIG)
                {
                    Width = 35;
                }
                fieldelement(vProvuConsig; CABECERA.PROVUCONSIG)
                {
                    Width = 35;
                }
                fieldelement(vCpuConsig; CABECERA.CPUCONSIG)
                {
                    Width = 9;
                }
                fieldelement(vEanZZZ; CABECERA.EANZZZ)
                {
                    Width = 35;
                }
                fieldelement(cContInfoComp; CABECERA.CONTINFOCOMP)
                {
                    Width = 70;
                }
                fieldelement(vContPedCom; CABECERA.CONTPEDCOM)
                {
                    Width = 70;
                }
                fieldelement(vImpVenDisc; CABECERA.IMPVENDISC) //Revisar
                {
                    Width = 15;
                }
                fieldelement(vTransportCodesc; CABECERA.TRANSPORTCODESC)
                {
                    Width = 8;
                }
                fieldelement(vTransportDesc; CABECERA.TRANSPORTDESC)
                {
                    Width = 17;
                }
                fieldelement(vCondEntrega; CABECERA.CONDENTREGA)
                {
                    Width = 70;
                }
                fieldelement(vTelefComp; CABECERA.TELEFCOMP) //Revisar
                {
                    Width = 70;
                }
                fieldelement(vPaisReceptorMercancia; CABECERA.RECEPTORPAIS)
                {
                    Width = 3;
                }
                fieldelement(vCompradorPais; CABECERA.COMPRADORPAIS)
                {
                    Width = 3;
                }
                fieldelement(vCodDepEmpEntMerc; CABECERA.RECEPTORCONTCOD)
                {
                    Width = 17;
                }
                fieldelement(vNumPedTienda; CABECERA.NUMPEDTIENDA)
                {
                    Width = 35;
                }
                fieldelement(vDescripFormaPago; CABECERA.DESCPAGO)
                {
                    Width = 70;
                }
                fieldelement(vNumPedProv; CABECERA.NUMPEDPROV) //Error
                {
                    Width = 17;
                }
                fieldelement(vNumAlbProveedor; CABECERA.NUMALB)
                {
                    Width = 35;
                }

            }
            tableelement(OBSER; ABPEDIEDISalesComment) //2.2 Observaciones sobre el pedido
            {
                XmlName = 'OBSER';
                UseTemporary = true;

                fieldelement(vEtiqueta; OBSER.EDILabel)
                {
                    Width = 8;
                    trigger OnAfterAssignField()
                    begin
                        if OBSER.EDILabel <> 'OBSER' then
                            currXMLport.Break();
                    end;
                }
                fieldelement(vClave1; OBSER.EDIKey1)
                {
                    Width = 8;
                }
                fieldelement(vClave2; OBSER.EDIKey2)
                {
                    Width = 5;
                }
                fieldelement(vTema; OBSER.Tema)
                {
                    Width = 3;
                }
                fieldelement(vText01; OBSER.Texto1)
                {
                    Width = 70;
                }
                fieldelement(vText02; OBSER.Texto2)
                {
                    Width = 70;
                }
                fieldelement(vText03; OBSER.Texto3)
                {
                    Width = 70;
                }
                fieldelement(vText04; OBSER.Texto4)
                {
                    Width = 70;
                }
                fieldelement(vText05; OBSER.Texto5)
                {
                    Width = 70;
                }
            }
            tableelement(LINEA; ABPEDIEDISalesLine) //2.3 Detalle del Pedido
            {
                XmlName = 'LINEA';
                UseTemporary = true;

                fieldelement(vEtiqueta; LINEA.EDILabel)
                {
                    Width = 8;
                    trigger OnAfterAssignField()
                    begin
                        if LINEA.EDILabel <> 'LINEA' then
                            currXMLport.Break();
                        currentLine := LINEA.EDILabel;
                    end;
                }

                fieldelement(vClave1; LINEA.EDIKey1)
                {
                    Width = 8;
                }
                fieldelement(vClave2; LINEA.EDIKey2)
                {
                    Width = 5;
                    trigger OnAfterAssignField()
                    begin
                        currentKey := LINEA.EDIKey2;
                    end;
                }
                fieldelement(vRefEan; LINEA.RefEAN)
                {
                    Width = 17;
                }
                fieldelement(vDun14; LINEA.DUN14)
                {
                    Width = 14;
                }
                fieldelement(vVP; LINEA.VP)
                {
                    Width = 2;
                }
                fieldelement(vRefCli; LINEA.RefCli)
                {
                    Width = 35;
                }
                fieldelement(vRefProv; LINEA.RefProv)
                {
                    Width = 35;
                }
                fieldelement(vRefEtiq; LINEA.REFETIQ)
                {
                    Width = 35;
                }
                fieldelement(vDescMer; LINEA.DescMer)
                {
                    Width = 35;
                }
                fieldelement(vDescMer2; LINEA.DescMer2)
                {
                    Width = 35;
                }
                fieldelement(vCodNaci; LINEA.DESCCONS)
                {
                    Width = 35;
                }                

                textelement(vCantPed)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCantPed <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCantPed, 3);
                            Evaluate(LINEA.CantPed, vCantPed);
                        end;
                    end;
                }
                fieldelement(vUMedida; LINEA.UMedida)
                {
                    Width = 3;
                }
                textelement(vCantGrat)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCantGrat <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCantGrat, 3);
                            Evaluate(LINEA.CantGrat, vCantGrat);
                        end;
                    end;
                }
                textelement(vCantUE)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCantUE <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCantUE, 3);
                            Evaluate(LINEA.CantUE, vCantUE);
                        end;
                    end;
                }
                textelement(vCantBoni)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCantBoni <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCantBoni, 3);
                            Evaluate(LINEA.CantBoni, vCantBoni);
                        end;
                    end;
                }
                textelement(vFechaE)
                {
                    Width = 12;
                }
                
                textelement(vPrecioN)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPrecioN <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPrecioN, 3);
                            Evaluate(LINEA.PrecioN, vPrecioN);
                        end;
                    end;
                }
                textelement(vPrecioB)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPrecioB <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPrecioB, 3);
                            Evaluate(LINEA.PrecioB, vPrecioB);
                        end;
                    end;
                }
                textelement(vPvp)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPvp <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPvp, 3);
                            Evaluate(LINEA.PVP, vPvp);
                        end;
                    end;
                }
                textelement(vNeto)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vNeto <> '' then begin
                            ImportEDIOrder.ImportarNumero(vNeto, 3);
                            Evaluate(LINEA.Neto, vNeto);
                        end;
                    end;
                }
                fieldelement(vCalif1; LINEA.Calif1)
                {
                    Width = 3;
                }
                fieldelement(vSecuen1; LINEA.Secuen1)
                {
                    Width = 2;
                }
                fieldelement(vTipo1; LINEA.TipoDto1)
                {
                    Width = 3;
                }

                textelement(vLinPorcenDto1)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinPorcenDto1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinPorcenDto1, 3);
                            Evaluate(LINEA.PorcenDto1, vLinPorcenDto1);
                        end;
                    end;
                }
                textelement(vLinImpDto1)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpDto1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpDto1, 3);
                            Evaluate(LINEA.ImporteDto1, vLinImpDto1);
                        end;
                    end;
                }

                fieldelement(vCalif2; LINEA.Calif2)
                {
                    Width = 3;
                }
                fieldelement(vSecuen2; LINEA.Secuen2)
                {
                    Width = 2;
                }
                fieldelement(vTipo2; LINEA.TipoDto2)
                {
                    Width = 3;
                }

                textelement(vLinPorcenDto2)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinPorcenDto2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinPorcenDto2, 3);
                            Evaluate(LINEA.PorcenDto2, vLinPorcenDto2);
                        end;
                    end;
                }
                textelement(vLinImpDto2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpDto2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpDto2, 3);
                            Evaluate(LINEA.ImporteDto2, vLinImpDto2);
                        end;
                    end;
                }
                fieldelement(vCalif3; LINEA.Calif3)
                {
                    Width = 3;
                }
                fieldelement(vSecuen3; LINEA.Secuen3)
                {
                    Width = 2;
                }
                fieldelement(vTipo3; LINEA.TipoDto3)
                {
                    Width = 3;
                }

                textelement(vLinPorcenDto3)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinPorcenDto3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinPorcenDto3, 3);
                            Evaluate(LINEA.PorcenDto3, vLinPorcenDto3);
                        end;
                    end;
                }
                textelement(vLinImpDto3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpDto3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpDto3, 3);
                            Evaluate(LINEA.ImporteDto3, vLinImpDto3);
                        end;
                    end;
                }

                fieldelement(vCalif4; LINEA.Calif4)
                {
                    Width = 3;
                }
                fieldelement(vSecuen4; LINEA.Secuen4)
                {
                    Width = 2;
                }
                fieldelement(vTipo4; LINEA.TipoDto4)
                {
                    Width = 3;
                }

                textelement(vLinPorcenDto4)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinPorcenDto4 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinPorcenDto4, 3);
                            Evaluate(LINEA.PorcenDto4, vLinPorcenDto4);
                        end;
                    end;
                }
                textelement(vLinImpDto4)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpDto4 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpDto4, 3);
                            Evaluate(LINEA.ImporteDto4, vLinImpDto4);
                        end;
                    end;
                }
                fieldelement(vTipoImp1; LINEA.TipoImp1)
                {
                    Width = 3;
                }
                textelement(vLinTasaImp1)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinTasaImp1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinTasaImp1, 3);
                            Evaluate(LINEA.TasaImp1, vLinTasaImp1);
                        end;
                    end;
                }
                textelement(vLinImpImp1)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpImp1 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpImp1, 3);
                            Evaluate(LINEA.ImpImp1, vLinImpImp1);
                        end;
                    end;
                }
                fieldelement(vTipoImp2; LINEA.TipoImp2)
                {
                    Width = 3;
                }
                textelement(vLinTasaImp2)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinTasaImp2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinTasaImp2, 3);
                            Evaluate(LINEA.TasaImp2, vLinTasaImp2);
                        end;
                    end;
                }
                textelement(vLinImpImp2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpImp2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpImp2, 3);
                            Evaluate(LINEA.ImpImp2, vLinImpImp2);
                        end;
                    end;
                }
                fieldelement(vTipoImp3; LINEA.TipoImp3)
                {
                    Width = 3;
                }
                textelement(vLinTasaImp3)
                {
                    Width = 8;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinTasaImp3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinTasaImp3, 3);
                            Evaluate(LINEA.TasaImp3, vLinTasaImp3);
                        end;
                    end;
                }
                textelement(vLinImpImp3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinImpImp3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinImpImp3, 3);
                            Evaluate(LINEA.ImpImp3, vLinImpImp3);
                        end;
                    end;
                }

                textelement(vLinNUCUE)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vLinNUCUE <> '' then begin
                            ImportEDIOrder.ImportarNumero(vLinNUCUE, 3);
                            Evaluate(LINEA.NUCUE, vLinNUCUE);
                        end;
                    end;
                }                

                fieldelement(vFormato; LINEA.FORMATO)
                {
                    Width = 3;
                }
                textelement(vNuExp)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vNuExp <> '' then begin
                            ImportEDIOrder.ImportarNumero(vNuExp, 3);
                            Evaluate(LINEA.NUEXP, vNuExp);
                        end;
                    end;
                }
                textelement(vPNCaja)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPNCaja <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPNCaja, 3);
                            Evaluate(LINEA.PNCAJA, vPNCaja);
                        end;
                    end;
                }
                fieldelement(vMonedaPrecio; LINEA.MONEDAPRECIO)
                {
                    Width = 3;
                }
                fieldelement(vMarca; LINEA.MARCA)
                {
                    Width = 35;
                }
                fieldelement(vColor; LINEA.COLOR)
                {
                    Width = 35;
                }
                fieldelement(vTamaño; LINEA."TAMAÑO")
                {
                    Width = 35;
                }
                fieldelement(vPresentacion; LINEA.PRESENTACION)
                {
                    Width = 35;
                }
                textelement(vUnidCom)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vUnidCom <> '' then begin
                            ImportEDIOrder.ImportarNumero(vUnidCom, 3);
                            Evaluate(LINEA.UNIDCOM, vUnidCom);
                        end;
                    end;
                }
                textelement(vPum)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPum <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPum, 3);
                            Evaluate(LINEA.PUM, vPum);
                        end;
                    end;
                }
                fieldelement(vFormato2; LINEA.FORMATO2)
                {
                    Width = 3;
                }
                textelement(vNuExp2)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vNuExp2 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vNuExp2, 3);
                            Evaluate(LINEA.NUEXP2, vNuExp2);
                        end;
                    end;
                }
                fieldelement(vFormato3; LINEA.FORMATO3)
                {
                    Width = 3;
                }
                textelement(vNuExp3)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vNuExp3 <> '' then begin
                            ImportEDIOrder.ImportarNumero(vNuExp3, 3);
                            Evaluate(LINEA.NUEXP3, vNuExp3);
                        end;
                    end;
                }
                textelement(vCantSub)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCantSub <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCantSub, 3);
                            Evaluate(LINEA.CANTSUB, vCantSub);
                        end;
                    end;
                }
                textelement(vFechaCad)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaCad <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaCad);
                            Evaluate(LINEA.FechaCad, vFechaCad);
                        end;
                    end;
                }
                textelement(vCajaxCap)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCajaxCap <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCajaxCap, 3);
                            Evaluate(LINEA.CAJASXCAP, vCajaxCap);
                        end;
                    end;
                }
                textelement(vCapaxPal)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCapaxPal <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCapaxPal, 3);
                            Evaluate(LINEA.CAPAXPAL, vCapaxPal);
                        end;
                    end;
                }
                fieldelement(vAutor; LINEA.AUTOR)
                {
                    Width = 35;
                }
                fieldelement(vTitulo; LINEA.TITULO)
                {
                    Width = 35;
                }
                textelement(vFechaErp)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaErp <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaErp);
                            Evaluate(LINEA.FechaEPR, vFechaErp);
                        end;
                    end;
                }
                textelement(vFechaLinTop)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaLinTop <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaLinTop);
                            Evaluate(LINEA.FechaTOP, vFechaLinTop);
                        end;
                    end;
                }
                fieldelement(vtalla; LINEA.TALLA)
                {
                    Width = 35;
                }
                textelement(vPBCaja)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPBCaja <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPBCaja, 3);
                            Evaluate(LINEA.PBCAJA, vPBCaja);
                        end;
                    end;
                }
                fieldelement(vClienteFIn; LINEA.CLIENTEFIN)
                {
                    Width = 17;
                }
                fieldelement(vDomicilioClf; LINEA.DOMICILIOCLF)
                {
                    Width = 70;
                }
                fieldelement(vCiudadClf; LINEA.CIUDADCLF)
                {
                    Width = 35;
                }
                fieldelement(vCpClf; LINEA.CPCLF)
                {
                    Width = 9;
                }

                fieldelement(vContactInfoCLF; LINEA.CONTACTINFOCLF)
                {
                    Width = 70;
                }
                fieldelement(vContactPedCLF; LINEA.CONTACTPEDCLF)
                {
                    Width = 70;
                }
                fieldelement(vContactCompCLF; LINEA.CONTACTCOMPCLF)
                {
                    Width = 70;
                }
                fieldelement(vGrupoProdIn; LINEA.GRUPOPRODIN)
                {
                    Width = 3;
                }
                fieldelement(vIdentiFPProd; LINEA.IDENTIFPROD)
                {
                    Width = 3;
                }
                fieldelement(vInfoEtiq1; LINEA.INFOETIQ1)
                {
                    Width = 35;
                }
                fieldelement(vInfoEtiq2; LINEA.INFOETIQ2)
                {
                    Width = 35;
                }
                fieldelement(vInfoEtiq3; LINEA.INFOETIQ3)
                {
                    Width = 35;
                }
                fieldelement(vModelo; LINEA.MODELO)
                {
                    Width = 35;
                }
                fieldelement(vSerie; LINEA.SERIE)
                {
                    Width = 35;
                }
                textelement(vPrecioI)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vPrecioI <> '' then begin
                            ImportEDIOrder.ImportarNumero(vPrecioI, 3);
                            Evaluate(LINEA.PrecioI, vPrecioI);
                        end;
                    end;
                }
                fieldelement(vNumPedCom; LINEA.NUMPEDCOM)
                {
                    Width = 15;
                }
                textelement(vFechNumPedCom)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechNumPedCom <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechNumPedCom);
                            Evaluate(LINEA.FECNUMPEDCOM, vFechNumPedCom);
                        end;
                    end;
                }
                fieldelement(vNumCliFin; LINEA.NUMCLIFIN)
                {
                    Width = 15;
                }
                textelement(vFechNumCliFin)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechNumCliFin <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechNumCliFin);
                            Evaluate(LINEA.FECNUMCLIFIN, vFechNumCliFin);
                        end;
                    end;
                }
                fieldelement(vDescCod; LINEA.DESCOD)
                {
                    Width = 17;
                }
                fieldelement(vCodISBM; LINEA.CODISBN)
                {
                    Width = 35;
                }
                fieldelement(vUMCANTUE; LINEA.UMCANTUE)
                {
                    Width = 3;
                }
                fieldelement(vUMPBCaja; LINEA.UMPBCAJA)
                {
                    Width = 3;
                }
                fieldelement(vUMPNCaja; LINEA.UMPNCAJA)
                {
                    Width = 3;
                }
                fieldelement(vUPrecioN; LINEA.UPRECION)
                {
                    Width = 3;
                }
                fieldelement(vUPrecioB; LINEA.UPRECIOB)
                {
                    Width = 3;
                }
                fieldelement(vTipeMB; LINEA.TIPEMB)
                {
                    Width = 35;
                }
                fieldelement(vVolumen; LINEA.VOLUMEN)
                {
                    Width = 15;
                }
                fieldelement(vVolumumm; LINEA.VOLUMUM)
                {
                    Width = 15;
                }
                textelement(vFechaEnv)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechaEnv <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechaEnv);
                            Evaluate(LINEA.FECHAENV, vFechaEnv);
                        end;
                    end;
                }
                fieldelement(vIdentAdu; LINEA.IDENTADU)
                {
                    Width = 15;
                }

            }
            tableelement(OBSERL; ABPEDIEDISalesComment) //2.4 Observaciones sobre las líneas del pedido
            {
                XmlName = 'OBSERL';
                UseTemporary = true;

                fieldelement(vEtiqueta; OBSERL.EDILabel)
                {
                    Width = 8;
                    trigger OnAfterAssignField()
                    begin
                        if OBSERL.EDILabel <> 'OBSERL' then
                            currXMLport.Break();
                    end;
                }
                fieldelement(vClave1; OBSERL.EDIKey1)
                {
                    Width = 8;
                }
                fieldelement(vClave2; OBSERL.EDIKey2)
                {
                    Width = 5;
                }
                fieldelement(vClave3; OBSERL.EDIKey3)
                {
                    Width = 5;
                }
                fieldelement(vTema; OBSERL.Tema)
                {
                    Width = 3;
                }
                fieldelement(vText01; OBSERL.Texto1)
                {
                    Width = 70;
                }
                fieldelement(vText02; OBSERL.Texto2)
                {
                    Width = 70;
                }
                fieldelement(vText03; OBSERL.Texto3)
                {
                    Width = 70;
                }
                fieldelement(vText04; OBSERL.Texto4)
                {
                    Width = 70;
                }
                fieldelement(vText05; OBSERL.Texto5)
                {
                    Width = 70;
                }
            }
            tableelement(LOC; ABPEDIEDIBreakdownSalesLine) //2.5 Desglose sobre las líneas del pedido
            {
                XmlName = 'LOC';
                UseTemporary = true;

                fieldelement(vEtiqueta; LOC.EDILabel)
                {
                    Width = 8;
                    trigger OnAfterAssignField()
                    begin
                        if LOC.EDILabel <> 'LOC' then
                            currXMLport.Break();
                    end;
                }
                fieldelement(vClave1; LOC.EDIKey1)
                {
                    Width = 8;
                }
                fieldelement(vClave2; LOC.EDIKey2)
                {
                    Width = 5;
                }
                fieldelement(vClave3; LOC.EDIKey3)
                {
                    Width = 5;
                }                
                fieldelement(vLugar; LOC.LUGAR)
                {
                    Width = 17;
                }
                textelement(vCantidad)
                {
                    Width = 15;

                    trigger OnAfterAssignVariable()
                    begin
                        if vCantidad <> '' then begin
                            ImportEDIOrder.ImportarNumero(vCantidad, 3);
                            Evaluate(LOC.CANTIDAD, vCantidad);
                        end;
                    end;
                }
                textelement(vFechEntr)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechEntr <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechEntr);
                            Evaluate(LOC.FECHENTR, vFechEntr);
                        end;
                    end;
                }
                textelement(vFechUlt)
                {
                    Width = 12;

                    trigger OnAfterAssignVariable()
                    begin
                        if vFechUlt <> '' then begin
                            ImportEDIOrder.ImportarFecha(vFechUlt);
                            Evaluate(LOC.FechUlt, vFechUlt);
                        end;
                    end;
                }
                fieldelement(vNombre; LOC.NOMBRE)
                {
                    Width = 70;
                }
                fieldelement(vLugarRel; LOC.LUGARREL)
                {
                    Width = 25;
                }

            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        //CABECERA Y PIE DE PEDIDO
        CABECERA.Reset;
        if CABECERA.FindSet(false, false) then
            repeat
                rCABECERA.Reset;
                rCABECERA.Init;
                rCABECERA.Validate(EDILabel, CABECERA.EDILabel);
                rCABECERA.Validate(EDIKey1, DelChr(CABECERA.EDIKey1));
                rCABECERA.Validate(Nodo, DelChr(CABECERA.Nodo));
                rCABECERA.Validate(Funcion, CABECERA.Funcion);
                rCABECERA.Validate(NumPed, DelChr(CABECERA.NumPed));
                rCABECERA.Validate(Date, "CABECERA".Date);
                rCABECERA.Validate(FechaEPR, "CABECERA".FechaEPR);
                rCABECERA.Validate(FechaERE, "CABECERA".FechaERE);
                rCABECERA.Validate(FechaTop, "CABECERA".FechaTop);
                rCABECERA.Validate(FormaPag, "CABECERA".FormaPag);
                rCABECERA.Validate(CondESP, "CABECERA".CondESP);
                rCABECERA.Validate(PedAbier, "CABECERA".PedAbier);
                rCABECERA.Validate(LPrecios, "CABECERA".LPrecios);
                rCABECERA.Validate(NContrat, "CABECERA".NContrat);
                rCABECERA.Validate(FContrat, "CABECERA".FContrat);
                rCABECERA.Validate(Emisor, DelChr("CABECERA".Emisor));
                rCABECERA.Validate(COMPRADOR, DelChr("CABECERA".COMPRADOR));
                rCABECERA.Validate(CLIENTE, DelChr("CABECERA".CLIENTE));
                rCABECERA.Validate(Depto, "CABECERA".Depto);
                rCABECERA.Validate(Receptor, DelChr("CABECERA".Receptor));
                rCABECERA.Validate(Muelle, "CABECERA".Muelle);
                rCABECERA.Validate(Vendedor, "CABECERA".Vendedor);
                rCABECERA.Validate(EDIQPAGA, DelChr("CABECERA".EDIQPAGA));
                rCABECERA.Validate(Portes, "CABECERA".Portes);
                rCABECERA.Validate(Recogida, "CABECERA".Recogida);
                rCABECERA.Validate(Reposi, "CABECERA".Reposi);
                rCABECERA.Validate(Entrega, "CABECERA".Entrega);
                rCABECERA.Validate(Moneda, "CABECERA".Moneda);
                rCABECERA.Validate(CALIF1, DelChr("CABECERA".Calif1));
                rCABECERA.Validate(SECUEN1, "CABECERA".Secuen1);
                rCABECERA.Validate(TIPODTO1, "CABECERA".TipoDto1);
                rCABECERA.Validate(PorcenDto1, "CABECERA".PorcenDto1);
                rCABECERA.Validate(ImporteDto1, "CABECERA".ImporteDto1);
                rCABECERA.Validate(CALIF2, "CABECERA".Calif2);
                rCABECERA.Validate(SECUEN2, "CABECERA".Secuen2);
                rCABECERA.Validate(TIPODTO2, "CABECERA".TipoDto2);
                rCABECERA.Validate(PorcenDto2, "CABECERA".PorcenDto2);
                rCABECERA.Validate(ImporteDto2, "CABECERA".ImporteDto2);
                rCABECERA.Validate(CALIF3, "CABECERA".Calif3);
                rCABECERA.Validate(SECUEN3, "CABECERA".Secuen3);
                rCABECERA.Validate(TIPODTO3, "CABECERA".TipoDto3);
                rCABECERA.Validate(PorcenDto3, "CABECERA".PorcenDto3);
                rCABECERA.Validate(ImporteDto3, "CABECERA".ImporteDto3);
                rCABECERA.Validate(CALIF4, "CABECERA".Calif4);
                rCABECERA.Validate(SECUEN4, "CABECERA".Secuen4);
                rCABECERA.Validate(TIPODTO4, "CABECERA".TipoDto4);
                rCABECERA.Validate(PorcenDto4, "CABECERA".PorcenDto4);
                rCABECERA.Validate(ImporteDto4, "CABECERA".ImporteDto4);
                rCABECERA.Validate(CALIF5, "CABECERA".Calif5);
                rCABECERA.Validate(SECUEN5, "CABECERA".Secuen5);
                rCABECERA.Validate(TIPODTO5, "CABECERA".TipoDto5);
                rCABECERA.Validate(PorcenDto5, "CABECERA".PorcenDto5);
                rCABECERA.Validate(ImporteDto5, "CABECERA".ImporteDto5);
                rCABECERA.Validate(TipoImp1, "CABECERA".TipoImp1);
                rCABECERA.Validate(TasaImp1, "CABECERA".TasaImp1);
                rCABECERA.Validate(BaseImp1, "CABECERA".BaseImp1);
                rCABECERA.Validate(ImpImp1, "CABECERA".ImpImp1);
                rCABECERA.Validate(TipoImp2, "CABECERA".TipoImp2);
                rCABECERA.Validate(TasaImp2, "CABECERA".TasaImp2);
                rCABECERA.Validate(BaseImp2, "CABECERA".BaseImp2);
                rCABECERA.Validate(ImpImp2, "CABECERA".ImpImp2);
                rCABECERA.Validate(TipoImp3, "CABECERA".TipoImp3);
                rCABECERA.Validate(TasaImp3, "CABECERA".TasaImp3);
                rCABECERA.Validate(BaseImp3, "CABECERA".BaseImp3);
                rCABECERA.Validate(ImpImp3, "CABECERA".ImpImp3);
                rCABECERA.Validate(PATREF, "CABECERA".PATREF);
                rCABECERA.Validate(PATDIAS, "CABECERA".PATDIAS);
                rCABECERA.Validate(PATMESES, "CABECERA".PATMESES);
                rCABECERA.Validate(FECHAV, "CABECERA".FECHAV);
                rCABECERA.Validate(VTO1, "CABECERA".VTO1);
                rCABECERA.Validate(IMPVTO1, "CABECERA".IMPVTO1);
                rCABECERA.Validate(VTO2, "CABECERA".VTO2);
                rCABECERA.Validate(IMPVTO2, "CABECERA".IMPVTO2);
                rCABECERA.Validate(VTO3, "CABECERA".VTO3);
                rCABECERA.Validate(IMPVTO3, "CABECERA".IMPVTO3);
                rCABECERA.Validate(tbruto, "CABECERA".TBruto);
                rCABECERA.Validate(tneto, "CABECERA".tneto);
                rCABECERA.Validate(tcardes, "CABECERA".TCARDES);
                rCABECERA.Validate(baseimp, "CABECERA".BaseImp);
                rCABECERA.Validate(totimpue, "CABECERA".TotImpue);
                rCABECERA.Validate(TotalPagar, "CABECERA".TotalPagar);
                rCABECERA.Validate(frecogid, "CABECERA".FRECOGID);
                rCABECERA.Validate(transpor, "CABECERA".TRANSPOR);
                rCABECERA.Validate(almrecogid, "CABECERA".ALMRECOGID);
                rCABECERA.Validate(FREFPAG, "CABECERA".FREFPAG);
                rCABECERA.Validate(totcant, "CABECERA".TOTCANT);
                rCABECERA.Validate(TEMPORADA, "CABECERA".TEMPORADA);
                rCABECERA.Validate(DEPTOVENTA, "CABECERA".DEPTOVENTA);
                rCABECERA.Validate(SUCURSAL, "CABECERA".SUCURSAL);
                rCABECERA.Validate(DESTMSG, "CABECERA".DESTMSG);
                rCABECERA.Validate(CONDPAGO, "CABECERA".CONDPAGO);
                rCABECERA.Validate(TRANSPORT, "CABECERA".TRANSPORT);
                rCABECERA.Validate(LUGADIENT, "CABECERA".LUGADIENT);
                rCABECERA.Validate(CODPROD, "CABECERA".CODPROD);
                rCABECERA.Validate(DESTFINAL, "CABECERA".DESTFINAL);
                rCABECERA.Validate(NOMDESTFIN, "CABECERA".NOMDESTFIN);
                rCABECERA.Validate(DIRDESTFIN, "CABECERA".DIRDESTFIN);
                rCABECERA.Validate(POBDESTFIN, "CABECERA".POBDESTFIN);
                rCABECERA.Validate(PROVDESTFIN, "CABECERA".PROVDESTFIN);
                rCABECERA.Validate(CPDESTFIN, "CABECERA".CPDESTFIN);
                rCABECERA.Validate(TELFDESTFIN, "CABECERA".TELFDESTFIN);
                rCABECERA.Validate(TELFDESTFIN2, "CABECERA".TELFDESTFIN2);
                rCABECERA.Validate(NUMTALON, "CABECERA".NUMTALON);
                rCABECERA.Validate(NUMRESERVA, "CABECERA".NUMRESERVA);
                rCABECERA.Validate(PESBRUTOT, "CABECERA".PESBRUTOT);
                rCABECERA.Validate(NUMTOBUL, "CABECERA".NUMTOBUL);
                rCABECERA.Validate(CONDESP2, "CABECERA".CONDESP2);
                rCABECERA.Validate(CONDESP3, "CABECERA".CONDESP3);
                rCABECERA.Validate(CONDESP4, "CABECERA".CONDESP4);
                rCABECERA.Validate(CONDESP5, "CABECERA".CONDESP5);
                rCABECERA.Validate(NOMCONREC, "CABECERA".NOMCONREC);
                rCABECERA.Validate(TIPOCTA, "CABECERA".TIPOCTA);
                rCABECERA.Validate(NUMPROMO, "CABECERA".NUMPROMO);
                rCABECERA.Validate(CODRES, "CABECERA".CODRES);
                rCABECERA.Validate(NREFCLIENTE, "CABECERA".NREFCLIENTE);
                rCABECERA.Validate(FNREFCLIENTE, "CABECERA".FNREFCLIENTE);
                rCABECERA.Validate(NPROYECTO, "CABECERA".NPROYECTO);
                rCABECERA.Validate(FNPROYECTO, "CABECERA".FNPROYECTO);
                rCABECERA.Validate(MANUFACTURADOR, "CABECERA".MANUFACTURADOR);
                rCABECERA.Validate(ORDENADOR, "CABECERA".ORDENADOR);
                rCABECERA.Validate(UCONSIGNADOR, "CABECERA".UCONSIGNADOR);
                rCABECERA.Validate(DIRUCONSIG, "CABECERA".DIRUCONSIG);
                rCABECERA.Validate(POBUCONSIG, "CABECERA".POBUCONSIG);
                rCABECERA.Validate(PROVUCONSIG, "CABECERA".PROVUCONSIG);
                rCABECERA.Validate(CPUCONSIG, "CABECERA".CPUCONSIG);
                rCABECERA.Validate(EANZZZ, "CABECERA".EANZZZ);
                rCABECERA.Validate(CONTINFOCOMP, DelChr("CABECERA".CONTINFOCOMP));
                rCABECERA.Validate(CONTPEDCOM, "CABECERA".CONTPEDCOM);
                rCABECERA.Validate(IMPVENDISC, "CABECERA".IMPVENDISC);
                rCABECERA.Validate(TRANSPORTCODESC, "CABECERA".TRANSPORTCODESC);
                rCABECERA.Validate(TRANSPORTDESC, "CABECERA".TRANSPORTDESC);
                rCABECERA.Validate(CONDENTREGA, "CABECERA".CONDENTREGA);
                rCABECERA.Validate(TELEFCOMP, "CABECERA".TELEFCOMP);
                rCABECERA.Validate(RECEPTORPAIS, "CABECERA".RECEPTORPAIS);
                rCABECERA.Validate(RECEPTORCONTCOD, "CABECERA".RECEPTORCONTCOD);
                rCABECERA.Validate(NUMPEDTIENDA, "CABECERA".NUMPEDTIENDA);
                rCABECERA.Validate(DESCPAGO, "CABECERA".DESCPAGO);
                rCABECERA.Validate(NUMPEDPROV, "CABECERA".NUMPEDPROV);
                rCABECERA.Validate(NUMALB, "CABECERA".NUMALB);
                rCABECERA.Insert(true);
            until CABECERA.Next = 0;

        //OBSERVACIONES PEDIDO
        OBSER.Reset;
        if OBSER.FindSet(false, false) then
            repeat
                rOBSER.Reset;
                rOBSER.Init;               
                rOBSER.Validate(EDILabel, OBSER.EDILabel);
                rOBSER.Validate(EDIKey1, OBSER.EDIKey1);
                rOBSER.Validate(EDIKey2, OBSER.EDIKey2);
                rOBSER.Validate(Tema, OBSER.Tema);
                rOBSER.Validate(Texto1, OBSER.Texto1);
                rOBSER.Validate(Texto2, OBSER.Texto2);
                rOBSER.Validate(Texto3, OBSER.Texto3);
                rOBSER.Validate(Texto4, OBSER.Texto4);
                rOBSER.Validate(Texto5, OBSER.Texto5);
                rOBSER.Insert(true);
            until OBSER.Next = 0;

        //LINEA PEDIDO
        LINEA.Reset;
        if LINEA.FindSet(false, false) then
            repeat
                rLINEA.Reset;
                rLINEA.Init;               
                rLINEA.Validate(EDILabel, DelChr(LINEA.EDILabel));
                rLINEA.Validate(EDIKey1, DelChr(LINEA.EDIKey1));
                rLINEA.Validate(EDIKey2, DelChr(LINEA.EDIKey2));
                rLINEA.Validate(RefEAN, DelChr(LINEA.RefEAN));
                rLINEA.Validate(DUN14, LINEA.DUN14);
                rLINEA.Validate(VP, LINEA.VP);
                rLINEA.Validate(RefCli, DelChr(LINEA.RefCli));
                rLINEA.Validate(RefProv, DelChr(LINEA.RefProv));
                rLINEA.Validate(REFETIQ, LINEA.REFETIQ);
                rLINEA.Validate(DescMer, LINEA.DescMer);
                rLINEA.Validate(DescMer2, LINEA.DescMer2);
                rLINEA.Validate(DESCCONS, LINEA.DESCCONS);
                rLINEA.Validate(CantPed, LINEA.CantPed);
                rLINEA.Validate(UMedida, LINEA.UMedida);
                rLINEA.Validate(CantGrat, LINEA.CantGrat);
                rLINEA.Validate(CantUE, LINEA.CantUE);
                rLINEA.Validate(CantBoni, LINEA.CantBoni);
                rLINEA.Validate(FechaE, LINEA.FechaE);
                rLINEA.Validate(PrecioN, LINEA.PrecioN);
                rLINEA.Validate(PrecioB, LINEA.PrecioB);
                rLINEA.Validate(PVP, LINEA.PVP);
                rLINEA.Validate(NETO, LINEA.Neto);
                rLINEA.Validate(Calif1, LINEA.Calif1);
                rLINEA.Validate(Secuen1, LINEA.Secuen1);
                rLINEA.Validate(TIPODTO1, LINEA.TipoDto1);
                rLINEA.Validate(PorcenDto1, LINEA.PorcenDto1);
                RLINEA.Validate(ImporteDto1, LINEA.ImporteDto1);
                rLINEA.Validate(Calif2, LINEA.Calif2);
                rLINEA.Validate(Secuen2, LINEA.Secuen2);
                rLINEA.Validate(TIPODTO2, LINEA.TipoDto2);
                rLINEA.Validate(PorcenDto2, LINEA.PorcenDto2);
                RLINEA.Validate(ImporteDto2, LINEA.ImporteDto2);
                rLINEA.Validate(Calif3, LINEA.Calif3);
                rLINEA.Validate(Secuen3, LINEA.Secuen3);
                rLINEA.Validate(TIPODTO3, LINEA.TipoDto3);
                rLINEA.Validate(PorcenDto3, LINEA.PorcenDto3);
                RLINEA.Validate(ImporteDto3, LINEA.ImporteDto3);
                rLINEA.Validate(Calif4, LINEA.Calif4);
                rLINEA.Validate(Secuen4, LINEA.Secuen4);
                rLINEA.Validate(TIPODTO4, LINEA.TipoDto4);
                rLINEA.Validate(PorcenDto4, LINEA.PorcenDto4);
                rLINEA.Validate(ImporteDto4, LINEA.ImporteDto4);
                rLINEA.Validate(TipoImp1, LINEA.TipoImp1);
                rLINEA.Validate(TasaImp1, LINEA.TasaImp1);
                rLINEA.Validate(ImpImp1, LINEA.ImpImp1);
                rLINEA.Validate(TipoImp2, LINEA.TipoImp2);
                rLINEA.Validate(TasaImp2, LINEA.TasaImp2);
                rLINEA.Validate(ImpImp2, LINEA.ImpImp2);
                rLINEA.Validate(TipoImp3, LINEA.TipoImp3);
                rLINEA.Validate(TasaImp3, LINEA.TasaImp3);
                rLINEA.Validate(ImpImp3, LINEA.ImpImp3);
                rLINEA.Validate(NUCUE, LINEA.NUCUE);
                rLINEA.Validate(FORMATO, LINEA.FORMATO);
                rLINEA.Validate(NUEXP, LINEA.NUEXP);
                rLINEA.Validate(PNCAJA, LINEA.PNCAJA);
                rLINEA.Validate(MONEDAPRECIO, LINEA.MONEDAPRECIO);
                rLINEA.Validate(MARCA, LINEA.MARCA);
                rLINEA.Validate(COLOR, LINEA.COLOR);
                rLINEA.Validate("TAMAÑO", LINEA."TAMAÑO");
                rLINEA.Validate(PRESENTACION, LINEA.PRESENTACION);
                rLINEA.Validate(UNIDCOM, LINEA.UNIDCOM);
                rLINEA.Validate(PUM, LINEA.PUM);
                rLINEA.Validate(FORMATO2, LINEA.FORMATO2);
                rLINEA.Validate(NUEXP2, LINEA.NUEXP2);
                rLINEA.Validate(FORMATO3, LINEA.FORMATO3);
                rLINEA.Validate(NUEXP3, LINEA.NUEXP3);
                rLINEA.Validate(CANTSUB, LINEA.CANTSUB);
                rLINEA.Validate(FechaCad, LINEA.FechaCad);
                rLINEA.Validate(CAJASXCAP, linea.CAJASXCAP);
                rLINEA.Validate(CAPAXPAL, linea.CAPAXPAL);
                rLINEA.Validate(AUTOR, linea.AUTOR);
                rLINEA.Validate(TITULO, linea.TITULO);
                rLINEA.Validate(FECHAEPR, linea.FechaEPR);
                rLINEA.Validate(FECHATOP, linea.FECHATOP);
                rLINEA.Validate(TALLA, linea.TALLA);
                rLINEA.Validate(PBCAJA, linea.PBCAJA);
                rLINEA.Validate(CLIENTEFIN, linea.CLIENTEFIN);
                rLINEA.Validate(DOMICILIOCLF, linea.DOMICILIOCLF);
                rLINEA.Validate(CIUDADCLF, linea.CIUDADCLF);
                rLINEA.Validate(CPCLF, linea.CIUDADCLF);
                rLINEA.Validate(CONTACTINFOCLF, linea.CONTACTINFOCLF);
                rLINEA.Validate(CONTACTPEDCLF, linea.CONTACTPEDCLF);
                rLINEA.Validate(CONTACTCOMPCLF, linea.CONTACTCOMPCLF);
                rLINEA.Validate(GRUPOPRODIN, linea.GRUPOPRODIN);
                rLINEA.Validate(IDENTIFPROD, linea.IDENTIFPROD);
                rLINEA.Validate(INFOETIQ1, linea.INFOETIQ1);
                rLINEA.Validate(INFOETIQ2, linea.INFOETIQ2);
                rLINEA.Validate(INFOETIQ3, linea.INFOETIQ3);
                rLINEA.Validate(MODELO, linea.MODELO);
                rLINEA.Validate(SERIE, linea.SERIE);
                rLINEA.Validate(PRECIOI, linea.PRECIOI);
                rLINEA.Validate(NUMPEDCOM, linea.NUMPEDCOM);
                rLINEA.Validate(FECNUMPEDCOM, linea.FECNUMPEDCOM);
                rLINEA.Validate(NUMCLIFIN, linea.NUMCLIFIN);
                rLINEA.Validate(FECNUMCLIFIN, linea.FECNUMCLIFIN);
                rLINEA.Validate(DESCOD, linea.DESCOD);
                rLINEA.Validate(CODISBN, linea.CODISBN);
                rLINEA.Validate(UMCANTUE, linea.UMCANTUE);
                rLINEA.Validate(UMPBCAJA, linea.UMPBCAJA);
                rLINEA.Validate(UMPNCAJA, linea.UMPNCAJA);
                rLINEA.Validate(UPRECION, linea.UPRECION);
                rLINEA.Validate(UPRECIOB, linea.UPRECIOB);
                rLINEA.Validate(TIPEMB, linea.TIPEMB);
                rLINEA.Validate(VOLUMEN, linea.VOLUMEN);
                rLINEA.Validate(VOLUMUM, linea.VOLUMUM);
                rLINEA.Validate(IDENTADU, linea.IDENTADU);
                rLINEA.Insert(true);
            until LINEA.Next = 0;

        //OBSERVACIONES DE LINEAS DEL PEDIDO
        OBSERL.Reset;
        if OBSERL.FindSet(false, false) then
            repeat
                rOBSERL.Reset;
                rOBSERL.Init;
                rOBSERL.Validate(EDILabel, OBSERL.EDILabel);
                rOBSERL.Validate(EDIKey1, OBSERL.EDIKey1);
                rOBSERL.Validate(EDIKey2, OBSERL.EDIKey2);
                rOBSERL.Validate(EDIKey3, OBSERL.EDIKey3);
                rOBSERL.Validate(Tema, OBSERL.Tema);
                rOBSERL.Validate(Texto1, OBSERL.Texto1);
                rOBSERL.Validate(Texto2, OBSERL.Texto2);
                rOBSERL.Validate(Texto3, OBSERL.Texto3);
                rOBSERL.Validate(Texto4, OBSERL.Texto4);
                rOBSERL.Validate(Texto5, OBSERL.Texto5);
                rOBSERL.Insert(true);
            until OBSERL.Next = 0;

        //DESGLOSE SOBRE LAS LINEAS DEL PEDIDO
        LOC.Reset;
        if LOC.FindSet(false, false) then
            repeat
                rLOC.Reset;
                rLOC.Init;                
                rLOC.Validate(EDILabel, LOC.EDILabel);
                rLOC.Validate(EDIKey1, LOC.EDIKey1);
                rLOC.Validate(EDIKey2, LOC.EDIKey2);
                rLOC.Validate(EDIKey3, LOC.EDIKey3);
                rLOC.Validate(LUGAR, LOC.LUGAR);
                rLOC.Validate(CANTIDAD, LOC.CANTIDAD);
                rLOC.Validate(FECHENTR, LOC.FECHENTR);
                rLOC.Validate(FECHULT, LOC.FECHULT);
                rLOC.Validate(NOMBRE, LOC.NOMBRE);
                rLOC.Validate(LUGARREL, LOC.LUGARREL);
                rLOC.Insert(true);
            until LOC.Next = 0;
    end;

    var
        rCABECERA: Record ABPEDIEDISalesHeader;
        rOBSER: Record ABPEDIEDISalesComment;
        rLINEA: Record ABPEDIEDISalesLine;
        rOBSERL: Record ABPEDIEDISalesComment;
        rLOC: Record ABPEDIEDIBreakdownSalesLine;
        CommonFunctions: Codeunit ABPEDIEDICommonsFunctions;
        ImportEDIOrder: Codeunit ABPEDIImportEDIOrder;
        currentLine: Text;
        currentKey: Text;
}