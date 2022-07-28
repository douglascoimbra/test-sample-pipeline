
SELECT 
    stg.productname as mdmname,
    CONCAT("qawork-", stg.productname) as mdmdescription,
    stg.productprice as mdmunitvalue,
    CONTAINS_SUBSTR(stg.productname, 'banan') AS mdmDeleted
    --metadata{nlp,product}--
from stg_nlp_product as stg
