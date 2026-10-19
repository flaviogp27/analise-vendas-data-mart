# Scripts SQL

## Estrutura do Data Mart

O arquivo `01_estrutura_dm_vendas.sql` cria o schema `dm_vendas`, as cinco tabelas e suas restrições no PostgreSQL.

A exportação contém somente a estrutura, sem dados.

## Como utilizar

1. Crie um banco de dados chamado `dw_vendas`.
2. Abra o Query Tool do pgAdmin conectado a esse banco.
3. Abra e execute `01_estrutura_dm_vendas.sql`.
4. Configure as conexões no Pentaho e execute o job para carregar os dados.

Execute o script em um banco novo, no qual as tabelas do projeto ainda não existam.
