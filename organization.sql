with organization as (
    select 
        stg.uuid as uuid,
        stg.name as name,
        stg.alias as alias,
        stg.federalid as federalid
        --metadata--
    from stg_protheus_company stg
),
company as (
    select *
    from stg_protheus_company
)

select * from company