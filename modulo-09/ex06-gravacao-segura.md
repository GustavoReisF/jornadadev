# Exercício 06 – Gravação à prova de falhas (obrigatório)

## Objetivo

Implementar uma rotina de gravação segura para o cadastro de Contatos (SZ2), realizando validações antes da gravação, tratando possíveis erros durante o processo e registrando informações em log.

> **Observação:** O ambiente utilizado foi o **Microsiga Protheus MP8 (Build 7.00.050131A)**. Algumas funções apresentadas no material (`BeginTran()`, `CommitTran()`, `RollBackTran()` e `cNomUsr`) não estão disponíveis nesta versão e foram adaptadas para manter o mesmo comportamento esperado.

---

## Implementação

Foi criada a função:

- `U_STTIP003SALVAR()`

E adicionada na biblioteca:

- `U_GRAVARLOG()`

A rotina realiza:

- Validação dos campos obrigatórios (Cliente e Assunto);
- Tratamento de exceções utilizando `BEGIN SEQUENCE / RECOVER`;
- Gravação protegida com `RecLock()` e `MsUnlock()`;
- Registro de erros em arquivo de log;
- Mensagens amigáveis ao usuário em caso de sucesso ou falha.

---

# Evidências

## Evidência 1 – Validação de Cliente Obrigatório

Ao tentar salvar um contato sem informar o cliente, o sistema interrompe a gravação e apresenta uma mensagem amigável ao usuário.

**Resultado esperado:** Nenhum registro é gravado.

![Execução do aviso](./evidencias/ex06_cliente_obrigatorio.png)

---

## Evidência 2 – Gravação realizada com sucesso

Após informar todos os dados obrigatórios (Cliente, Loja e Assunto), a rotina grava o contato com sucesso e apresenta a mensagem de confirmação.

**Resultado esperado:** Registro gravado corretamente na tabela SZ2.

![Execução do sucesso](./evidencias/ex06_gravacao_sucesso.png)

---

# Resultado

✔ Validação dos campos obrigatórios implementada.

✔ Tratamento de erros utilizando `BEGIN SEQUENCE / RECOVER`.

✔ Gravação protegida utilizando `RecLock()` e `MsUnlock()`.

✔ Registro de erros em log.

✔ Mensagens amigáveis para o usuário.

✔ Exercício executado com sucesso no ambiente **Microsiga Protheus MP8**.

---

## Arquivos utilizados

```
STTIP003.PRW
STTIP006.PRW
STTIPLIB.PRW
```

---

## Observações

O material do curso utiliza funções de transação (`BeginTran`, `CommitTran` e `RollBackTran`) disponíveis em versões mais recentes do Protheus. Como essas funções não estão presentes no ambiente utilizado (MP8), a solução foi adaptada mantendo o objetivo do exercício: validação, tratamento de erros, gravação segura e registro em log.