PROCEDURE Main()

    LOCAL aDias
    LOCAL nIndice, cIndice

    aDias := { ;
    "SEGUNDA", ;
    "TER€A", ;
    "QUARTA", ;
    "QUINTA", ;
    "SEXTA", ;
    "SµBADO", ;
    "DOMINGO" }

    ACCEPT "Digite um n£mero de 1 a 7: " TO cIndice

    nIndice := Val(cIndice)

    IF nIndice >= 1 .AND. nIndice <= 7
    
        QOut("Dia da semana: " + aDias[nIndice])
    
    ELSE
    
        QOut("N?mero inv?lido.")
    
    ENDIF

RETURN