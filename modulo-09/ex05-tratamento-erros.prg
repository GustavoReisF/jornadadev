FUNCTION Main()

    LOCAL nA := 10
    LOCAL nB := 0
    LOCAL nRes
    LOCAL oErro

    QOut("==============================")
    QOut("TRATAMENTO DE ERROS")
    QOut("==============================")

    BEGIN SEQUENCE

        QOut("Realizando divisao...")

        nRes := nA / nB

        QOut("Resultado: " + Str(nRes))

    RECOVER USING oErro

        QOut("")
        QOut("Erro capturado com sucesso!")
        QOut("Descricao:")
        QOut(oErro:Description)

    END SEQUENCE

    QOut("")
    QOut("==============================")
    QOut("O programa continua de pe!")
    QOut("==============================")

RETURN NIL