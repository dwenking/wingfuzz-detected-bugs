SELECT JSON_OBJECT ( '1.1e0' , UNHEX ( '1e100' ) ) ;

/*
#0 0x6dda4b (encoding_mblen+0x10b)
#1 0x22b899e (json_string_from_value_add_escape_for_mysql+0x19e)
#2 0x22ba593 (json_string_convert+0x2b3)
#3 0xc83437 (trv2_jsonb_name_to_json_string+0x77)
#4 0xc83aef (trv2_jsonb_value_to_json_string+0xef)
#5 0x1ecbe7f (ifun_to_jsonb_pg_by_value+0x19f)
#6 0x1ecc6ac (ifun_jsonb_object_pg_add_keyval+0xcc)
#7 0x1ecca5a (ifun_jsonb_object_pg_fun+0x2fa)
#8 0x15e3a8a (ninv_internal_exec+0xda)
#9 0x16ac3ff (vm_nexp_run_low+0x26f)
#10 0x1642c40 (prjt2_exec_after_fetch+0x1a0)
#11 0x1642d48 (prjt2_exec+0xb8)
#12 0x16ae3dd (vm_run_low+0x2dd)
#13 0x16ae900 (vm_run+0x40)
#14 0x16af9fb (vm_run_pln_low+0x20b)
#15 0x16afc2c (vm_run_pln+0x1c)
#16 0x1c184ea (ntsk_process_exec_low+0x27a)
#17 0x1c1cfe0 (ntsk_process_prepare_and_exec+0x170)
#18 0x1c31f78 (ntsk_process_cop+0x1328)
#19 0x1ad0674 (uthr_db_main_for_sess+0x374)
#20 0x7fc00c765609 (start_thread+0xd9)
#21 0x7fc00c353133 (clone+0x43)
*/