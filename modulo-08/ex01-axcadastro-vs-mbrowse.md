# Exercício 1 - AxCadastro x mBrowse

## a. Quando você usaria AxCadastro e quando usaria mBrowse? Dê um exemplo de cada.

Utilizaria o AxCadastro quando precisasse criar rapidamente um cadastro padrão, aproveitando as funcionalidades prontas do Protheus. Exemplo: cadastro de Pets utilizando a tabela ZA1.

Utilizaria o mBrowse quando fosse necessário personalizar a tela, adicionando filtros, botões e legendas coloridas. Exemplo: cadastro de Pets com filtros e destaque por cores.

---

## b. Cite três coisas que o mBrowse faz e o AxCadastro não faz.

- Permite criar filtros personalizados.
- Permite adicionar botões personalizados.
- Permite utilizar legendas e cores nas linhas do browse.

---

## c. Na configuração de legendas (aColors), por que a regra ".T." deve ficar por último?

Porque ".T." significa verdadeiro. Se ela for colocada antes das outras regras, será sempre executada primeiro, impedindo que as demais condições sejam avaliadas.

---

## d. Qual a diferença entre um campo Virtual (X3_RELACAO) e um gatilho (SX7) para preencher o nome do cliente?

O campo Virtual (X3_RELACAO) apenas consulta e exibe uma informação de outra tabela, sem gravá-la no banco de dados.

Já o gatilho (SX7) executa uma ação automaticamente quando um campo é alterado, podendo preencher e gravar valores em outros campos.