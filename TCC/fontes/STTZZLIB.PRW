#include "protheus.ch"

/*/{Protheus.doc} STTZZLIB
Biblioteca de funções do TCC

@author Gustavo Reis
@since 2026
@version 1.0
/*/

/*/----------------------------------------------------------
    Retorna o nome do fornecedor
----------------------------------------------------------*/
User Function NomeFornecedor(cFornec,cLoja)

Local cNome := ""

Default cFornec := ""
Default cLoja   := ""

If Empty(cFornec)
    Return ""
EndIf

cNome := Posicione("SA2",1,;
          xFilial("SA2")+cFornec+cLoja,;
          "A2_NOME")

Return AllTrim(cNome)


/*/----------------------------------------------------------
    Retorna o nome do produto
----------------------------------------------------------*/
User Function NomeProduto(cProduto)

Local cNome := ""

Default cProduto := ""

If Empty(cProduto)
    Return ""
EndIf

cNome := Posicione("SB1",1,;
          xFilial("SB1")+cProduto,;
          "B1_DESC")

Return AllTrim(cNome)


/*/----------------------------------------------------------
    Próximo código da ZZ1
----------------------------------------------------------*/
User Function ProxCodigoZZ1()

Return GetSXENum("ZZ1","ZZ1_CODIGO")


/*/----------------------------------------------------------
    Próximo código da ZZ2
----------------------------------------------------------*/
User Function ProxCodigoZZ2()

Return GetSXENum("ZZ2","ZZ2_CODIGO")


/*/----------------------------------------------------------
    Calcula percentual de não conformidade
----------------------------------------------------------*/
User Function PercNaoConforme(nOk,nNok)

Local nPerc := 0

Default nOk  := 0
Default nNok := 0

If (nOk+nNok)>0
    nPerc := (nNok/(nOk+nNok))*100
EndIf

Return nPerc


/*/----------------------------------------------------------
    Certificado vencido?
----------------------------------------------------------*/
User Function CertVencido(dData)

Default dData := dDataBase

Return dData < dDataBase


/*/----------------------------------------------------------
    Certificado vence em até X dias
----------------------------------------------------------*/
User Function CertVencendo(dData,nDias)

Default dData := dDataBase
Default nDias := 30

Return dData <= (dDataBase+nDias)


/*/----------------------------------------------------------
    Fornecedor existe?
----------------------------------------------------------*/
User Function FornecedorExiste(cFornec,cLoja)

Default cFornec := ""
Default cLoja   := ""

Return ExistCpo("SA2",;
       xFilial("SA2")+cFornec+cLoja,1)


/*/----------------------------------------------------------
    Produto existe?
----------------------------------------------------------*/
User Function ProdutoExiste(cProduto)

Default cProduto := ""

Return ExistCpo("SB1",;
       xFilial("SB1")+cProduto,1)


/*/----------------------------------------------------------
    Grava log
----------------------------------------------------------*/
User Function GravarLogTCC(cFuncao,oErro)

Local cArq := "\logs\tcc_"+Dtos(Date())+".log"
Local nHdl
Local cLinha := ""

cLinha += DToS(Date())+" "
cLinha += Time()+" | "
cLinha += cFuncao+" | "
cLinha += cUserName+" | "

If ValType(oErro)=="O"
    cLinha += oErro:Description
Else
    cLinha += cValToChar(oErro)
EndIf

nHdl := FOpen(cArq,FO_READWRITE)

If nHdl<0
    nHdl := FCreate(cArq)
EndIf

FSeek(nHdl,0,FS_END)
FWrite(nHdl,cLinha+CRLF)
FClose(nHdl)

Return