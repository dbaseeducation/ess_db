SET SERVEROUTPUT ON;
DECLARE
	   v_trx    NUMBER(10); 
BEGIN
  v_trx := ess_alternate_id_f('Input','63');
  DBMS_OUTPUT.PUT_LINE(v_trx);
END;
/