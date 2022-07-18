SELECT 
    stg.orderid as mdmorderid,
    stg.customername as mdmcustomername,
    stg.country as mdmcountry,
    CONCAT("qawork-", stg.category) as mdmcategoryname,
    CONTAINS_SUBSTR(stg.country, 'Brazil') AS mdmDeleted
    --metadata--
from stg_nlp_tableqa as stg
--timestamp-- where stg.mdmCounterForEntity > {{start_from}}