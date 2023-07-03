SELECT 
    stg.id as mdmbarcode,
    stg.name as mdmname,
    stg.document as mdmimage,
    stg.name as mdmdescription
    --metadata{ds780588,test}--
from stg_ds780588_test as stg
where 1=1
--timestamp-- and stg.mdmCounterForEntity > {{start_from}}
--tenantIds-- and mdmTenantId IN {{tenantIds}}
