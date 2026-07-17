FUNCTION Main()
    LOCAL cSalario, nSalario
    LOCAL nReajuste, nNovoSalario, nValorReajuste
    hb_cdpSelect("PT850")

    ACCEPT "Informe o sal rio: " TO cSalario

    nSalario := Val(cSalario)

    If nSalario < 1000
        nReajuste := 0.15

    Elseif nSalario <= 2000
        nReajuste := 0.12

    Elseif nSalario <= 4000
        nReajuste := 0.08

    Else
        nReajuste := 0.05

    Endif

    nNovoSalario := nSalario + (nSalario * nReajuste)
    nValorReajuste := nSalario * nReajuste
    
    QOut("")
    QOut("===== REAJUSTE SALARIAL =====")
    QOut("Sal rio atual: R$ " + LTrim(Str(nSalario,10,2)))
    QOut("Reajuste: " + LTrim(Str(nReajuste * 100,5,2)) + "%")
    QOut("Valor do reajuste: R$ " + LTrim(Str(nValorReajuste,10,2)))
    QOut("Novo sal rio: R$ " + LTrim(Str(nNovoSalario,10,2)))

RETURN NIL