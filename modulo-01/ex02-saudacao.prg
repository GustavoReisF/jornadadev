FUNCTION Main()

    //Configura a codepage PT850 para exibi‡Æo correta de caracteres acentuados
    hb_cdpSelect("PT850")

    // Exibe os dados da sauda‡Æo
    QOut("Nome: Gustavo Reis")
    QOut("Cidade: SÆo Paulo")
    QOut("Pronto para aprender ADVPL!")

RETURN NIL