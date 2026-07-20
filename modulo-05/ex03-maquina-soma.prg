FUNCTION Main()
    LOCAL cNumero, nNumero
    LOCAL nTotal := 0
    LOCAL nQtd := 0

    WHILE .T.
        
        ACCEPT "Digite um N£mero: " TO cNumero

        nNumero := Val(cNumero)

        IF nNumero == 0

            EXIT

        ENDIF

        nTotal := nTotal + nNumero
        nQtd := nQtd + 1

    ENDDO

    QOut("N£meros somados: " + LTrim(str(nTotal)))
    QOut("Quantidade de valores: " + LTrim(Str(nQtd)))

RETURN NIL