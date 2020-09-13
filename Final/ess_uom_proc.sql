CREATE OR REPLACE PROCEDURE ess_uom_proc(p_use_in_recon_flag          IN  VARCHAR2
                                        ,p_line_level_item_id         IN  mtl_system_items_b.inventory_item_id%TYPE
                                        ,p_plant_id                   IN  mtl_system_items_b.organization_id%TYPE
                                        ,p_header_level_item_id       IN  mtl_system_items_b.inventory_item_id%TYPE
                                        ,p_header_level_uom_class     IN  mtl_uom_conversions.uom_class%TYPE
                                        ,p_output                     OUT SYS_REFCURSOR
                                         )
AS
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_uom_proc                                                                             *
*                                                                                                        *
* DESCRIPTION  : Procedure to return UOM data (This procedure is used in BOM Form)                       *
*                                                                                                        *
* AUTHOR       : Bhavendra Raghuwanshi                                                                   *
* DATE WRITTEN : 09-SEP-2020                                                                             *
*                                                                                                        *
* CHANGE CONTROL :                                                                                       *
* Version#     |   Ticket #        | WHO                     |  DATE           |   REMARKS               *
*--------------------------------------------------------------------------------------------------------*
* 1.0.0        |   xxx             | Bhavendra Raghuwanshi   | 09-SEP-2020     | Initial Creation        *
*                                                                                                        *
*********************************************************************************************************/
/* $Header: apps.ess_uom_proc.sql 1.0.0 09-SEP-2020 04:38:09 PM Bhavendra Raghuwanshi $                 */
/********************************************************************************************************/
-- PROCEDURE ess_uom_proc
/********************************************************************************************************/
        v_line_level_uom_class             mtl_uom_conversions.uom_class%TYPE;
        v_header_level_uom_class           mtl_uom_conversions.uom_class%TYPE := p_header_level_uom_class;
        v_inventory_item_id                mtl_uom_conversions.inventory_item_id%TYPE :=0;

        -- Error Log parameters
        v_source            ess_sql_error_log.source%TYPE:='ess_uom_proc';
        v_debug_print_flag  VARCHAR2(10) :='N';
        v_parameter_string  ess_sql_error_log.parameter_values%TYPE:='PARAM->'
                                                                       ||' '||p_use_in_recon_flag
                                                                       ||','||p_line_level_item_id
                                                                       ||','||p_plant_id
                                                                       ||','||p_header_level_item_id
                                                                       ||','||p_header_level_uom_class;

BEGIN
        -- Query to get Line Level UOM class
        SELECT  u.uom_class
        INTO    v_line_level_uom_class
        FROM    mtl_uom_conversions u
               ,mtl_system_items_b i
        WHERE   1=1
        AND     i.inventory_item_id = p_line_level_item_id
        AND     i.organization_id   = p_plant_id
        AND     u.uom_code          = i.primary_uom_code
        AND     u.inventory_item_id = v_inventory_item_id;

        IF UPPER(p_use_in_recon_flag) = 'N'
        THEN
                --ess_log_message(v_source,SQLCODE||' '||SQLERRM,'TESTING-1',v_debug_print_flag);
                ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-1',v_debug_print_flag);
                OPEN p_output
                FOR
                SELECT  uom_code
                       ,unit_of_measure
                       ,uom_class
                       ,u.inventory_item_id
                FROM    mtl_uom_conversions u
                       ,mtl_system_items_b i
                WHERE  1=1
                AND    i.inventory_item_id = p_line_level_item_id
                AND    i.organization_id   = p_plant_id
                AND    u.uom_code          = i.primary_uom_code
                AND    u.inventory_item_id = v_inventory_item_id;

        ELSIF   UPPER(p_use_in_recon_flag)     = 'Y'
        THEN
                ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-2',v_debug_print_flag);
                IF v_line_level_uom_class = v_header_level_uom_class
                THEN
                        ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-3',v_debug_print_flag);
                        OPEN p_output
                        FOR
                        SELECT  uom_code
                               ,unit_of_measure
                               ,uom_class
                               ,inventory_item_id
                        FROM    mtl_uom_conversions
                        WHERE   1=1
                        AND     (inventory_item_id  = v_inventory_item_id OR inventory_item_id = p_line_level_item_id)
                        AND      uom_class IN (SELECT  uom_class
                                               FROM    mtl_uom_conversions u
                                                      ,mtl_system_items_b  i
                                               WHERE   1=1
                                               AND     i.inventory_item_id = p_line_level_item_id
                                               AND     i.organization_id   = p_plant_id
                                               AND     u.uom_code          = i.primary_uom_code
                                               AND     u.inventory_item_id = v_inventory_item_id);
                ELSE
                        ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'TESTING-4',v_debug_print_flag);
                        OPEN p_output
                        FOR
                        SELECT  uom_code
                               ,unit_of_measure
                               ,uom_class
                               ,inventory_item_id
                        FROM    mtl_uom_conversions
                        WHERE   1=1
                        AND     (inventory_item_id  = v_inventory_item_id) OR( inventory_item_id = p_line_level_item_id)
                        AND     uom_class IN (SELECT  uom_class
                                              FROM    mtl_uom_conversions u
                                                     ,mtl_system_items_b i
                                              WHERE   1=1
                                              AND     i.inventory_item_id = p_line_level_item_id
                                              AND     i.organization_id   = p_plant_id
                                              AND     u.uom_code          = i.primary_uom_code
                                              AND     u.inventory_item_id = v_inventory_item_id
                                              )
                        UNION
                        SELECT  uom_code
                               ,unit_of_measure
                               ,uom_class
                               ,inventory_item_id
                        FROM    mtl_uom_conversions
                        WHERE   1=1
                        AND     (inventory_item_id  = v_inventory_item_id OR inventory_item_id = p_header_level_item_id)
                        AND     uom_class IN (SELECT  uom_class
                                              FROM    mtl_uom_conversions u
                                                     ,mtl_system_items_b  i
                                              WHERE   1=1
                                              AND     i.inventory_item_id = p_line_level_item_id
                                              AND     i.organization_id   = p_plant_id
                                              AND     u.uom_code          = i.primary_uom_code
                                              AND     u.inventory_item_id = v_inventory_item_id
                                              );
                END IF;
        END IF;
EXCEPTION WHEN OTHERS
          THEN ess_log_message(v_source,v_parameter_string,SQLCODE||' '||SQLERRM,'ERROR',v_debug_print_flag);
END ess_uom_proc;
/
SHOW ERR;