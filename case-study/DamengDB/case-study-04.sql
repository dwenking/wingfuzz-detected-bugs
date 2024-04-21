SELECT nth_value ( 'This' , 1125899906842624.000000 ) OVER ( ORDER BY 1 ) ;

/*
#0 0x834234 (bdta3_get_str+0x34)
#1 0x17427ba (afun_group_data_get_nth_row+0x11a)
#2 0x17445ac (afun_calc_nth_value+0x3fc)
#3 0x1745f0e (afun_exec_fill_data_for_nth_value+0x2ee)
#4 0x1746429 (afun_exe_fill_data_low+0x349)
#5 0x174acce (afun_exec_no_po+0xde)
#6 0x175a920 (afun_exec+0x1b0)
#7 0x16ae3dd (vm_run_low+0x2dd)
#8 0x16ae900 (vm_run+0x40)
#9 0x16af9fb (vm_run_pln_low+0x20b)
#10 0x16afc2c (vm_run_pln+0x1c)
#11 0x1c184ea (ntsk_process_exec_low+0x27a)
#12 0x1c1cfe0 (ntsk_process_prepare_and_exec+0x170)
#13 0x1c31f78 (ntsk_process_cop+0x1328)
#14 0x1ad0674 (uthr_db_main_for_sess+0x374)
#15 0x7fefe31ed609 (start_thread+0xd9)
#16 0x7fefe2ddb133 (clone+0x43)
*/
