# Sistema de Controle de Fornecimento ISO 9001

Projeto desenvolvido em ADVPL durante a **Jornada Dev TOTVS**, com o objetivo de implementar um sistema de controle de fornecedores certificados e registro de ocorrências de inspeção de materiais utilizando recursos nativos do ERP Protheus.

---

# Integrante

- Gustavo Reis

---

# Objetivo

O sistema foi desenvolvido para controlar fornecedores certificados segundo a ISO 9001, permitindo cadastrar certificados, acompanhar suas datas de validade, registrar ocorrências de fornecimento e consolidar automaticamente os indicadores de conformidade.

A solução utiliza duas tabelas customizadas:

- **ZZ1** – Controle de Fornecimento
- **ZZ2** – Ocorrências de Fornecimento

O relacionamento entre elas permite que um controle possua diversas ocorrências, mantendo automaticamente os totais atualizados.

---

# Estrutura do Projeto

```
TCC
│
├── README.md
├── STTZZ1.PRW
├── STTZZ2.PRW
├── STTZZLIB.PRW
│
├── Dados-e-Dicionario
│   └── README.md
│
└── evidencias
```

---

# Como executar

1. Compile os arquivos `STTZZ1.PRW`, `STTZZ2.PRW` e `STTZZLIB.PRW`.
2. Certifique-se de que as tabelas ZZ1 e ZZ2 estejam cadastradas no dicionário de dados.
3. Caso deseje utilizar o menu personalizado, configure uma entrada apontando para as rotinas `U_STTZZ1` e `U_STTZZ2`.
4. Execute a rotina principal `U_STTZZ1`, que permitirá acessar o cadastro de controles e, a partir dele, as ocorrências registradas.

---

# Estrutura da Solução

## STTZZ1.PRW

Responsável pelo cadastro principal do sistema.

Funcionalidades implementadas:

- Inclusão
- Alteração
- Exclusão
- Visualização
- Pesquisa
- mBrowse
- FilBrowse
- Painel de cores
- Consulta das ocorrências relacionadas

---

## STTZZ2.PRW

Responsável pelo registro das ocorrências de fornecimento.

Funcionalidades implementadas:

- Inclusão
- Alteração
- Exclusão
- Visualização
- Pesquisa
- Atualização automática dos totais da ZZ1

---

## STTZZLIB.PRW

Biblioteca contendo funções reutilizadas durante o projeto.

Funções implementadas:

- NomeFornecedor()
- NomeProduto()
- ProxCodigoZZ1()
- ProxCodigoZZ2()
- PercNaoConforme()
- CertVencido()
- CertVencendo()
- FornecedorExiste()
- ProdutoExiste()
- GravarLogTCC()

---

# Funcionalidades

## Cadastro de Controle de Fornecimento (ZZ1)

Permite cadastrar fornecedores certificados informando:

- fornecedor
- loja
- certificado
- validade
- tolerância

Também apresenta:

- quantidade conforme
- quantidade não conforme

atualizadas automaticamente conforme as ocorrências cadastradas.

---

## Cadastro de Ocorrências (ZZ2)

Permite registrar:

- fornecedor
- produto
- data
- hora
- quantidade conforme
- quantidade não conforme
- valor unitário

Cada ocorrência pertence a um controle cadastrado na ZZ1.

---

# Atualização automática

Sempre que uma ocorrência é:

- incluída;
- alterada;
- excluída;

é executada a função:

```
U_ATUALIZZZ1()
```

responsável por recalcular:

- Total Conforme
- Total Não Conforme

gravados na tabela ZZ1.

---

# Legenda visual

Foi implementado um painel de cores utilizando o mBrowse para facilitar a identificação da situação dos certificados.

| Cor | Situação |
|------|----------|
| 🟢 Verde | Certificado válido |
| 🟡 Amarelo | Certificado vence em até 30 dias |
| 🔴 Vermelho | Certificado vencido |

---

# Validações implementadas

## ZZ1

- fornecedor obrigatório;
- fornecedor existente na SA2;
- certificado obrigatório;
- certificado não vencido;
- tolerância entre 0 e 100.

---

## ZZ2

- produto obrigatório;
- produto existente na SB1;
- quantidade conforme maior ou igual a zero;
- quantidade não conforme maior ou igual a zero;
- valor unitário maior que zero.

---

# Tratamento de erros

Todas as gravações utilizam:

```
BEGIN SEQUENCE

...

RECOVER USING oErro

...

END SEQUENCE
```

garantindo mensagens amigáveis ao usuário e evitando gravações inconsistentes.

---

# Regras de Negócio

As principais regras implementadas no projeto são:

- Não permitir cadastro de fornecedor inexistente.
- Não permitir certificado com validade vencida.
- Não permitir tolerância fora da faixa de 0 a 100.
- Não permitir cadastro de produto inexistente.
- Não permitir quantidades negativas.
- Não permitir valor unitário menor ou igual a zero.
- Atualizar automaticamente os totais da ZZ1 após qualquer alteração na ZZ2.

---

# Recursos do Protheus utilizados

Durante o desenvolvimento foram utilizados diversos recursos nativos do Protheus, entre eles:

- mBrowse
- FilBrowse
- AxVisual
- RecLock
- MsUnlock
- Posicione
- ExistCpo
- BEGIN SEQUENCE
- SX3
- SX7
- SIX
- Menu XNU

---

# Menu

Foi criado um menu personalizado para o módulo Compras (SIGACOM), permitindo acesso direto às rotinas desenvolvidas.

Estrutura implementada:

```
Compras

    Atualizações

        Controle ISO 9001

            Controle de Fornecimento

            Ocorrências de Fornecedor
```

---

# Evidências

As evidências de execução encontram-se na pasta **evidencias**.

## Gatilhos

[Evidência](./evidencias/Gatilhos.png)

---

## Inclusão de Controle de Fornecimento

[Evidência](./evidencias/Inclusão%20ZZ1.png)

---

## Registro incluído

[Evidência](./evidencias/Registro%20incluído.png)

---

## Visualização

[Evidência](./evidencias/Visualização%20ZZ1.png)

---

## Alteração ZZ1

[Evidência](./evidencias/Alteração%20ZZ1.png)

---

## Exclusão ZZ1

[Evidência](./evidencias/Exclusão%20ZZ1.png)

---

## Painel de cores

[Evidência](./evidencias/Painel%20colors%20ZZ1.png)

---

## Inclusão de Ocorrência

[Evidência](./evidencias/Inclusão%20ZZ2.png)

---

## Ocorrência registrada

[Evidência](./evidencias/Ocorrencia%20incluida%20ZZ2.png)

---

## Alteração ZZ2

[Evidência](./evidencias/Alteração%20ZZ2.png)

---

## Exclusão ZZ2

[Evidência](./evidencias/Exclusão%20ZZ2.png)

---

## Lista de Ocorrências

[Evidência](./evidencias/Lista%20ZZ2.png)

---

## Atualização automática dos totais

[Evidência](./evidencias/Totais%20atualizados.png)

---

## Validação de fornecedor

Fornecedor existente:

[Evidência](./evidencias/Fornecedor%20válido.png)

Fornecedor inexistente:

[Evidência](./evidencias/Fornecedor%20inválido.png)

---

## Validação de produto

[Evidência](./evidencias/Produto%20inválido.png)

---

# Tecnologias utilizadas

- ADVPL
- TOTVS Protheus
- SIGACOM
- SX3
- SX7
- SIX
- DBAccess
- mBrowse
- FilBrowse
- XNU

---

# Considerações finais

O projeto atingiu o objetivo proposto, implementando um sistema completo de controle de fornecimento utilizando recursos nativos do Protheus.

Durante o desenvolvimento foram aplicados conceitos de modelagem de dados, relacionamento entre tabelas, CRUD, tratamento de erros, reutilização de código por meio de biblioteca de funções, validações de negócio, customização de menus e atualização automática de indicadores.

O resultado é uma solução organizada, modular e aderente às boas práticas de desenvolvimento em ADVPL, permitindo futuras evoluções e manutenção simplificada.