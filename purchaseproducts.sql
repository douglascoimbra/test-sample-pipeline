SELECT 
  stg.orderid as mdmorderid, 
  stg.customerid as mdmcustomerid, 
  stg.customername as mdmcustomername, 
  product.bar_code as mdmbarcode, 
  stg_p.productname as mdmproductname 
--metadata-v2--
FROM 
  stg_nlp_purchaseorder stg 
  LEFT JOIN UNNEST(stg.products) as product 
  LEFT JOIN stg_nlp_product stg_p on (
    product.bar_code = stg_p.bar_code
  ) --timestamp-- and stg.mdmCounterForEntity > {{start_from}}
  --tenantIds-- and mdmTenantId IN {{tenantIds}}
