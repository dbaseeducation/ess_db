CREATE OR REPLACE PACKAGE ess_mfg_bom_pkg
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_mfg_bom_pkg                                                                          *
*                                                                                                        *
* DESCRIPTION  : Package specification of ess_mfg_bom_pkg package                                        *
*                                                                                                        *
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
/* $Header: apps.ess_mfg_bom_pkg.sql 1.0.0 12-SEP-2020 05:09:10 AM Bhavendra Raghuwanshi $              */
/********************************************************************************************************/
-- PACKAGE ess_mfg_bom_pkg
/********************************************************************************************************/
AS
        PROCEDURE ess_save_bom(p_version_no          ess_mfg_bom.version_no%TYPE
                              ,p_plant_id            ess_mfg_bom.plant_id%TYPE
                              ,p_status              ess_mfg_bom.status%TYPE
                              ,p_bill_type           ess_mfg_bom.bill_type%TYPE
                              ,p_process_name        ess_mfg_bom.process_name%TYPE
                              ,p_core_product_type   ess_mfg_bom.core_product_type%TYPE
                              ,p_driver_uom          ess_mfg_bom.driver_uom%TYPE
                              ,p_driver_qty          ess_mfg_bom.driver_qty%TYPE
                              ,p_use_in_planning     ess_mfg_bom.use_in_planning%TYPE
                              ,p_start_date          ess_mfg_bom.start_date%TYPE
                              ,p_end_date            ess_mfg_bom.end_date%TYPE
                              ,p_created_by          ess_mfg_bom.created_by%TYPE
                              --,created_on          ess_mfg_bom.created_on%TYPE
                              ,p_last_updated_by     ess_mfg_bom.last_updated_by%TYPE
                              --,last_updated_on     ess_mfg_bom.last_updated_on
                              ,p_active_flag         ess_mfg_bom.active_flag%TYPE
                              ,p_core_product_id     ess_mfg_bom.core_product_id%TYPE
                              ,p_alternate_id        ess_mfg_bom.alternate_id%TYPE
                              ,p_recon_uom           ess_mfg_bom.recon_uom%TYPE
                              ,p_std_batch_qty         ess_mfg_bom.std_batch_qty%TYPE
                              );
        PROCEDURE ess_save_batch(p_batch_no         IN   ess_mfg_batch.batch_no%TYPE
                                ,p_batch_date       IN   ess_mfg_batch.batch_date%TYPE
                                ,p_current_status   IN   ess_mfg_batch.current_status%TYPE
                                ,p_next_status      IN   ess_mfg_batch.next_status%TYPE
                                ,p_bill_id          IN   ess_mfg_batch.bill_id%TYPE
                                ,p_version_no       IN   ess_mfg_batch.version_no%TYPE
                                ,p_plant_id         IN   ess_mfg_batch.plant_id%TYPE
                                ,p_driver_uom       IN   ess_mfg_batch.driver_uom%TYPE
                                ,p_driver_qty       IN   ess_mfg_batch.driver_qty%TYPE
                                ,p_created_by       IN   ess_mfg_batch.created_by%TYPE
                                --,p_created_on      IN    ess_mfg_batch.%TYPE
                                ,p_last_updated_by  IN   ess_mfg_batch.last_updated_by%TYPE
                                --,p_last_updated_on IN    ess_mfg_batch.%TYPE
                                );
        PROCEDURE ess_update_bom(p_version_no        ess_mfg_bom.version_no%TYPE
                                ,p_plant_id          ess_mfg_bom.plant_id%TYPE
                                ,p_status            ess_mfg_bom.status%TYPE
                                ,p_bill_type         ess_mfg_bom.bill_type%TYPE
                                ,p_process_name      ess_mfg_bom.process_name%TYPE
                                ,p_core_product_type ess_mfg_bom.core_product_type%TYPE
                                ,p_driver_uom        ess_mfg_bom.driver_uom%TYPE
                                ,p_driver_qty        ess_mfg_bom.driver_qty%TYPE
                                ,p_use_in_planning   ess_mfg_bom.use_in_planning%TYPE
                                ,p_start_date        ess_mfg_bom.start_date%TYPE
                                ,p_end_date          ess_mfg_bom.end_date%TYPE
                                ,p_last_updated_by   ess_mfg_bom.last_updated_by%TYPE
                                --,last_updated_on   ess_mfg_bom.last_updated_on%TYPE
                                ,p_core_product_id   ess_mfg_bom.core_product_id%TYPE
                                ,p_alternate_id      ess_mfg_bom.alternate_id%TYPE
                                ,p_recon_uom         ess_mfg_bom.recon_uom%TYPE
                                ,p_bill_id           ess_mfg_bom.bill_id%TYPE
                                );

END ess_mfg_bom_pkg;
/

CREATE OR REPLACE PACKAGE BODY ess_mfg_bom_pkg
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_mfg_bom_pkg                                                                          *
*                                                                                                        *
* DESCRIPTION  : Package body of ess_mfg_bom_pkg package                                                 *
*                                                                                                        *
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
/* $Header: apps.ess_mfg_bom_pkg.sql 1.0.0 12-SEP-2020 05:09:10 AM Bhavendra Raghuwanshi $              */
/********************************************************************************************************/
-- PACKAGE BODY ess_mfg_bom_pkg
/********************************************************************************************************/
AS
        PROCEDURE ess_save_bom(p_version_no          ess_mfg_bom.version_no%TYPE
                              ,p_plant_id            ess_mfg_bom.plant_id%TYPE
                              ,p_status              ess_mfg_bom.status%TYPE
                              ,p_bill_type           ess_mfg_bom.bill_type%TYPE
                              ,p_process_name        ess_mfg_bom.process_name%TYPE
                              ,p_core_product_type   ess_mfg_bom.core_product_type%TYPE
                              ,p_driver_uom          ess_mfg_bom.driver_uom%TYPE
                              ,p_driver_qty          ess_mfg_bom.driver_qty%TYPE
                              ,p_use_in_planning     ess_mfg_bom.use_in_planning%TYPE
                              ,p_start_date          ess_mfg_bom.start_date%TYPE
                              ,p_end_date            ess_mfg_bom.end_date%TYPE
                              ,p_created_by          ess_mfg_bom.created_by%TYPE
                              --,created_on
                              ,p_last_updated_by     ess_mfg_bom.last_updated_by%TYPE
                              --,last_updated_on     ess_mfg_bom.last_updated_on
                              ,p_active_flag         ess_mfg_bom.active_flag%TYPE
                              ,p_core_product_id     ess_mfg_bom.core_product_id%TYPE
                              ,p_alternate_id        ess_mfg_bom.alternate_id%TYPE
                              ,p_recon_uom           ess_mfg_bom.recon_uom%TYPE
                              ,p_std_batch_qty       ess_mfg_bom.std_batch_qty%TYPE
                              )
        AS
                v_version_no          ess_mfg_bom.version_no%TYPE        := p_version_no;
                v_plant_id            ess_mfg_bom.plant_id%TYPE          := p_plant_id;
                v_status              ess_mfg_bom.status%TYPE            := p_status;
                v_bill_type           ess_mfg_bom.bill_type%TYPE         := p_bill_type;
                v_process_name        ess_mfg_bom.process_name%TYPE      := p_process_name;
                v_core_product_type   ess_mfg_bom.core_product_type%TYPE := p_core_product_type;
                v_driver_uom          ess_mfg_bom.driver_uom%TYPE        := p_driver_uom;
                v_driver_qty          ess_mfg_bom.driver_qty%TYPE        := p_driver_qty;
                v_use_in_planning     ess_mfg_bom.use_in_planning%TYPE   := p_use_in_planning;
                v_start_date          ess_mfg_bom.start_date%TYPE        := p_start_date;
                v_end_date            ess_mfg_bom.end_date%TYPE          := p_end_date;
                v_created_by          ess_mfg_bom.created_by%TYPE        := p_created_by;
                --,created_on
                v_last_updated_by     ess_mfg_bom.last_updated_by%TYPE   := p_last_updated_by;
                --,last_updated_on     ess_mfg_bom.last_updated_on
                v_active_flag         ess_mfg_bom.active_flag%TYPE       := p_active_flag;
                v_core_product_id     ess_mfg_bom.core_product_id%TYPE   := p_core_product_id;
                v_alternate_id        ess_mfg_bom.alternate_id%TYPE      := p_alternate_id;
                v_recon_uom           ess_mfg_bom.recon_uom%TYPE         := p_recon_uom;
                v_std_batch_qty       ess_mfg_bom.std_batch_qty%TYPE     := p_std_batch_qty;

                -- Error Log parameters
                v_source            ess_sql_error_log.source%TYPE:='ess_mfg_bom_pkg.ess_save_bom';
                v_debug_print_flag  VARCHAR2(10) :='N';
                v_parameter_string  ess_sql_error_log.parameter_values%TYPE := NULL;

        BEGIN

                INSERT INTO ess_mfg_bom(bill_id
                                       ,version_no
                                       ,plant_id
                                       ,status
                                       ,bill_type
                                       ,process_name
                                       ,core_product_type
                                       ,driver_uom
                                       ,driver_qty
                                       ,use_in_planning
                                       ,start_date
                                       ,end_date
                                       ,created_by
                                       ,created_on
                                       ,last_updated_by
                                       ,last_updated_on
                                       ,active_flag
                                       ,core_product_id
                                       ,alternate_id
                                       ,recon_uom
                                       ,std_batch_qty
                                       )
                VALUES                 (ess_mfg_bom_bill_id_s.NEXTVAL
                                       ,v_version_no
                                       ,v_plant_id
                                       ,v_status
                                       ,v_bill_type
                                       ,v_process_name
                                       ,v_core_product_type
                                       ,v_driver_uom
                                       ,v_driver_qty
                                       ,v_use_in_planning
                                       ,v_start_date
                                       ,v_end_date
                                       ,v_created_by
                                       ,SYSDATE
                                       ,v_last_updated_by
                                       ,SYSDATE
                                       ,v_active_flag
                                       ,v_core_product_id
                                       ,v_alternate_id
                                       ,v_recon_uom
                                       ,v_std_batch_qty
                                        );
                COMMIT;
        EXCEPTION WHEN  OTHERS
                  THEN  ess_log_message(v_source
                                       --,v_parameter_string
                                       ,SQLCODE||' '||SQLERRM
                                       ,'TESTING-1'
                                       ,v_debug_print_flag
                                       );
        END ess_save_bom;

        PROCEDURE ess_save_batch(p_batch_no         IN   ess_mfg_batch.batch_no%TYPE
                                ,p_batch_date       IN   ess_mfg_batch.batch_date%TYPE
                                ,p_current_status   IN   ess_mfg_batch.current_status%TYPE
                                ,p_next_status      IN   ess_mfg_batch.next_status%TYPE
                                ,p_bill_id          IN   ess_mfg_batch.bill_id%TYPE
                                ,p_version_no       IN   ess_mfg_batch.version_no%TYPE
                                ,p_plant_id         IN   ess_mfg_batch.plant_id%TYPE
                                ,p_driver_uom       IN   ess_mfg_batch.driver_uom%TYPE
                                ,p_driver_qty       IN   ess_mfg_batch.driver_qty%TYPE
                                ,p_created_by       IN   ess_mfg_batch.created_by%TYPE
                                --,p_created_on      IN    ess_mfg_batch.%TYPE
                                ,p_last_updated_by  IN   ess_mfg_batch.last_updated_by%TYPE
                                --,p_last_updated_on IN    ess_mfg_batch.%TYPE
                                )
        AS
                v_batch_no            ess_mfg_batch.batch_no%TYPE;
                v_batch_date          ess_mfg_batch.batch_date%TYPE;
                v_current_status      ess_mfg_batch.current_status%TYPE;
                v_next_status         ess_mfg_batch.next_status%TYPE;
                v_bill_id             ess_mfg_batch.bill_id%TYPE;
                v_version_no          ess_mfg_batch.version_no%TYPE;
                v_plant_id            ess_mfg_batch.plant_id%TYPE;
                v_driver_uom          ess_mfg_batch.driver_uom%TYPE;
                v_driver_qty          ess_mfg_batch.driver_qty%TYPE;
                v_created_by          ess_mfg_batch.created_by%TYPE;
                --v_created_on          ess_mfg_batch.%TYPE;
                v_last_updated_by     ess_mfg_batch.last_updated_by%TYPE;
                --v_last_updated_on     ess_mfg_batch.%TYPE;

                -- Error Log parameters
                v_source            ess_sql_error_log.source%TYPE:='ess_mfg_bom_pkg.ess_save_batch';
                v_debug_print_flag  VARCHAR2(10) :='N';
                v_parameter_string  ess_sql_error_log.parameter_values%TYPE := NULL;
        BEGIN

                INSERT INTO ess_mfg_batch(batch_no
                                         ,batch_date
                                         ,current_status
                                         ,next_status
                                         ,bill_id
                                         ,version_no
                                         ,plant_id
                                         ,driver_uom
                                         ,driver_qty
                                         ,created_by
                                         ,created_on
                                         ,last_updated_by
                                         ,last_updated_on
                                         )
                VALUES                   (v_batch_no
                                         ,v_batch_date
                                         ,v_current_status
                                         ,v_next_status
                                         ,v_bill_id
                                         ,v_version_no
                                         ,v_plant_id
                                         ,v_driver_uom
                                         ,v_driver_qty
                                         ,v_created_by
                                         ,SYSDATE
                                         ,v_last_updated_by
                                         ,SYSDATE
                                         );
                COMMIT;
        EXCEPTION WHEN  OTHERS
                  THEN  ess_log_message(v_source
                                       --,v_parameter_string
                                       ,SQLCODE||' '||SQLERRM
                                       ,'TESTING-1'
                                       ,v_debug_print_flag
                                       );
        END ess_save_batch;

        PROCEDURE ess_update_bom(p_version_no        ess_mfg_bom.version_no%TYPE
                                ,p_plant_id          ess_mfg_bom.plant_id%TYPE
                                ,p_status            ess_mfg_bom.status%TYPE
                                ,p_bill_type         ess_mfg_bom.bill_type%TYPE
                                ,p_process_name      ess_mfg_bom.process_name%TYPE
                                ,p_core_product_type ess_mfg_bom.core_product_type%TYPE
                                ,p_driver_uom        ess_mfg_bom.driver_uom%TYPE
                                ,p_driver_qty        ess_mfg_bom.driver_qty%TYPE
                                ,p_use_in_planning   ess_mfg_bom.use_in_planning%TYPE
                                ,p_start_date        ess_mfg_bom.start_date%TYPE
                                ,p_end_date          ess_mfg_bom.end_date%TYPE
                                ,p_last_updated_by   ess_mfg_bom.last_updated_by%TYPE
                                --,last_updated_on   ess_mfg_bom.last_updated_on%TYPE
                                ,p_core_product_id   ess_mfg_bom.core_product_id%TYPE
                                ,p_alternate_id      ess_mfg_bom.alternate_id%TYPE
                                ,p_recon_uom         ess_mfg_bom.recon_uom%TYPE
                                ,p_bill_id           ess_mfg_bom.bill_id%TYPE
                                )
        AS
                v_version_no        ess_mfg_bom.version_no%TYPE         := p_version_no;
                v_plant_id          ess_mfg_bom.plant_id%TYPE           := p_plant_id;
                v_status            ess_mfg_bom.status%TYPE             := p_status;
                v_bill_type         ess_mfg_bom.bill_type%TYPE          := p_bill_type;
                v_process_name      ess_mfg_bom.process_name%TYPE       := p_process_name;
                v_core_product_type ess_mfg_bom.core_product_type%TYPE  := p_core_product_type;
                v_driver_uom        ess_mfg_bom.driver_uom%TYPE         := p_driver_uom;
                v_driver_qty        ess_mfg_bom.driver_qty%TYPE         := p_driver_qty;
                v_use_in_planning   ess_mfg_bom.use_in_planning%TYPE    := p_use_in_planning;
                v_start_date        ess_mfg_bom.start_date%TYPE         := p_start_date;
                v_end_date          ess_mfg_bom.end_date%TYPE           := p_end_date;
                v_last_updated_by   ess_mfg_bom.last_updated_by%TYPE    := p_last_updated_by;
                --,last_updated_on   ess_mfg_bom.last_updated_on%TYPE
                v_core_product_id   ess_mfg_bom.core_product_id%TYPE    := p_core_product_id;
                v_alternate_id      ess_mfg_bom.alternate_id%TYPE       := p_alternate_id;
                v_recon_uom         ess_mfg_bom.recon_uom%TYPE          := p_recon_uom;

                -- Error Log parameters
                v_source            ess_sql_error_log.source%TYPE:='ess_mfg_bom_pkg.ess_save_bom';
                v_debug_print_flag  VARCHAR2(10) :='N';
                v_parameter_string  ess_sql_error_log.parameter_values%TYPE := NULL;

        BEGIN
                UPDATE  ess_mfg_bom 
                SET     version_no        =  v_version_no
                       ,plant_id          =  v_plant_id
                       ,status            =  v_status
                       ,bill_type         =  v_bill_type
                       ,process_name      =  v_process_name
                       ,core_product_type =  v_core_product_type
                       ,driver_uom        =  v_driver_uom
                       ,driver_qty        =  v_driver_qty
                       ,use_in_planning   =  v_use_in_planning
                       ,start_date        =  v_start_date
                       ,end_date          =  v_end_date
                       ,last_updated_by   =  v_last_updated_by
                       ,last_updated_on   =  SYSDATE
                       ,core_product_id   =  v_core_product_id
                       ,alternate_id      =  v_alternate_id
                       ,recon_uom         =  v_recon_uom 
                WHERE   bill_id           =  p_bill_id;

                COMMIT;
        EXCEPTION WHEN  OTHERS
                  THEN  ess_log_message(v_source
                                       --,v_parameter_string
                                       ,SQLCODE||' '||SQLERRM
                                       ,'TESTING-1'
                                       ,v_debug_print_flag
                                       );
        END ess_update_bom;
END ess_mfg_bom_pkg;
/
SHOW ERR;