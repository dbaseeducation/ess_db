SET SERVEROUTPUT ON;
DECLARE
	v_result NUMBER(10);
BEGIN

        v_result := ess_bom_conversion.ess_bom_generic_conversion(p_plant_id           =>  1
                                                                 ,p_uom_issue          =>  1
                                                                 ,p_issue_quantity     =>  1
                                                                 ,p_recon_qty          =>  1
                                                                 ,p_inventory_item_id  =>  1
                                                                  );
	DBMS_OUTPUT.PUT_LINE(v_result);
END;
/