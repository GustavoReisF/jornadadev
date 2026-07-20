FUNCTION Main()
    LOCAL nNumero, cNumero
    LOCAL nDobro

    WHILE .T.
        
        ACCEPT "Digite um N£mero: " TO cNumero

        nNumero := Val(cNumero)

        IF nNumero <= 0

            QOut("N£mero Inv lido")
            EXIT

        ENDIF

        nDobro := nNumero * 2

        QOut("Dobro: " + LTrim(str(nDobro)))

    ENDDO

RETURN NIL
