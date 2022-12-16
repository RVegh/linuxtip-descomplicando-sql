-- Databricks notebook source
SELECT ip.*,
       ROUND(vlPreco + vlFrete, 2) AS vlTotal,
       ROUND(vlFrete / (vlPreco + vlFrete), 2) AS pctFrete,
    CASE 
      WHEN vlFrete / (vlPreco + vlFrete) < 0.1 THEN '10%'
      WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
      WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '25% A 50%'
      ELSE '+50%'
    END AS descFretePct      
FROM silver_olist.item_pedido as ip

-- COMMAND ----------

SELECT *,
       DATE(dtEntregue),
       DATE(dtEstimativaEntrega)
FROM silver_olist.pedido
WHERE YEAR(dtPedido) = 2017
AND MONTH(dtPedido) = 12
AND descSituacao = 'delivered'
AND DATE(dtEntregue) > DATE(dtEstimativaEntrega)

-- COMMAND ----------

SELECT *
FROM silver_olist.avaliacao_pedido

-- COMMAND ----------

SELECT *,
       ROUND(vlPagamento / nrPacelas, 2) AS vlParcela
FROM silver_olist.pagamento_pedido
WHERE nrPacelas > 2
AND (vlPagamento / nrPacelas) < 20
