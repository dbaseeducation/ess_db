CREATE OR REPLACE PROCEDURE ess_log_message(p_source             IN VARCHAR2
                                           ,p_debug_message      IN VARCHAR2
                                           ,p_entry_type         IN VARCHAR2
                                           ,p_debug_print_flag   IN VARCHAR2 DEFAULT 'Y'
                                           )
/*********************************************************************************************************
*                                                                                                        *
* NAME :        ess_log_message                                                                          *
*                                                                                                        *
* DESCRIPTION  : This procedure is used to store the runtime errors of procedures/functions              *
*                in ess_sql_error_log table                                                              *
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
/* $Header: apps.ess_log_message.sql 1.0.0 09-SEP-2020 12:38:09 PM Bhavendra Raghuwanshi $              */
/********************************************************************************************************/
-- PROCEDURE ess_log_message
/********************************************************************************************************/
AS
  
BEGIN

        IF    p_debug_print_flag = 'Y'
        THEN  dbms_output.put_line (p_debug_message);
        END IF;

        INSERT INTO ess_sql_error_log(log_id
                                 ,source
                                 ,debug_message
                                 ,entry_type
                                 ,log_time_stamp
                                 ,created_by
                                 )
        VALUES                   (ess_log_id_seq.NEXTVAL
                                 ,p_source 
                                 ,p_debug_message
                                 ,p_entry_type
                                 ,SYSDATE
                                 ,USER
                                 );
	COMMIT;
END ess_log_message;
/