FUNCTION Main()
    LOCAL cOperacao
    LOCAL cNumero1, cNumero2
    LOCAL nNumero1, nNumero2
    LOCAL nResultado
    hb_cdpSelect("PT850")
    
    ACCEPT "Informe a opera‡Æo (+, -, *, /, ^ ou R): " TO cOperacao
    ACCEPT "Informe o primeiro n£mero: " TO cNumero1
    ACCEPT "Informe o segundo n£mero: " TO cNumero2
    

    nNumero1 := Val(cNumero1)
    nNumero2 := Val(cNumero2)

    DO CASE

    CASE cOperacao == "+"
        nResultado := nNumero1 + nNumero2
        QOut("")
        QOut("===== CALCULADORA =====")
        QOut("Resultado: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "-"
        nResultado := nNumero1 - nNumero2
        QOut("")
        QOut("===== CALCULADORA =====")
        QOut("Resultado: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "*"
        nResultado := nNumero1 * nNumero2
        QOut("")
        QOut("===== CALCULADORA =====")
        QOut("Resultado: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "/"
        If nNumero2 == 0
            QOut("")
            QOut("===== CALCULADORA =====")
            QOut("NÆo pode dividir por zero")

        Else 
            nResultado := nNumero1 / nNumero2
            QOut("")
            QOut("===== CALCULADORA =====")
            QOut("Resultado: " + LTrim(Str(nResultado,10,2)))

        Endif
            
    CASE cOperacao == "^"
        nResultado := nNumero1 ^ nNumero2
        QOut("")
        QOut("===== CALCULADORA =====")
        QOut("Resultado: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "R"
        nResultado := Sqrt(nNumero1)
        QOut("")
        QOut("===== CALCULADORA =====")
        QOut("Resultado: " + LTrim(Str(nResultado,10,2)))

    OTHERWISE
        QOut("")
        QOut("===== CALCULADORA =====")
        QOut("Opera‡Æo inv lida.")

    ENDCASE

RETURN NIL