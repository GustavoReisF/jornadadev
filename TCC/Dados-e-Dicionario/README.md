# Dados e Dicionário

Este documento descreve a estrutura das tabelas customizadas desenvolvidas para o projeto.

---

# Tabela ZZ1

Descrição:

Cadastro responsável pelo controle de fornecimento dos fornecedores certificados.

## Campos

| Campo | Descrição |
|--------|-----------|
| ZZ1_FILIAL | Filial |
| ZZ1_CODIGO | Código do Controle |
| ZZ1_FORNEC | Código do Fornecedor |
| ZZ1_LOJAFO | Loja |
| ZZ1_CERTIF | Certificado |
| ZZ1_VALCER | Validade do Certificado |
| ZZ1_TOLERA | Percentual de Tolerância |
| ZZ1_TOTOK | Total Conforme |
| ZZ1_TOTNOK | Total Não Conforme |

## Índice

Ordem 1

```
Filial + Código
```

---

# Tabela ZZ2

Descrição:

Tabela responsável pelo armazenamento das ocorrências registradas durante as inspeções de fornecimento.

## Campos

| Campo | Descrição |
|--------|-----------|
| ZZ2_FILIAL | Filial |
| ZZ2_CONFOR | Controle ZZ1 |
| ZZ2_FORNEC | Fornecedor |
| ZZ2_LOJAFO | Loja |
| ZZ2_DATA | Data |
| ZZ2_HORA | Hora |
| ZZ2_CODPRO | Produto |
| ZZ2_QTDOK | Quantidade Conforme |
| ZZ2_QTDNOK | Quantidade Não Conforme |
| ZZ2_VLRUNI | Valor Unitário |

## Índice

Ordem 1

```
Filial + Controle
```

---

# Relacionamento

```
ZZ1

1 Controle

        │

        │

        ▼

ZZ2

N Ocorrências
```

Cada registro da tabela ZZ1 pode possuir diversas ocorrências registradas na tabela ZZ2.

Sempre que uma ocorrência é incluída, alterada ou excluída, a função `U_ATUALIZZZ1()` recalcula automaticamente os totais de conformidade e não conformidade armazenados na tabela ZZ1.

# Menu

Foi desenvolvido um menu personalizado para o módulo SIGACOM.

Arquivo disponibilizado:

```
Menu/TCCISO.XNU
```

O menu adiciona as seguintes rotinas:

- Controle de Fornecimento (U_STTZZ1)
- Ocorrências de Fornecimento (U_STTZZ2)

Sua utilização depende da configuração do ambiente Protheus onde será importado.