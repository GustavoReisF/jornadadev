FUNCTION Main()

    // Declarando o prefixo dos Dados do funcion†rio
    LOCAL cNomeFuncionario    := "Gustavo Reis"
    LOCAL nSalarioBruto       := 5600
    LOCAL lAtivo              := .T.
    LOCAL dDataAdmissao       := Date()
    LOCAL cCodigoDepartamento := "TI"
    hb_cdpSelect("PT850")

    QOut("===== DADOS DO FUNCIONµRIO =====")
    QOut("Nome do Funcion†rio: " + cNomeFuncionario)
    QOut("Sal†rio Bruto Ç de: R$" + str(nSalarioBruto, 10, 2))
    QOut("Ativo: " + iif(lAtivo, "Sim", "N√£o"))
    QOut("Data de Admiss∆o: " + DToC(dDataAdmissao))
    QOut("Departamento: " + cCodigoDepartamento)

RETURN NIL

// O exerc°cio solicita apenas a declaraá∆o das vari†veis.
// Adicionei QOut() para visualizar os valores e reforáar o aprendizado.