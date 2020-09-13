CREATE OR REPLACE PROCEDURE ess_uom_query_proc (p_inventory_item_id     IN  mtl_uom_conversions.inventory_item_id%TYPE
                                               ,p_plant_id              IN  mtl_system_items_b.organization_id%TYPE
                                               ,p_output                OUT SYS_REFCURSOR
                                               )
AS
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_uom_query_proc                                                                       *
*                                                                                                        *
* DESCRIPTION  : Package to return UOM data                                                              *
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
/* $Header: apps.ess_uom query_proc.sql 1.0.0 09-SEP-2020 12:38:09 PM Bhavendra Raghuwanshi $           */
/********************************************************************************************************/
-- PROCEDURE ess_uom query_proc
/********************************************************************************************************/
        
BEGIN
        OPEN p_output FOR 
        SELECT  uom_code
               ,unit_of_measure
               ,uom_class
               ,inventory_item_id
        FROM    mtl_uom_conversions
        WHERE   1=1
        AND     (inventory_item_id  = 0 OR inventory_item_id = 211)
        AND     uom_class IN (SELECT  uom_class
                              FROM   mtl_uom_conversions u
                                    ,mtl_system_items_b i
                              WHERE  1=1
                              AND    i.inventory_item_id = p_inventory_item_id 
                              AND    i.organization_id   = p_plant_id
                              AND    u.uom_code          = i.primary_uom_code
                              AND    u.inventory_item_id = 0
                              );
EXCEPTION WHEN OTHERS
          THEN DBMS_OUTPUT.PUT_LINE(SQLCODE||' '||SQLERRM);
END ess_uom_query_proc;
/
SHOW ERR;