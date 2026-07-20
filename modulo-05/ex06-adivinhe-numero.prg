FUNCTION Main()

    LOCAL nSecreto, nI
    LOCAL nPalpite, cPalpite
    LOCAL lAcertou := .F.
    hb_cdpSelect("PT850")

    nSecreto := HB_RandomInt(1,100)

    QOut("=== JOGO: ADIVINHE O NéMERO ===")
    QOut("Tente descobrir o n£mero entre 1 e 100.")
    QOut("Vocˆ possui 7 tentativas.")
    QOut("")

    FOR nI := 1 TO 7

        ACCEPT "Digite seu palpite: " TO cPalpite

        nPalpite := Val(cPalpite)

        IF nPalpite == nSecreto

            QOut("Parab‚ns! Vocˆ acertou!")
            lAcertou := .T.
            EXIT

        ELSEIF nPalpite < nSecreto

            QOut("O n£mero secreto ‚ MAIOR.")

        ELSE

            QOut("O n£mero secreto ‚ MENOR.")

        ENDIF

    NEXT

    QOut("")

    IF lAcertou

        QOut("Vocˆ venceu em " + LTrim(Str(nI)) + " tentativa(s).")

    ELSE

        QOut("Suas tentativas acabaram.")
        QOut("O n£mero secreto era: " + LTrim(Str(nSecreto)))

    ENDIF

RETURN NIL