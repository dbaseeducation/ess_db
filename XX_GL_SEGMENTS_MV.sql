DROP MATERIALIZED VIEW APPS.XX_GL_SEGMENTS_MV;
CREATE MATERIALIZED VIEW APPS.XX_GL_SEGMENTS_MV 
NOCOMPRESS
NOPARALLEL
BUILD IMMEDIATE
REFRESH COMPLETE
START WITH TO_DATE('10-09-2020 01:30:00','dd-mm-yyyy hh24:mi:ss')
NEXT (SYSDATE+(1/288))         
WITH PRIMARY KEY
AS 
SELECT  fss.segment_name
       ,fq.application_column_name
       ,fss.flex_value_set_id
FROM    apps.fnd_id_flex_segments          fss
       ,apps.fnd_id_flex_structures        fsr
       ,apps.gl_ledgers                    gl
       ,apps.fnd_segment_attribute_values  fq
WHERE   1=1
AND     fq.application_id           = 101
AND     fq.id_flex_code             = 'GL#'
AND     fq.segment_attribute_type   = 'GL_ACCOUNT'
AND     fq.attribute_value          = 'Y'
AND     fq.id_flex_num              =  fss.id_flex_num
AND     fsr.id_flex_num             = gl.chart_of_accounts_id
AND     fsr.id_flex_code            = fss.id_flex_code
AND     fsr.id_flex_num             = fss.id_flex_num
AND     fsr.id_flex_code            = 'GL#'
AND     gl.ledger_id                = 1    -- Bhavendra use 1 for testing
AND     fsr.application_id          = 101
AND     fss.application_column_name = fq.application_column_name;