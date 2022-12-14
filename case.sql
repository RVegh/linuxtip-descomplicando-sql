-- Databricks notebook source
SELECT *,

    CASE
      WHEN descUF = 'SP' then 'Paulista'
      WHEN descUF = 'RJ' then 'Carioca'
      WHEN descUF = 'PR' then 'Paranaense'
      ELSE 'OUTROS' 
    END AS descNascionalidade,
    
    CASE
      WHEN descCidade like '%sao%' then 'Tem sao no nome'
      ELSE 'Não tem sao no nome'
    END AS descCidadeSao
FROM silver_olist.cliente


-- COMMAND ----------


