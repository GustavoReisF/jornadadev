# Exercício 2 - Completando a Tabela ZA1

## Objetivo

Completar a estrutura da tabela **ZA1 (Cadastro de Pets)** no Configurador (SIGACFG), adicionando os campos necessários para relacionar o pet ao seu proprietário, configurar um campo virtual e criar os índices da tabela.

## Desenvolvimento

Foi utilizada a tabela **ZA1**, criada no módulo anterior.

Foram adicionados os seguintes campos:

| Campo | Tipo | Tamanho | Contexto |
|-------|------|:--------:|----------|
| ZA1_COD | Caracter | 6 | Real |
| ZA1_CLIENT | Caracter | 6 | Real |
| ZA1_LOJA | Caracter | 2 | Real |
| ZA1_NOMCLI | Caracter | 40 | Virtual |
| ZA1_NPET | Caracter | 30 | Real |
| ZA1_RACA | Caracter | 20 | Real |
| ZA1_DTNASC | Data | 8 | Real |

O campo **ZA1_NOMCLI** foi configurado com contexto **Virtual**, permitindo a exibição do nome do cliente sem gravar essa informação fisicamente na tabela.

Também foram criados os índices da tabela:

- Ordem 1: `ZA1_FILIAL + ZA1_COD`
- Ordem 2: `ZA1_FILIAL + ZA1_CLIENT + ZA1_LOJA`

## Resultado

A tabela ZA1 foi preparada para utilização no cadastro de Pets e será utilizada no próximo exercício para criação do CRUD com **AxCadastro**.

## Evidências
