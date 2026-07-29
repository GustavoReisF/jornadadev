# Exercício 2 - Estrutura da ZA1

## a. Estrutura da tabela

| Campo | Tipo | Tamanho |
|--------|------|----------|
| ZA1_FILIAL | Caracter | 2 |
| ZA1_CLIENT | Caracter | 40 |
| ZA1_NPET | Caracter | 40 |
| ZA1_RACA | Caracter | 30 |
| ZA1_DTNASC | Data | 8 |

## b. Índice

Um índice adequado seria:

ZA1_FILIAL + ZA1_NPET

Assim o sistema consegue localizar rapidamente os pets dentro de cada filial.

## c. Por que começa com Z?

O prefixo Z identifica uma tabela customizada criada pelo cliente ou desenvolvedor, evitando conflitos com tabelas padrão da TOTVS.

## d. Por que os campos começam com ZA1_?

Porque essa é a convenção do Protheus. O prefixo identifica a qual tabela o campo pertence e evita conflitos entre tabelas diferentes.