CREATE OR REPLACE FUNCTION ess_alternate_id_f(p_c_product_type    IN ess_mfg_bom.core_product_type%TYPE
                                             ,p_c_product_id      IN ess_mfg_bom.core_product_id%TYPE
                                             )
RETURN NUMBER
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_alternate_id_f                                                                        *
*                                                                                                        *
* DESCRIPTION  : Function to return alternate_id (This function is used in BOM Form)                     *
*                                                                                                        *
* AUTHOR       : Bhavendra Raghuwanshi                                                                   *
* DATE WRITTEN : 10-SEP-2020                                                                             *
*                                                                                                        *
* CHANGE CONTROL :                                                                                       *
* Version#     |   Ticket #        | WHO                     |  DATE           |   REMARKS               *
*--------------------------------------------------------------------------------------------------------*
* 1.0.0        |   xxx             | Bhavendra Raghuwanshi   | 10-SEP-2020     | Initial Creation        *
*                                                                                                        *
*********************************************************************************************************/
/* $Header: apps.ess_alternate_id_f.sql 1.0.0 10-SEP-2020 12:38:11 PM Bhavendra Raghuwanshi $            */
/********************************************************************************************************/
-- FUNCTION ess_alternate_id_f
/********************************************************************************************************/
AS
        v_abn   ess_mfg_bom.alternate_id%TYPE:=0;      

        -- Error Log parameters
        v_source            ess_sql_error_log.source%TYPE:='ess_alternate_id_f';
        v_debug_print_flag  VARCHAR2(10) :='N';
        v_parameter_string  ess_sql_error_log.parameter_values%TYPE:='PARAM->'
                                                                       ||' '||p_c_product_type
                                                                       ||','||p_c_product_id ;

BEGIN   
        ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-1',v_debug_print_flag);

        SELECT DECODE(MAX(alternate_id),NULL,0,MAX(alternate_id)+1)
        INTO   v_abn
        FROM   ess_mfg_bom
        WHERE  1=1
        AND    core_product_type = p_c_product_type
        AND    core_product_id   = p_c_product_id;        
        RETURN v_abn;

EXCEPTION WHEN NO_DATA_FOUND
THEN      DBMS_OUTPUT.PUT_LINE(SQLCODE||' '||SQLERRM);
          RETURN 0;
END ess_alternate_id_f;
/