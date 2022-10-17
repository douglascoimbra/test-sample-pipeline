
WITH fake_data AS (
  SELECT [
    STRUCT('a1' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Cafu' AS mdmname, '' AS mdmroles, 'pt_BR' AS mdmlocale, TRUE AS mdmshouldsendwelcomeemail, '["tetra","penta"]' AS mdmgroups, 'cafu@test.com' AS mdmlogin, 'cafu2' AS mdmpassword, TRUE AS mdmshouldcreateuser, '+5500999225522' AS mdmphonenumber, TRUE AS mdmisactive, TRUE AS mdmallowcaroluiaccess),
    STRUCT('a2' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Dunga' AS mdmname, 'TENANT_ADMIN_ROLE' AS mdmroles, 'pt_BR' AS mdmlocale, FALSE AS mdmshouldsendwelcomeemail, '["tetra"]' AS mdmgroups, 'dunga@test.com' AS mdmlogin, 'dunga8' AS mdmpassword, TRUE AS mdmshouldcreateuser, '+5500999885588' AS mdmphonenumber, CAST(NULL AS BOOL) AS mdmisactive, TRUE AS mdmallowcaroluiaccess),
    STRUCT('a3' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Capita' AS mdmname, '' AS mdmroles, 'pt_BR' AS mdmlocale, CAST(NULL AS BOOL) AS mdmshouldsendwelcomeemail, 'tri' AS mdmgroups, 'capita@test.com' AS mdmlogin, 'capita2' AS mdmpassword, FALSE AS mdmshouldcreateuser, '' AS mdmphonenumber, TRUE AS mdmisactive, TRUE AS mdmallowcaroluiaccess),
    STRUCT('a4' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Alex de Souza' AS mdmname, 'APP_ADMIN_ROLE' AS mdmroles, '' AS mdmlocale, FALSE AS mdmshouldsendwelcomeemail, CAST(NULL AS STRING) AS mdmgroups, '' AS mdmlogin, 'alex10' AS mdmpassword, FALSE AS mdmshouldcreateuser, CAST(NULL AS STRING) AS mdmphonenumber, TRUE AS mdmisactive, TRUE AS mdmallowcaroluiaccess),
    STRUCT('a5' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Gamarra' AS mdmname, 'BUSINESS_USER_ROLE' AS mdmroles, 'en_US' AS mdmlocale, FALSE AS mdmshouldsendwelcomeemail, CAST(NULL AS STRING) AS mdmgroups, CAST(NULL AS STRING) AS mdmlogin, '' AS mdmpassword, CAST(NULL AS BOOL) AS mdmshouldcreateuser, '+5500999045504' AS mdmphonenumber, TRUE AS mdmisactive, FALSE AS mdmallowcaroluiaccess),
    STRUCT('a6' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Paolo Maldini' AS mdmname, CAST(NULL AS STRING) AS mdmroles, 'en_US' AS mdmlocale, TRUE AS mdmshouldsendwelcomeemail, '' AS mdmgroups, 'maldini@test.com' AS mdmlogin, 'maldini3' AS mdmpassword, FALSE AS mdmshouldcreateuser, '+5500999135513' AS mdmphonenumber, TRUE AS mdmisactive, CAST(NULL AS BOOL) AS mdmallowcaroluiaccess),
    STRUCT('a7' as mdmId, null as mdmTenantId, "" as mdmEntityType, 0 as mdmCounterForEntity, 'Nesta' AS mdmname, CAST(NULL AS STRING) AS mdmroles, CAST(NULL AS STRING) AS mdmlocale, TRUE AS mdmshouldsendwelcomeemail, CAST(NULL AS STRING) AS mdmgroups, 'nesta.com' AS mdmlogin, CAST(NULL AS STRING) AS mdmpassword, FALSE AS mdmshouldcreateuser, '+5500999135513' AS mdmphonenumber, TRUE AS mdmisactive, FALSE AS mdmallowcaroluiaccess)
  ] AS players
),

users AS (
  SELECT
    --'e9da7834c1f646019567ff9a079638d7' as mdmTenantId,
    mdmname,
    mdmroles,
    mdmlocale,
    mdmshouldsendwelcomeemail,
    mdmgroups,
    mdmlogin,
    mdmpassword,
    mdmshouldcreateuser,
    mdmphonenumber,
    mdmisactive,
    mdmallowcaroluiaccess
    --CONTAINS_SUBSTR(stg.mdmname, 'Cafu') AS mdmDeleted
    --metadata--
  FROM
    fake_data,
    UNNEST(players) AS stg
  WHERE
    1 = 1
    --timestamp-- AND mdmCounterForEntity > {{start_from}}
)

SELECT
  *--, (mdmlogin IS NULL OR LENGTH(TRIM(mdmlogin)) = 0) AS mdmDeleted
FROM
  users
