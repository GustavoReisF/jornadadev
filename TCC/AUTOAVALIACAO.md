# AUTOAVALIACAO.md

# Autoavaliação

Ao iniciar a Jornada Dev TOTVS eu tinha como principal objetivo aprender uma tecnologia nova e entender como funciona o desenvolvimento dentro do ecossistema Protheus. Finalizo este projeto com a sensação de que evoluí muito mais do que imaginava.

Durante a jornada tive contato, pela primeira vez, com ADVPL, Harbour e diversos recursos do Protheus. No início precisei compreender conceitos completamente novos, como a estrutura do dicionário de dados (SX2, SX3, SIX e SX7), criação de tabelas customizadas, manipulação de registros utilizando RecLock() e MsUnlock(), além da construção de rotinas utilizando mBrowse, AxCadastro e menus XNU.

O projeto foi desenvolvido em etapas. Inicialmente implementei a rotina principal (ZZ1), responsável pelo controle de fornecedores certificados. Em seguida desenvolvi a rotina de ocorrências (ZZ2), relacionando ambas as tabelas e implementando a atualização automática dos indicadores de conformidade.

Também desenvolvi uma biblioteca de funções reutilizáveis (STTZZLIB.PRW), centralizando validações, consultas e funções comuns para evitar duplicação de código e facilitar a manutenção da solução.

Outro aprendizado importante foi compreender como realizar validações de negócio dentro do Protheus, verificando fornecedores na SA2, produtos na SB1, limites de tolerância, tratamento de erros utilizando BEGIN SEQUENCE / RECOVER e implementação de gatilhos para atualização automática dos dados.

Além do desenvolvimento da aplicação, aprendi a configurar menus personalizados utilizando arquivos XNU, organizar um projeto para entrega, documentar a solução por meio de um README e registrar evidências de funcionamento da aplicação.

Durante a implementação enfrentei diversos desafios. Alguns deles envolveram problemas de validação, localização de tabelas do ambiente, configuração do dicionário de dados e entendimento do funcionamento interno do Protheus. Cada dificuldade exigiu pesquisa, testes e ajustes até que a solução estivesse funcionando corretamente.

Considero que esta jornada contribuiu significativamente para meu crescimento como desenvolvedor. Além do conhecimento técnico adquirido, desenvolvi maior capacidade de investigação, resolução de problemas, organização do código e documentação de projetos.

Como próximos passos pretendo continuar estudando ADVPL, aprofundar meus conhecimentos no ecossistema TOTVS e evoluir também em tecnologias como Python, SQL e desenvolvimento Back-end, buscando construir soluções cada vez mais completas.

A Jornada Dev TOTVS representou uma experiência extremamente enriquecedora e ampliou minha visão sobre desenvolvimento de software para ERP, fortalecendo minha base técnica e minha confiança para atuar em novos desafios profissionais.