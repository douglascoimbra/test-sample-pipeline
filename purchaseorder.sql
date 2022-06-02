SELECT 
    stg.orderid as mdmorderid,
    stg.country as mdmcountry,
    stg.customername as mdmcustomername,
    CONCAT("qawork-", stg.category) as mdmcategoryname,
    CONTAINS_SUBSTR(stg.country, 'Brazil') AS mdmDeleted
    --metadata--
from stg_nlp_purchaseorder as stg
--timestamp-- where stg.mdmCounterForEntity > {{start_from}}