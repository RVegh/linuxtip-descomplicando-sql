-- Databricks notebook source
WITH TB_VENDA_VENDEDORES AS (
  SELECT idVendedor, 
         COUNT(*) AS qtVendas 
  FROM silver_olist.item_pedido 
  GROUP BY idVendedor 
)

SELECT T1.*,
       T2.descUf,
       ROW_NUMBER() OVER (PARTITION BY T2.descUf ORDER BY qtVendas DESC) AS RN
FROM TB_VENDA_VENDEDORES AS T1
LEFT JOIN silver_olist.vendedor AS T2
on T1.idVendedor = T2.idVendedor

ORDER BY descUf, qtVendas desc

