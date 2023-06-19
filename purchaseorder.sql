SELECT 
    stg.orderid as mdmorderid,
    stg.customername as mdmcustomername,
    stg.country as mdmcountry,
    stg.purchasedate as cronus,
    CONCAT("qawork-", stg.category) as mdmcategoryname,
    CONTAINS_SUBSTR(stg.country, 'Brazil') AS mdmDeleted
    --metadata--
from stg_nlp_purchaseorder as stg
where 1=1
--timestamp-- and stg.mdmCounterForEntity > {{start_from}}
--tenantIds-- and mdmTenantId IN {{tenantIds}}
