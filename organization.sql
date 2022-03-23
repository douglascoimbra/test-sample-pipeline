with organization as (
    select 
        stg.uuid as uuid,
        stg.name as name,
        stg.alias as alias,
        stg.federalid as federalid
        --metadata--
    from stg_protheus_carol_organization stg
),
company as (
    select *
    from stg_protheus_carol_company
)

select * from company