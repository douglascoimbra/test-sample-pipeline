SELECT 
    stg.orderid as mdmorderid,
    stg.customername as mdmcustomername,
    CONCAT("qawork-", stg.category) as mdmcategoryname,
    CONTAINS_SUBSTR(stg.country, 'Brazil') as mdmcountry AS mdmDeleted
    --metadata--
from stg_nlp_purchaseorder as stg
--timestamp-- where stg.mdmCounterForEntity > {{start_from}}