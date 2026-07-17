FUNCTION Main()
    LOCAL cNumero1, cNumero2
    LOCAL nNumero1, nNumero2
    hb_cdpSelect("PT850")
    
    ACCEPT "Informe o primeiro n£mero: " TO cNumero1
    ACCEPT "Informe o segundo n£mero: " TO cNumero2

    nNumero1 := Val(cNumero1)
    nNumero2 := Val(cNumero2)

    if nNumero1 == nNumero2
        QOut("")
        QOut("Os dois n£meros sÆo iguais.")
        
    else   
        
        if nNumero1 > nNumero2
            
            QOut("Maior: " + LTrim(str(nNumero1, 10, 2)))
            QOut("Menor: " + LTrim(str(nNumero2, 10, 2)))

        else    

            QOut("Maior: " + LTrim(str(nNumero2, 10, 2)))
            QOut("Menor: " + LTrim(str(nNumero1, 10, 2)))
        endif

    endif

RETURN NIL