# Exercício 5 - A1_FILIAL e xFilial()

## a. Por que existe o campo A1_FILIAL na tabela SA1 (e por que toda tabela do Protheus, incluindo a ZA1 que criamos, precisa de um campo de filial)?

O campo **A1_FILIAL** identifica a qual filial pertence cada registro da tabela. Como o Protheus pode trabalhar com diversas filiais utilizando a mesma base de dados, esse campo garante que as informações sejam organizadas e acessadas pela filial correta. Por esse motivo, toda tabela do Protheus, inclusive tabelas customizadas como a **ZA1**, precisa possuir um campo de filial.

---

## b. O que a função xFilial() tem a ver com isso? O que aconteceria se um programa "escrevesse a filial na mão" em vez de usar xFilial()?

A função **xFilial()** retorna automaticamente o código da filial correspondente à tabela utilizada pelo programa. Dessa forma, os registros são gravados e consultados na filial correta.

Se o desenvolvedor informasse a filial manualmente, poderia gravar dados na filial errada, causando inconsistências e problemas em ambientes que possuem múltiplas filiais.