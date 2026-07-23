PROCEDURE Main()

    LOCAL aVetor
    LOCAL nContador
    LOCAL cNumero

    aVetor := {}

    FOR nContador := 1 TO 10

        ACCEPT "Digite um numero: " TO cNumero

        AAdd(aVetor, Val(cNumero))

    NEXT

    BubbleSort(aVetor)

    QOut("")
    QOut("Vetor Ordenado")

    FOR nContador := 1 TO Len(aVetor)

        QOut(LTrim(Str(aVetor[nContador])))

    NEXT

RETURN


FUNCTION BubbleSort(aVetor)

    LOCAL i
    LOCAL j
    LOCAL nTemp

    FOR i := 1 TO Len(aVetor) - 1

        FOR j := 1 TO Len(aVetor) - i

            IF aVetor[j] > aVetor[j + 1]

                nTemp := aVetor[j]
                aVetor[j] := aVetor[j + 1]
                aVetor[j + 1] := nTemp

            ENDIF

        NEXT

    NEXT

RETURN NIL