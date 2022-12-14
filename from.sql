-- Databricks notebook source
SELECT *,
      datediff(dtEstimativaEntrega, dtEntregue)
FROM
  silver_olist.pedido

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido

-- COMMAND ----------

SELECT *
FROM silver_olist.pedido
WHERE descSituacao IN ('shipped', 'canceled')
--WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled') --evita que considera apenas a condição shipped independente da data, e depois busque o restante considerando o filtro de ano
AND year(dtPedido) = '2018'
AND DATEDIFF(dtEstimativaEntrega, dtAprovado) > 30

-- COMMAND ----------


