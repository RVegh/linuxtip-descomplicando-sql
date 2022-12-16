-- Databricks notebook source
SELECT T1.*,
       T2.descUf
FROM silver_olist.pedido as T1
LEFT JOIN silver_olist.cliente as T2
  ON T1.idCliente = T2.idCliente
