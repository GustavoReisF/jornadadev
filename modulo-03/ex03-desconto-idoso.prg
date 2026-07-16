Function Main()
    LOCAL cNome
    LOCAL cDataNascimento
    LOCAL cPreco

    LOCAL dNascimento

    LOCAL nPreco
    LOCAL nIdade
    LOCAL nDesconto
    LOCAL nTotal

    ACCEPT "Informe seu nome: " TO cNome
    ACCEPT "Informe sua data de nascimento (mm/dd/aaaa): " TO cDataNascimento
    ACCEPT "Informe o preço do produto: " TO cPreco

    dNascimento := CtoD(cDataNascimento)
    nPreco := Val(cPreco)

    nIdade := int((Date() - dNascimento) / 365)

    if nIdade > 60
        nDesconto := nPreco * 0.125
        nTotal := nPreco - nDesconto

    else
        nDesconto := 0
        nTotal := nPreco

    end if

    QOut("")
    QOut("===== RESUMO DA COMPRA =====")
    QOut("Cliente: " + cNome)
    QOut("Idade: " + LTrim(str(nIdade, 3)))
    QOut("Preço: R$" + Ltrim(str(nPreco, 10, 2)))
    QOut("Desconto é de: R$" + Ltrim(str(nDesconto, 10, 2)))
    QOut("Total a pagar: R$" + LTrim(str(nTotal, 10, 2)))

RETURN NIL