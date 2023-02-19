--PUNTO 1 DE LA PRACTICA

CREATE OR REPLACE TABLE keepcoding.ivr_detail AS

WITH modu
      AS (SELECT * 
        FROM keepcoding.ivr_modules
     )
    , st
      AS (SELECT * 
        FROM keepcoding.ivr_steps
     )

SELECT ivr_calls.ivr_id AS calls_ivr_id
      , ivr_calls.phone_number AS calls_phone_number
      , ivr_calls.ivr_result AS calls_ivr_result
      , ivr_calls.vdn_label AS calls_vdn_label
      , ivr_calls.start_date AS calls_start_date
      , FORMAT_DATE('%Y%m%d', ivr_calls.start_date) AS calls_start_date_id
      , ivr_calls.end_date AS calls_end_date
      , FORMAT_DATE('%Y%m%d', ivr_calls.end_date) AS calls_end_date_id
      , ivr_calls.total_duration AS calls_total_duration
      , ivr_calls.customer_segment AS calls_customer_segment
      , ivr_calls.ivr_language AS calls_ivr_language
      , ivr_calls.steps_module AS calls_steps_module
      , ivr_calls.module_aggregation AS calls_module_aggregation
      , modu.module_sequece
      , modu.module_name 
      , modu.module_duration 
      , modu.module_result
      , st.step_sequence
      , st.step_name
      , st.step_result
      , st.step_description_error
      , st.document_type
      , st.document_identification

  FROM keepcoding.ivr_calls
  JOIN modu
  ON ivr_calls.ivr_id = modu.ivr_id
  JOIN st
  ON ivr_calls.ivr_id = st.ivr_id;
 
--PUNTO 2 DE LA PRACTICA

CREATE OR REPLACE TABLE keepcoding.ivr_summary AS

SELECT ivr_detail.calls_ivr_id
      , ivr_detail.calls_phone_number
      , ivr_detail.module_result
      
  FROM keepcoding.ivr_detail
--- estoy bloqueado y ya no recuerdo ni lo que tenía claro que entendía, auquqe está mal e incompleto lo presento y lo intentaré mas adelante

--PUNTO 3 DE LA PRACTICA

CREATE OR REPLACE FUNCTION keepcoding.clean_integer(entero INT64) RETURNS INT64
    AS ((
        SELECT IF(entero IS NULL, -999999, entero)
        ));

