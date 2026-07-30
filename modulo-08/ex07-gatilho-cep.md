# Exercício 7 - Gatilho de CEP

## a. Qual a diferença entre campo, contra-domínio e regra em um gatilho?

- **Campo:** é o campo que dispara o gatilho quando seu valor é alterado.
- **Contra-domínio:** é o campo que receberá o valor preenchido automaticamente.
- **Regra:** é a expressão ou função responsável por calcular ou buscar o valor que será gravado no contra-domínio.

---

## b. Por que a regra usa M->A1_CEP e não SA1->A1_CEP?

Porque **M->** representa o valor que está sendo digitado pelo usuário antes da gravação do registro. Já **SA1->** acessa o valor que já está salvo na tabela. Durante a edição do cadastro, é necessário utilizar **M->A1_CEP**, pois o registro ainda não foi gravado.

---

## c. Os CEPs estão dentro do fonte. Cite dois problemas disso em produção e como você resolveria.

### Problemas

- Sempre que um CEP fosse alterado ou um novo CEP precisasse ser incluído, seria necessário alterar o código e recompilar a rotina.
- Manter milhares de CEPs dentro do programa dificulta a manutenção e aumenta o tamanho do código.

### Soluções

- Armazenar os CEPs em uma tabela do banco de dados e realizar a consulta dinamicamente.
- Integrar o sistema a um serviço externo de consulta de CEP (API), mantendo os dados sempre atualizados.

---

## d. Se pedissem para preencher também o código do município (A1_COD_MUN), o que você faria?

Criaria um novo gatilho no SX7 para preencher automaticamente o campo **A1_COD_MUN**, utilizando a mesma lógica dos demais gatilhos. A regra faria a busca do código do município na fonte de dados utilizada e preencheria o campo durante a digitação do CEP.