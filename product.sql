with temp_product as (
    SELECT
       stg.productname as mdmname,
        CONCAT("qadoug-", stg.productname) as mdmdescription,
        stg.productprice as mdmunitvalue,
        CONTAINS_SUBSTR(stg.productname, 'banan') AS mdmDeleted,
        row_number() over (partition by stg.id order by stg.mdmCounterForEntity desc) sequence,
        --metadata--
    from stg_nlp_product as stg
),
mdmproduct as (
    select *
    from temp_product where sequence = 1
    )
select *,
false as mdmDeleted
from mdmproduct

