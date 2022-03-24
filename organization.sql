with organization as (
    select 
        stg.uuid as uuid,
        stg.name as name,
        stg.alias as alias,
        stg.federalid as federalid,
        stg.mdmCounterForEntity as _counter
        --metadata--
    from stg_protheus_carol_organization stg
    --timestamp-- WHERE stg.mdmCounterForEntity > {{start_from}}
),
organization_company as (
    select * from organization
   )

select * except(_counter, ranking),
(
    (uuid is null) or (uuid = '')
) mdmDeleted
from (
    select * from (
        select *, row_number() over (partition by uuid ORDER BY _counter DESC) ranking
        from organization_company
    )
    where ranking = 1
)