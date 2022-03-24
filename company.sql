with company_fndhierarchyorganization as (
    select 
        stg.uuid as uuid,
        stg.parent_uuid as parent_uuid,
        stg.id as id,
        stg.level_description as level_description,
        stg.description as description,
        stg.path as path
        --metadata--
    from stg_protheus_company stg
),
fndhierarchyorganization as (
    select *
    from company_fndhierarchyorganization stg
)
 
select * from fndhierarchyorganization