FUNCTION Main()
    LOCAL cNome := "Gustavo Reis"
    LOCAL cCidade := "SÆo Paulo"
    LOCAL cCurso := "Harbour/ADVLP"
    hb_cdpSelect("PT850")

    // Exibe os dados da apresenta‡Æo
    QOut("======= FICHA DE APRESENTA€ÇO ============")
    QOut("Nome: "+ cNome)
    QOut("Cidade: "+ cCidade)
    QOut("Curso: "+ cCurso)

    // Exibe a data e a hora atuais do sistema
    QOut("Data: " + DToC( Date() ))
    QOut("Hora: " + Time())

RETURN NIL