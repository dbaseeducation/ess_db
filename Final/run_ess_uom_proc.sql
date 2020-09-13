SET SERVEROUTPUT ON;
variable rc refcursor;
BEGIN
        ess_uom_proc(p_use_in_recon_flag       => 'Y'
                    ,p_line_level_item_id      => '211'
                    ,p_plant_id                => '204'
                    ,p_header_level_item_id    => '63'
                    ,p_header_level_uom_class  => 'Quantity'
                    ,p_output                  => :rc 
                    );
END;
/
print rc;
