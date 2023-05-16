SELECT 
    stg.id as mdmbarcode,
    stg.productname as mdmname,
    stg.category as mdmdescription,
    stg.productprice as mdmunitvalue,
    CONTAINS_SUBSTR(stg.productname, 'banan') AS mdmDeleted
    --metadata{nlp,product}--
from stg_nlp_product as stg
--timestamp-- where stg.mdmCounterForEntity > {{start_from}}
--tenantIds{stg}--
