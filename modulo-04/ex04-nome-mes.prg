FUNCTION Main()

    LOCAL aMeses
    LOCAL cMes
    LOCAL nMes
    hb_cdpSelect("PT850")
    
    aMeses := { ;
        "Janeiro", ;
        "Fevereiro", ;
        "Mar‡o", ;
        "Abril", ;
        "Maio", ;
        "Junho", ;
        "Julho", ;
        "Agosto", ;
        "Setembro", ;
        "Outubro", ;
        "Novembro", ;
        "Dezembro" }

    ACCEPT "Informe o n£mero do mˆs (1 a 12): " TO cMes

    nMes := Val(cMes)

    IF nMes >= 1 .AND. nMes <= 12

        QOut("")
        QOut("===== MÒS =====")
        QOut("Mˆs: " + aMeses[nMes])

    ELSE

        QOut("")
        QOut("===== MÒS =====")
        QOut("Mˆs inv lido.")

    ENDIF

RETURN NIL