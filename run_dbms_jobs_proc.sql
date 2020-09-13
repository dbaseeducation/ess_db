var job number

DECLARE

	X NUMBER;

BEGIN
	SYS.DBMS_JOB.SUBMIT
	(
	job => :job
	,what => 'BEGIN ess_purge_log_message; end;'
	,next_date => SYSDATE
	,interval => 'TRUNC(SYSDATE) + 1 + 1/24'
	,no_parse => FALSE
	);

END;
/
print job;

REM select job, schema_user, last_date, next_date, interval, what from dba_jobs;



REM begin
REM DBMS_JOB.REMOVE(24803);
REM end;


REM exec dbms_job.run(24805);