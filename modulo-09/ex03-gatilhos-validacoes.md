# Exercício 03 – Gatilhos, Campos Virtuais e Validações Cruzadas

## Objetivo

Configurar o dicionário de dados do Protheus para automatizar o preenchimento de informações e garantir a integridade dos registros utilizando:

- Gatilhos (SX7);
- Campos virtuais (SX3);
- Validações cruzadas (`ExistCpo()`).

---

## Implementações realizadas

### Campos Virtuais

Foram configurados campos virtuais para exibir automaticamente informações relacionadas ao cadastro de Contatos (SZ2), utilizando recursos do dicionário de dados.

### Gatilhos

Foram configurados os seguintes gatilhos para a tabela **SZ3 (Interações)**:

| Campo | Regra |
|--------|-------|
| Z3_DATA | `dDataBase` |
| Z3_HORA | `IF(INCLUI, Time(), SZ3->Z3_HORA)` |
| Z3_USUAR | `cNomUsr` |

Com essas configurações, os campos são preenchidos automaticamente durante a inclusão de uma nova interação.

### Validação Cruzada

Foi implementada a validação utilizando:

```advpl
ExistCpo("SZ2", xFilial("SZ2") + M->Z3_CONTAT, 1)
```

Essa validação garante que somente seja possível cadastrar uma interação para um contato existente.

---

## Resultado

Os testes demonstraram que:

- Os gatilhos preencheram automaticamente Data, Hora e Usuário;
- O sistema permitiu incluir interações apenas para contatos válidos;
- Ao informar um contato inexistente, o Protheus bloqueou a operação exibindo a mensagem de registro não encontrado.

---

# Evidências

## 1. Inclusão de Interação

A rotina de inclusão de interações foi executada com sucesso utilizando um contato válido, comprovando o funcionamento da integração entre os cadastros de Contatos (SZ2) e Interações (SZ3).

![Programa em execução](./evidencias/ex03-programa-rodando.png)

---

## 2. Validação de Contato Inexistente

Ao informar um código de contato inexistente, o Protheus executou corretamente a validação configurada, impedindo o cadastro da interação e exibindo a mensagem de erro correspondente.

![Validação de contato inexistente](./evidencias/ex03-contato-inexistente.png)

---

## Aprendizados

Durante este exercício foram praticados os seguintes conceitos:

- Configuração de gatilhos (SX7);
- Utilização de campos virtuais (SX3);
- Validações utilizando `ExistCpo()`;
- Relacionamento entre as tabelas SZ2 (Contatos) e SZ3 (Interações);
- Automatização do preenchimento de campos durante a inclusão de registros;
- Garantia da integridade dos dados por meio de validações no dicionário de dados.

---

**Status:** ✅ Exercício concluído com sucesso.