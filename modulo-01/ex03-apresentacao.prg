FUNCTION Main()
    LOCAL cNome := "Gustavo Reis"
    LOCAL cCidade := " SÆo Paulo "
    LOCAL cCurso := "Harbour/ADVLP"
    hb_cdpSelect("PT850")

    QOut(" FICHA DE APRESENTA€ÇO ")
    QOut("Nome: "+ cNome)
    QOut("Cidade: "+ cCidade)
    QOut("Curso: "+ cCurso)

RETURN NIL