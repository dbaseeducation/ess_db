DROP SEQUENCE ess_log_id_seq;
CREATE SEQUENCE ess_log_id_seq
START WITH  1
NOCACHE
NOCYCLE;

DROP TABLE ess_sql_error_log;
CREATE TABLE ess_sql_error_log(log_id                 NUMBER(10)  PRIMARY KEY
                              ,source                 VARCHAR2(50)
			      ,parameter_values       VARCHAR2(1000)
                              ,debug_message          VARCHAR2(1000)
                              ,entry_type             VARCHAR2(100)
                              ,log_time_stamp         DATE
                              ,created_by             VARCHAR2(100)
                              );