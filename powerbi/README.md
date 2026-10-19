# Dashboard de vendas

O arquivo `Dashboard_Vendas.pbit` contém o modelo, os relacionamentos, as medidas DAX e o layout do relatório, sem os dados importados.

## Como utilizar

1. Crie e carregue o Data Mart seguindo as instruções das pastas `sql` e `etl`.
2. Abra o arquivo `.pbit` no Power BI Desktop.
3. Ajuste a conexão PostgreSQL para seu servidor e banco de dados.
4. Informe suas credenciais e carregue os dados.

O ambiente original utiliza PostgreSQL em `localhost`, banco `dw_vendas` e schema `dm_vendas`.

## Recursos do relatório

- Indicadores de valor vendido, notas fiscais, unidades vendidas, itens de venda e ticket médio.
- Filtros por ano, categoria, vendedor e forma de pagamento.
- Análises de evolução mensal, produtos, vendedores, categorias e formas de pagamento.
- Cartões personalizados com HTML e CSS no visual HTML Content.

Uma imagem do dashboard está disponível na pasta `images`.
