FUNCTION Main()
    
    LOCAL cTexto1 := "Harbour"
    LOCAL cTexto2 := "Harb"
    hb_cdpSelect("PT850")

    QOut("===== COMPARA€ÇO DE STRINGS =====")
    QOut("Texto 1: " + cTexto1)
    QOut("Texto 2: " + cTexto2)
    QOut("")

    // O operador "=" compara apenas o in¡cio da string.
    IF cTexto1 = cTexto2
        QOut('Usando "=": VERDADEIRO')
    ELSE
        QOut('Usando "=": FALSO')
    ENDIF

    // O operador "==" exige igualdade exata.
    IF cTexto1 == cTexto2
        QOut('Usando "==": VERDADEIRO')
    ELSE
        QOut('Usando "==": FALSO')
    ENDIF

RETURN NIL