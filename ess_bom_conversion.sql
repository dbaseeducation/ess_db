CLEAR SCREEN;
CREATE OR REPLACE PACKAGE ess_bom_conversion
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_bom_conversion                                                                       *
*                                                                                                        *
* DESCRIPTION  : This is a utility package of ESS application, it containg general utility database      *
*                objects                                                                                 *
*                                                                                                        *
* AUTHOR       : Bhavendra Raghuwanshi                                                                   *
* DATE WRITTEN : 11-SEP-2020                                                                             *
*                                                                                                        *
* CHANGE CONTROL :                                                                                       *
* Version#     |   Ticket #        | WHO                     |  DATE           |   REMARKS               *
*--------------------------------------------------------------------------------------------------------*
* 1.0.0        |   xxx             | Bhavendra Raghuwanshi   | 11-SEP-2020     | Initial Creation        *
*                                                                                                        *
*********************************************************************************************************/
/* $Header: apps.ess_log_message.sql 1.0.0 11-SEP-2020 11:48:10 AM Bhavendra Raghuwanshi $              */
/********************************************************************************************************/
-- PACKAGE ess_log_message
/********************************************************************************************************/
AS
        FUNCTION ess_bom_generic_conversion(p_plant_id           IN NUMBER
                                           ,p_uom_issue          IN VARCHAR2
                                           ,p_issue_quantity     IN NUMBER
                                           ,p_recon_qty          IN NUMBER
                                           ,p_inventory_item_id  IN NUMBER
                                           )
        RETURN NUMBER;

END ess_bom_conversion;
/
SHOW ERR;

CREATE OR REPLACE PACKAGE BODY ess_bom_conversion
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_bom_conversion                                                                       *
*                                                                                                        *
* DESCRIPTION  : This is a utility package of ESS application, it containg general utility database      *
*                objects                                                                                 *
*                                                                                                        *
* AUTHOR       : Bhavendra Raghuwanshi                                                                   *
* DATE WRITTEN : 11-SEP-2020                                                                             *
*                                                                                                        *
* CHANGE CONTROL :                                                                                       *
* Version#     |   Ticket #        | WHO                     |  DATE           |   REMARKS               *
*--------------------------------------------------------------------------------------------------------*
* 1.0.0        |   xxx             | Bhavendra Raghuwanshi   | 11-SEP-2020     | Initial Creation        *
*                                                                                                        *
*********************************************************************************************************/
/* $Header: apps.ess_bom_conversion.sql 1.0.0 11-SEP-2020 11:48:10 AM Bhavendra Raghuwanshi $           */
/********************************************************************************************************/
-- PACKAGE ess_bom_conversion
/********************************************************************************************************/
AS
        FUNCTION ess_bom_generic_conversion(p_plant_id           IN NUMBER
                                           ,p_uom_issue          IN VARCHAR2
                                           ,p_issue_quantity     IN NUMBER
                                           ,p_recon_qty          IN NUMBER
                                           ,p_inventory_item_id  IN NUMBER
                                           )
        RETURN NUMBER
        AS
                v_generic_conversion       NUMBER(10);

                -- Error Log parameters
                v_source            ess_sql_error_log.source%TYPE:='ess_bom_conversion.ess_bom_generic_conversion';
                v_debug_print_flag  VARCHAR2(10) :='N';
                v_parameter_string  ess_sql_error_log.parameter_values%TYPE:='PARAM->'
                                                                       ||' '||p_plant_id
                                                                       ||','||p_uom_issue
                                                                       ||','||p_issue_quantity
                                                                       ||','||p_recon_qty
                                                                       ||','||p_inventory_item_id;
        BEGIN
        ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-1',v_debug_print_flag);

        -- Get driver quantity
        -- chk wether driver type is I/O

        RETURN v_generic_conversion;

        EXCEPTION WHEN OTHERS
                  THEN ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-1',v_debug_print_flag);
        END;
END ess_bom_conversion;
/
SHOW ERR;