#include "protheus.ch"

/*/{Protheus.doc} STTZZ2
Cadastro de Ocorrências

@author Gustavo Reis
@since 2026
@version 1.0
/*/

User Function STTZZ2(cControle)

    Local aIndexZZ2 := {}
    Local cFiltro   := ""

    Default cControle := ""

    Private cZZ1Controle := cControle

    Private aRotina := { ;
        {"Pesquisar","AxPesqui",0,1},;
        {"Visualizar","AxVisual",0,2},;
        {"Incluir","U_STTZZ2INC",0,3},;
        {"Alterar","U_STTZZ2ALT",0,4},;
        {"Excluir","U_STTZZ2DEL",0,5} }

    dbSelectArea("ZZ2")
    dbSetOrder(1)

    FilBrowse("ZZ2", @aIndexZZ2, @cFiltro)

    mBrowse(1,1,22,75,"ZZ2")

    EndFilBrw("ZZ2", aIndexZZ2)

Return          

User Function STTZZ2INC()

    Local oDlg

    Local cControle := cZZ1Controle
    Local cFornec   := ""
    Local cLoja     := ""
    Local dData     := dDataBase
    Local cHora     := Time()
    Local cProduto  := Space(15)
    Local nQtdOk    := 0
    Local nQtdNok   := 0
    Local nVlrUni   := 0

    // Busca dados da ZZ1
    dbSelectArea("ZZ1")
    dbSetOrder(1)

    If dbSeek(xFilial("ZZ1")+cControle)

        cFornec := ZZ1->ZZ1_FORNEC
        cLoja   := ZZ1->ZZ1_LOJAFO

    EndIf

    DEFINE MSDIALOG oDlg TITLE "Nova Ocorrência" ;
        FROM 000,000 TO 220,380 PIXEL

    @ 10,10 SAY "Controle:" SIZE 45,10 PIXEL OF oDlg
    @ 10,70 SAY cControle SIZE 60,10 PIXEL OF oDlg

    @ 25,10 SAY "Fornecedor:" SIZE 45,10 PIXEL OF oDlg
    @ 25,70 SAY cFornec SIZE 60,10 PIXEL OF oDlg

    @ 40,10 SAY "Loja:" SIZE 45,10 PIXEL OF oDlg
    @ 40,70 SAY cLoja SIZE 20,10 PIXEL OF oDlg

    @ 55,10 SAY "Data:" SIZE 45,10 PIXEL OF oDlg
    @ 55,70 MSGET dData SIZE 50,10 PIXEL OF oDlg

    @ 70,10 SAY "Hora:" SIZE 45,10 PIXEL OF oDlg
    @ 70,70 MSGET cHora SIZE 40,10 PIXEL OF oDlg

    @ 85,10 SAY "Produto:" SIZE 45,10 PIXEL OF oDlg
    @ 85,70 MSGET cProduto SIZE 70,10 PIXEL OF oDlg

    @ 100,10 SAY "Qtd Conforme:" SIZE 55,10 PIXEL OF oDlg
    @ 100,70 MSGET nQtdOk ;
	 	    PICTURE "@E 999,999,999" ;
		    SIZE 80,10 PIXEL OF oDlg
		
     @ 115,10 SAY "Qtd Não Conf.:" SIZE 55,10 PIXEL OF oDlg
     @ 115,70 MSGET nQtdNok ;
		    PICTURE "@E 999,999,999" ;
		    SIZE 80,10 PIXEL OF oDlg
		
     @ 130,10 SAY "Valor Unit.:" SIZE 55,10 PIXEL OF oDlg
	  @ 130,70 MSGET nVlrUni ;
		    PICTURE "@E 999,999,999.99" ;
		    SIZE 90,10 PIXEL OF oDlg

    @ 165,70 BUTTON "Salvar" SIZE 40,14 PIXEL OF oDlg ;
        ACTION ( ;
				    U_STTZZ2SALVAR( ;
				        cControle, ;
				        cFornec, ;
				        cLoja, ;
				        dData, ;
				        cHora, ;
				        cProduto, ;
				        nQtdOk, ;
				        nQtdNok, ;
				        nVlrUni ), ;
				    oDlg:End() )

    @ 165,120 BUTTON "Cancelar" SIZE 40,14 PIXEL OF oDlg ;
        ACTION oDlg:End()

    ACTIVATE MSDIALOG oDlg CENTERED

Return

User Function STTZZ2SALVAR(cControle,cFornec,cLoja,dData,cHora,cProduto,nQtdOk,nQtdNok,nVlrUni)

    Local lOk   := .T.
    Local oErro

    BEGIN SEQUENCE

        If Empty(AllTrim(cProduto))
            MsgStop("Produto é obrigatório.")
            Break(cProduto)
        EndIf
        
	   	dbSelectArea("SB1")
			dbSetOrder(1)
			
			If !dbSeek(xFilial("SB1") + cProduto)
			    MsgStop("Produto não cadastrado.")
			    Break(cProduto)
			EndIf
			
			dbSelectArea("ZZ2")

        If nQtdOk < 0
            MsgStop("Quantidade Conforme inválida.")
            Break(nQtdOk)
        EndIf

        If nQtdNok < 0
            MsgStop("Quantidade Não Conforme inválida.")
            Break(nQtdNok)
        EndIf

        If nVlrUni <= 0
            MsgStop("Valor Unitário deve ser maior que zero.")
            Break(nVlrUni)
        EndIf

        dbSelectArea("ZZ2")

        RecLock("ZZ2", .T.)

        ZZ2->ZZ2_FILIAL := xFilial("ZZ2")
        ZZ2->ZZ2_CONFOR := cControle
        ZZ2->ZZ2_FORNEC := cFornec
        ZZ2->ZZ2_LOJAFO := cLoja
        ZZ2->ZZ2_DATA   := dData
        ZZ2->ZZ2_HORA   := cHora
        ZZ2->ZZ2_CODPRO := cProduto
        ZZ2->ZZ2_QTDOK  := nQtdOk
        ZZ2->ZZ2_QTDNOK := nQtdNok
        ZZ2->ZZ2_VLRUNI := nVlrUni

        MsUnlock()
        
		  U_ATUALIZZZ1(cControle)

        MsgInfo("Ocorrência gravada com sucesso!")

    RECOVER USING oErro

        MsgStop("Erro ao gravar a ocorrência.")

        lOk := .F.

    END SEQUENCE

Return lOk                                    

User Function STTZZ2ALT()

    Local oDlg

    Local cControle := ZZ2->ZZ2_CONFOR
    Local cFornec   := ZZ2->ZZ2_FORNEC
    Local cLoja     := ZZ2->ZZ2_LOJAFO
    Local dData     := ZZ2->ZZ2_DATA
    Local cHora     := ZZ2->ZZ2_HORA
    Local cProduto  := ZZ2->ZZ2_CODPRO
    Local nQtdOk    := ZZ2->ZZ2_QTDOK
    Local nQtdNok   := ZZ2->ZZ2_QTDNOK
    Local nVlrUni   := ZZ2->ZZ2_VLRUNI

    DEFINE MSDIALOG oDlg TITLE "Alterar Ocorrência" ;
        FROM 000,000 TO 220,380 PIXEL

    @ 10,10 SAY "Controle:" SIZE 45,10 PIXEL OF oDlg
    @ 10,70 SAY cControle SIZE 60,10 PIXEL OF oDlg

    @ 25,10 SAY "Fornecedor:" SIZE 45,10 PIXEL OF oDlg
    @ 25,70 SAY cFornec SIZE 60,10 PIXEL OF oDlg

    @ 40,10 SAY "Loja:" SIZE 45,10 PIXEL OF oDlg
    @ 40,70 SAY cLoja SIZE 20,10 PIXEL OF oDlg

    @ 55,10 SAY "Data:" SIZE 45,10 PIXEL OF oDlg
    @ 55,70 MSGET dData SIZE 50,10 PIXEL OF oDlg

    @ 70,10 SAY "Hora:" SIZE 45,10 PIXEL OF oDlg
    @ 70,70 MSGET cHora SIZE 40,10 PIXEL OF oDlg

    @ 85,10 SAY "Produto:" SIZE 45,10 PIXEL OF oDlg
    @ 85,70 MSGET cProduto SIZE 70,10 PIXEL OF oDlg

    @ 100,10 SAY "Qtd Conforme:" SIZE 55,10 PIXEL OF oDlg
    @ 100,70 MSGET nQtdOk ;
        PICTURE "@E 999,999,999" ;
        SIZE 80,10 PIXEL OF oDlg

    @ 115,10 SAY "Qtd Não Conf.:" SIZE 55,10 PIXEL OF oDlg
    @ 115,70 MSGET nQtdNok ;
        PICTURE "@E 999,999,999" ;
        SIZE 80,10 PIXEL OF oDlg

    @ 130,10 SAY "Valor Unit.:" SIZE 55,10 PIXEL OF oDlg
    @ 130,70 MSGET nVlrUni ;
        PICTURE "@E 999,999,999.99" ;
        SIZE 90,10 PIXEL OF oDlg

    @ 165,70 BUTTON "Salvar" SIZE 40,14 PIXEL OF oDlg ;
        ACTION ( ;
            U_STTZZ2GRAVAALT( ;
                dData, ;
                cHora, ;
                cProduto, ;
                nQtdOk, ;
                nQtdNok, ;
                nVlrUni ), ;
            oDlg:End() )

    @ 165,120 BUTTON "Cancelar" SIZE 40,14 PIXEL OF oDlg ;
        ACTION oDlg:End()

    ACTIVATE MSDIALOG oDlg CENTERED

Return

User Function STTZZ2GRAVAALT(dData,cHora,cProduto,nQtdOk,nQtdNok,nVlrUni)

    If Empty(AllTrim(cProduto))
        MsgStop("Produto é obrigatório.")
        Return .F.
    EndIf
    
    dbSelectArea("SB1")
    dbSetOrder(1)
    
    If !dbSeek(xFilial("SB1") + cProduto)
    		MsgStop("Produto não cadastrado.")
    		Return .F.
    EndIf
    
    dbSelectArea("ZZ2")

    If nQtdOk < 0
        MsgStop("Quantidade Conforme inválida.")
        Return .F.
    EndIf

    If nQtdNok < 0
        MsgStop("Quantidade Não Conforme inválida.")
        Return .F.
    EndIf

    If nVlrUni <= 0
        MsgStop("Valor Unitário inválido.")
        Return .F.
    EndIf

    dbSelectArea("ZZ2")

    RecLock("ZZ2", .F.)

    ZZ2->ZZ2_DATA   := dData
    ZZ2->ZZ2_HORA   := cHora
    ZZ2->ZZ2_CODPRO := cProduto
    ZZ2->ZZ2_QTDOK  := nQtdOk
    ZZ2->ZZ2_QTDNOK := nQtdNok
    ZZ2->ZZ2_VLRUNI := nVlrUni

    MsUnlock()

   U_ATUALIZZZ1(ZZ2->ZZ2_CONFOR)

    MsgInfo("Ocorrência alterada com sucesso!")

Return .T.                             

User Function STTZZ2DEL()

    Local cControle := ZZ2->ZZ2_CONFOR

    If MsgYesNo("Deseja realmente excluir esta ocorrência?")

        dbSelectArea("ZZ2")

        RecLock("ZZ2", .F.)

        dbDelete()

        MsUnlock()

        // Atualiza totais da ZZ1
        U_ATUALIZZZ1(cControle)

        MsgInfo("Ocorrência excluída com sucesso!")

    EndIf

Return

User Function ATUALIZZZ1(cControle)

    Local nTotOk  := 0
    Local nTotNok := 0

    dbSelectArea("ZZ2")
    dbSetOrder(1)

    If dbSeek(xFilial("ZZ2") + cControle)

        While !Eof() .And. ;
              ZZ2->ZZ2_FILIAL == xFilial("ZZ2") .And. ;
              ZZ2->ZZ2_CONFOR == cControle

            If !ZZ2->(Deleted())
                nTotOk  += ZZ2->ZZ2_QTDOK
                nTotNok += ZZ2->ZZ2_QTDNOK
            EndIf

            dbSkip()

        EndDo

    EndIf

    dbSelectArea("ZZ1")
    dbSetOrder(1)

    If dbSeek(xFilial("ZZ1") + cControle)

        RecLock("ZZ1", .F.)

        ZZ1->ZZ1_TOTOK  := nTotOk
        ZZ1->ZZ1_TOTNOK := nTotNok

        MsUnlock()

    EndIf

Return