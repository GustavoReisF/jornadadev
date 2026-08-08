	#include "protheus.ch"
	
	/*/{Protheus.doc} STTZZ1
	Cadastro de Controle de Fornecimento
	
	@author Gustavo Reis
	@since 2026
	@version 1.0
	/*/
	
	User Function STTZZ1()
	
	    Local aIndexZZ1 := {}
	    Local cFiltro   := ""    
	    
	    Local aColors := { ;
    			{"ZZ1->ZZ1_VALCER < dDataBase", "BR_VERMELHO"}, ;
			  	{"ZZ1->ZZ1_VALCER <= dDataBase + 30", "BR_AMARELO"}, ;
			   {".T.", "BR_VERDE"} ;
			}
	
	    Private aRotina := { ;
	        {"Pesquisar","AxPesqui",0,1},;
	        {"Visualizar","AxVisual",0,2},;
	        {"Incluir","U_STTZZ1INC",0,3},;
	        {"Alterar","U_STTZZ1ALT",0,4},;
	        {"Excluir","U_STTZZ1DEL",0,5},;
	        {"Ocorrências","U_STTZZ2(ZZ1->ZZ1_CODIGO)",0,6} }
	
	    dbSelectArea("ZZ1")
	    dbSetOrder(1)
	
	    FilBrowse("ZZ1", @aIndexZZ1, @cFiltro)
	
	    mBrowse(1,1,22,75,"ZZ1",,,,,,aColors)
	
	    EndFilBrw("ZZ1", aIndexZZ1)
	
	Return
	
	User Function STTZZ1INC()
	
	    Local oDlg
	    Local cFornec := Space(6)
	    Local cLoja   := "01"
	    Local cCertif := Space(80)
	    Local dValCer := dDataBase
	    Local nTolera := 0
	
	    DEFINE MSDIALOG oDlg TITLE "Novo Controle de Fornecimento" ;
	        FROM 000,000 TO 180,350 PIXEL
	
	    @ 10,10 SAY "Fornecedor:" SIZE 45,10 PIXEL OF oDlg
	    @ 10,60 MSGET cFornec SIZE 40,10 PIXEL OF oDlg
	
	    @ 25,10 SAY "Loja:" SIZE 45,10 PIXEL OF oDlg
	    @ 25,60 MSGET cLoja SIZE 20,10 PIXEL OF oDlg
	
	    @ 40,10 SAY "Certificado:" SIZE 45,10 PIXEL OF oDlg
	    @ 40,60 MSGET cCertif SIZE 180,10 PIXEL OF oDlg
	
	    @ 55,10 SAY "Validade:" SIZE 45,10 PIXEL OF oDlg
	    @ 55,60 MSGET dValCer SIZE 50,10 PIXEL OF oDlg
	
	    @ 70,10 SAY "Tolerância:" SIZE 45,10 PIXEL OF oDlg
	    @ 70,60 MSGET nTolera PICTURE "999.99" SIZE 40,10 PIXEL OF oDlg
	
	    @ 100,60 BUTTON "Salvar" SIZE 40,14 PIXEL OF oDlg ;
	        ACTION ( U_STTZZ1SALVAR(cFornec,cLoja,cCertif,dValCer,nTolera), oDlg:End() )
	
	    @ 100,110 BUTTON "Cancelar" SIZE 40,14 PIXEL OF oDlg ;
	        ACTION oDlg:End()
	
	    ACTIVATE MSDIALOG oDlg CENTERED
	
	Return
	
	User Function STTZZ1SALVAR(cFornec,cLoja,cCertif,dValCer,nTolera)
	
	    Local lOk := .T.
	    Local oErro
	
	    BEGIN SEQUENCE
	
	       	If dValCer < dDataBase
				    MsgStop("Certificado vencido.")
				    Break(dValCer)
				EndIf
				
				If nTolera < 0 .Or. nTolera > 100
				    MsgStop("Tolerância deve estar entre 0 e 100.")
				    Break(nTolera)
				EndIf
				
		      dbSelectArea("SA2") 
		      dbSetOrder(1)
		
				If !dbSeek(xFilial("SA2") + cFornec + cLoja)
				    MsgStop("Fornecedor não cadastrado.")
				    Break(cFornec)
				EndIf
	
	        dbSelectArea("ZZ1")
	
	        RecLock("ZZ1",.T.)
	
	        ZZ1->ZZ1_FILIAL := xFilial("ZZ1")
	        ZZ1->ZZ1_CODIGO := U_ProxCodigoZZ1()
	        ZZ1->ZZ1_FORNEC := cFornec
	        ZZ1->ZZ1_LOJAFO := cLoja
	        ZZ1->ZZ1_CERTIF := cCertif
	        ZZ1->ZZ1_VALCER := dValCer
	        ZZ1->ZZ1_TOLERA := nTolera
	        ZZ1->ZZ1_TOTOK  := 0
	        ZZ1->ZZ1_TOTNOK := 0
	
	        MsUnlock()
	
	        MsgInfo("Registro incluído com sucesso!")
	
	    RECOVER USING oErro
	
	        MsgStop("Erro ao gravar o registro.")
	
	        lOk := .F.
	
	    END SEQUENCE
	
	Return lOk                                                                                      
	
	User Function STTZZ1ALT()
	
	    Local oDlg
	    Local cCertif := ZZ1->ZZ1_CERTIF
	    Local dValCer := ZZ1->ZZ1_VALCER
	    Local nTolera := ZZ1->ZZ1_TOLERA
	
	    DEFINE MSDIALOG oDlg TITLE "Alterar Controle de Fornecimento" ;
	        FROM 000,000 TO 180,350 PIXEL
	
	    @ 10,10 SAY "Fornecedor:" SIZE 45,10 PIXEL OF oDlg
	    @ 10,60 SAY ZZ1->ZZ1_FORNEC SIZE 50,10 PIXEL OF oDlg
	
	    @ 25,10 SAY "Loja:" SIZE 45,10 PIXEL OF oDlg
	    @ 25,60 SAY ZZ1->ZZ1_LOJAFO SIZE 20,10 PIXEL OF oDlg
	
	    @ 40,10 SAY "Certificado:" SIZE 45,10 PIXEL OF oDlg
	    @ 40,60 MSGET cCertif SIZE 180,10 PIXEL OF oDlg
	
	    @ 55,10 SAY "Validade:" SIZE 45,10 PIXEL OF oDlg
	    @ 55,60 MSGET dValCer SIZE 50,10 PIXEL OF oDlg
	
	    @ 70,10 SAY "Tolerância:" SIZE 45,10 PIXEL OF oDlg
	    @ 70,60 MSGET nTolera PICTURE "999.99" SIZE 40,10 PIXEL OF oDlg
	
	    @ 100,60 BUTTON "Salvar" SIZE 40,14 PIXEL OF oDlg ;
	        ACTION ( U_STTZZ1GRAVAALT(cCertif,dValCer,nTolera), oDlg:End() )
	
	    @ 100,110 BUTTON "Cancelar" SIZE 40,14 PIXEL OF oDlg ;
	        ACTION oDlg:End()
	
	    ACTIVATE MSDIALOG oDlg CENTERED
	
	Return
	
	User Function STTZZ1GRAVAALT(cCertif,dValCer,nTolera)
	
	    If dValCer < dDataBase
	        MsgStop("Certificado vencido.")
	        Return .F.
	    EndIf
	
	    If nTolera < 0 .Or. nTolera > 100
	        MsgStop("Tolerância deve estar entre 0 e 100.")
	        Return .F.
	    EndIf
	
	    dbSelectArea("ZZ1")
	
	    RecLock("ZZ1",.F.)
	
	    ZZ1->ZZ1_CERTIF := cCertif
	    ZZ1->ZZ1_VALCER := dValCer
	    ZZ1->ZZ1_TOLERA := nTolera
	
	    MsUnlock()
	
	    MsgInfo("Registro alterado com sucesso!")
	
	Return .T.  
	
	User Function STTZZ1DEL()
	
	    If MsgYesNo("Deseja realmente excluir este registro?")
	
	        dbSelectArea("ZZ1")
	
	        RecLock("ZZ1", .F.)
	
	        dbDelete()
	
	        MsUnlock()
	
	        MsgInfo("Registro excluído com sucesso!")
	
	    EndIf
	
Return