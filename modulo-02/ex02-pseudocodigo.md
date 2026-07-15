# Exercício 2 - Pseudocódigo

## Objetivo

Escrever algoritmos em pseudocódigo utilizando as palavras **Leia**, **Escreva**, **Se...Senão** e o operador **←** para atribuição.

---

# a) Calcular a área de um retângulo

### Pseudocódigo

```text
Início

Leia Base
Leia Altura

Área ← Base × Altura

Escreva "Área =", Área

Fim
```

### Explicação

**Entrada:**
- Base
- Altura

**Processamento:**
- Multiplicar a base pela altura.

**Saída:**
- Exibir o valor da área do retângulo.

---

# b) Verificar se um número é par ou ímpar

### Pseudocódigo

```text
Início

Leia Número

Se Número % 2 = 0 Então
    Escreva "Número Par"
Senão
    Escreva "Número Ímpar"
FimSe

Fim
```

### Explicação

**Entrada:**
- Um número inteiro.

**Processamento:**
- Verificar se o resto da divisão por 2 é igual a zero.

**Saída:**
- Informar se o número é par ou ímpar.

---

# c) Encontrar o maior entre três números

### Pseudocódigo

```text
Início

Leia A
Leia B
Leia C

Maior ← A

Se B > Maior Então
    Maior ← B
FimSe

Se C > Maior Então
    Maior ← C
FimSe

Escreva "Maior número =", Maior

Fim
```

### Explicação

**Entrada:**
- Três números.

**Processamento:**
- Considerar inicialmente que o primeiro número é o maior.
- Comparar o segundo número com o maior.
- Comparar o terceiro número com o maior.
- Atualizar a variável **Maior** sempre que encontrar um valor maior.

**Saída:**
- Exibir o maior número informado.