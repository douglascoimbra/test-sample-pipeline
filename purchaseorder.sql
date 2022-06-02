SELECT 
    stg.orderid as mdmorderid,
    stg.customername as mdmcustomername,
    CONCAT("qawork-", stg.category) as mdmcategoryname,
    stg.country as mdmcountry,
    CONTAINS_SUBSTR(stg.country, 'Brazil') AS mdmDeleted
    --metadata--
from stg_nlp_purchaseorder as stg
