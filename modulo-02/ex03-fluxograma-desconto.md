# Exercício 3 - Fluxograma

## Objetivo

Criar um fluxograma para uma loja que oferece **10% de desconto** em compras acima de **R$ 100,00**.

---

## Enunciado

Uma loja dá desconto de **10%** para compras acima de **R$ 100,00**. O algoritmo deve:

- Ler o valor da compra.
- Verificar se o valor é maior que R$ 100,00.
- Aplicar o desconto, se necessário.
- Exibir o valor final a pagar.

---

## Lógica do algoritmo

1. Ler o valor da compra.
2. Verificar se o valor é maior que R$ 100,00.
3. Se for maior, aplicar desconto de 10%.
4. Caso contrário, manter o valor original.
5. Exibir o valor final.

---

## Fluxograma

```text
                  ┌─────────────┐
                  │   Início    │
                  └──────┬──────┘
                         │
                         ▼
               ┌────────────────────┐
               │ Leia ValorCompra   │
               └─────────┬──────────┘
                         │
                         ▼
          ┌───────────────────────────────┐
          │         Valor > 100 ?         │
          └──────┬──────────────────┬─────┘
                Sim                Não
                 │                  │
                 ▼                  ▼
┌──────────────────────────┐  ┌────────────────────────┐
│ Valor ← Valor × 0,90     │  │ Valor permanece igual  │
└──────────────┬───────────┘  └───────────┬────────────┘
               │                          │
               └────────────┬─────────────┘
                            ▼
                ┌────────────────────────┐
                │ Escreva Valor Final    │
                └───────────┬────────────┘
                            ▼
                     ┌─────────────┐
                     │     Fim     │
                     └─────────────┘
```

---

## Explicação

**Entrada:**

- Valor da compra.

**Processamento:**

- Verificar se o valor da compra é maior que R$ 100,00.
- Se for, calcular o desconto de 10%.
- Caso contrário, manter o valor original.

**Saída:**

- Exibir o valor final da compra.