-- Databricks notebook source
SELECT
  COUNT(*),
  COUNT(DISTINCT idCliente)
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  descUf,
  COUNT(idClienteUnico)
FROM silver_olist.cliente
WHERE descCidade = 'presidente prudente'
GROUP BY descUf
ORDER BY descUf

-- COMMAND ----------

SELECT
  ROUND(AVG(vlPreco), 2),
  PERCENTILE(vlPreco, 0.5),
  MAX(vlPreco),
  AVG(vlFrete),
  MAX(vlFrete),
  MIN(vlFrete)
FROM silver_olist.item_pedido
