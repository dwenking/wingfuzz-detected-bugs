SELECT * FROM ( SELECT 1 AS t , 2 AS x UNION SELECT 1 AS t , 4 AS x ) ss WHERE ( SELECT - - 1 
UNION SELECT NULL INTERSECT SELECT x WHERE x NOT IN ( 1 ) AND ( 1.000000 BETWEEN x AND x ) AND 
x LIKE 'x' GROUP BY ( x , 'x' , 'x' , 'x' ) ) > x ;


/*
#0 0x707c18 (dm_sys_halt_low_inner+0x128)
#1 0x15903f9 (ncmp_g_dec_exec+0x129)
#2 0x16ac3ff (vm_nexp_run_low+0x26f)
#3 0x16acde3 (vm_nexp_run_ign_cancel+0xd3)
#4 0x166f58a (slct2_flt_calc+0x2a)
#5 0x16707e4 (slct2_exec_start+0x154)
#6 0x1670b08 (slct2_exec+0x118)
#7 0x16ae3dd (vm_run_low+0x2dd)
#8 0x16ae900 (vm_run+0x40)
#9 0x16af9fb (vm_run_pln_low+0x20b)
#10 0x16afc2c (vm_run_pln+0x1c)
#11 0x1c184ea (ntsk_process_exec_low+0x27a)
#12 0x1c1cfe0 (ntsk_process_prepare_and_exec+0x170)
#13 0x1c31f78 (ntsk_process_cop+0x1328)
#14 0x1ad0674 (uthr_db_main_for_sess+0x374)
#15 0x7f43c7398609 (start_thread+0xd9)
#16 0x7f43c6f86133 (clone+0x43)
*/
