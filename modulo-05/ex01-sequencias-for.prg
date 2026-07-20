FUNCTION Main()
    LOCAL nContador
    
    QOut("===== Item A =====")

    For nContador := 1 TO 100             
        QOut ("N£mero: " + LTrim(str(nContador)))

    NEXT

    QOut("")
    QOut("===== Item B =====")

    For nContador := -50 TO 50
        QOut("N£mero: " + LTrim(str(nContador)))

    NEXT

    QOut("")
    QOut("===== Item C =====")
    
    For nContador := 80 TO 5 STEP -1
        QOut("N£mero: " + LTrim(str(nContador)))

    NEXT

RETURN NIL