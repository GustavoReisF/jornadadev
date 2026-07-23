PROCEDURE Main()

    LOCAL aV
    LOCAL cNumero, nNumero
    LOCAL nContador, nSoma, nMedia

    aV := {}
    nSoma := 0

    FOR nContador := 1 TO 10

        ACCEPT "Digite um n£mero: " TO cNumero

        nNumero := Val(cNumero)

        AAdd(aV, nNumero)

    NEXT

    ASort(aV)

    QOut("")
    QOut("N£meros em ordem crescente:")

    FOR nContador := 1 TO Len(aV)

        QOut(aV[nContador])

        nSoma += aV[nContador]

    NEXT

    nMedia := nSoma / Len(aV)

    QOut("")

    QOut("Soma: " + LTrim(Str(nSoma)))

    QOut("M‚dia: " + LTrim(Str(nMedia)))

    QOut("Menor: " + LTrim(Str(aV[1])))

    QOut("Maior: " + LTrim(Str(aV[Len(aV)])))

RETURN