FUNCTION Main()
    LOCAL cNome := "Gustavo Reis"
    LOCAL cCidade := " São Paulo "
    LOCAL cCurso := "Harbour/ADVLP"
    hb_cdpSelect("PT850")

    QOut(" FICHA DE APRESENTAÇÃO ")
    QOut("Nome: "+ cNome)
    QOut("CIDADE: "+ cCidade)
    QOut("Curso: "+ cCurso)

RETURN NIL
