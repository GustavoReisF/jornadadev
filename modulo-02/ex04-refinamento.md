# Exercício 4 - Refinamento Sucessivo

## Objetivo

Aplicar a técnica do refinamento sucessivo para o seguinte problema:

> Um sistema de caixa de supermercado deve registrar os itens de uma compra, calcular o subtotal, aplicar desconto se o cliente tiver cartão fidelidade (5%) e mostrar o total a pagar.

---

# Nível 1 - Visão Geral

```text
Início

1. Registrar os itens da compra.
2. Calcular o subtotal.
3. Aplicar desconto, se houver cartão fidelidade.
4. Exibir o valor total da compra.

Fim
```

## Explicação

Neste primeiro nível, descrevemos apenas as etapas principais do algoritmo, sem entrar em detalhes de como cada uma será executada.

---

# Nível 2 - Detalhamento

```text
Início

1. Registrar os itens
   - Ler cada produto.
   - Informar quantidade.
   - Informar preço.
   - Repetir até finalizar a compra.

2. Calcular o subtotal
   - Somar o valor de todos os produtos.

3. Aplicar desconto
   - Verificar se o cliente possui cartão fidelidade.
   - Se possuir, aplicar desconto de 5%.
   - Caso contrário, manter o subtotal.

4. Exibir o resultado
   - Mostrar o subtotal.
   - Mostrar o desconto (se houver).
   - Mostrar o valor total a pagar.

Fim
```

## Explicação

Neste segundo nível, cada etapa da visão geral foi detalhada para mostrar exatamente como o algoritmo deverá executar cada ação.