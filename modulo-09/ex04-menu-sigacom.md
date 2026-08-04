# Exercício 4 — Menu no SIGACOM (Bônus)

## Objetivo

Criar uma rotina para exibir todas as interações cadastradas na tabela **SZ3**, sem aplicar filtro por contato.

A rotina foi implementada através da função:

- `U_STTIP004B`

Diferente da `STTIP004`, que lista apenas as interações do contato selecionado, esta versão apresenta todos os registros existentes na tabela **SZ3**.

---

## Funcionalidades implementadas

- Cadastro da rotina `STTIP004B`;
- Abertura da tabela `SZ3`;
- Ordenação pelo índice principal;
- Exibição dos registros utilizando `mBrowse`;
- Listagem geral das interações, sem utilização de filtro (`cFiltro`).

---

## Evidência

### Execução da rotina `STTIP004B`

A imagem abaixo demonstra a execução da rotina, exibindo todas as interações cadastradas na tabela **SZ3**.

![Execução da rotina STTIP004B](./evidencias/ex04-menu-sigacom.png)

---

## Resultado

✅ Rotina compilada com sucesso.

✅ Execução realizada pelo Protheus.

✅ Listagem geral das interações funcionando corretamente.

✅ Exercício concluído.