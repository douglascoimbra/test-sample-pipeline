SELECT 
    stg.id as mdmbarcode,
    stg.productname as mdmname,
    stg.category as mdmdescription,
    stg.productprice as mdmunitvalue,
    CONTAINS_SUBSTR(stg.productname, 'banan') AS mdmDeleted
    --metadata-v2--
from stg_nlp_product as stg
where 1=1
--timestamp-- and stg.mdmCounterForEntity > {{start_from}}
--tenantIds-- and mdmTenantId IN {{tenantIds}}
