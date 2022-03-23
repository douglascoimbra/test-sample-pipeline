
SELECT 
    stg.name as mdmname,
    CONCAT("qawork-", stg.name) as mdmcompanycode,
    stg.taxid as mdmtaxid,
    (CONTAINS_SUBSTR(stg.name, 'H') OR CONTAINS_SUBSTR(stg.name, 'I')) AS mdmDeleted,
  CASE CONTAINS_SUBSTR(stg.name, 'H') OR CONTAINS_SUBSTR(stg.name, 'I')
      WHEN TRUE THEN 
        [(STRUCT("REJECTION_RULE" AS mdmStage, CASE CONTAINS_SUBSTR(stg.name, 'H')
                                                WHEN TRUE THEN "qa work as H"
                                                          ELSE "qa work as I" 
                                               END 
                                               AS mdmErrorMsg, TRUE AS mdmActive))]
     ELSE []
  END
    AS mdmErrors
    --metadata--
from stg_ds167311_emitente_1 as stg
WHERE stg.name IS NOT NULL