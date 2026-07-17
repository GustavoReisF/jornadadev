FUNCTION Main()
    LOCAL cIdade, nIdade
    LOCAL cDependentes, nDependentes
    LOCAL nPlano, nTotal
    hb_cdpSelect("PT850")

    ACCEPT "Informe sua Idade: " TO cIdade
    ACCEPT "Informe a quantidade de Dependentes: " TO cDependentes

    nIdade := Val(cIdade)
    nDependentes := Val(cDependentes)

    If nIdade <= 25
        nPlano := 180

    Elseif nIdade <= 40
        nPlano := 260

    Elseif nIdade <= 60
        nPlano := 380

    Else
        nPlano := 520
        
    Endif

    nTotal := nPlano + (nDependentes * 90)

    QOut("")
    QOut("===== PLANO DE SAéDE =====")
    QOut("Idade: " + LTrim(Str(nIdade)))
    QOut("Valor do plano: R$ " + LTrim(Str(nPlano)))
    QOut("Dependentes: " + LTrim(Str(nDependentes)))
    QOut("Valor total: R$ " + LTrim(Str(nTotal)))

RETURN NIL