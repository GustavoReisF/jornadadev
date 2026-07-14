FUNCTION Main()
    LOCAL cNome := "Gustavo Reis"
    LOCAL cCidade := " S�o Paulo "
    LOCAL cCurso := "Harbour/ADVLP"
    hb_cdpSelect("PT850")

    QOut(" FICHA DE APRESENTA��O ")
    QOut("Nome: "+ cNome)
    QOut("CIDADE: "+ cCidade)
    QOut("Curso: "+ cCurso)

RETURN NIL
