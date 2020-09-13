SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ess_purge_log_message

/********************************************************************************************************/
-- PROCEDURE ess_purge_log_message
/********************************************************************************************************/
AS

BEGIN

	--DELETE FROM ess_sql_error_log;
	DELETE FROM ess_sql_error where log_time_stamp < TRUNC(sysdate)-1;

COMMIT;
END ess_purge_log_message;
/


COMMIT;
