SELECT MIN ( x ) OVER ( PARTITION BY x ORDER BY x IN ( SELECT x FROM ( SELECT 1 AS x , 1 AS x 
UNION SELECT 1 AS x , 1 AS x UNION SELECT 1 AS x , 1 AS x UNION SELECT 1 AS x , 1 AS x UNION 
SELECT ( 1 ) AS x , 1 AS x UNION SELECT ( 1 ) AS x , 1 AS x UNION SELECT ( 1 ) AS x , 1 AS x ) 
AS x ORDER BY x DESC LIMIT 1 ) ASC RANGE 1 PRECEDING ) FROM ( SELECT 1 AS x UNION ALL SELECT 
NULL ) AS d ORDER BY 1 ;


/*
#0 0x7fb198dffbee (__nss_database_lookup+0x2078e)
#1 0xef5ba7 (nbexp_is_strict_same_low+0x3d7)
#2 0xf39f16 (nexp_is_strict_same_low+0x6f6)
#3 0x1418eeb (rel_gen_prjt_find_new_exp_in_mapping_lst_with_pha+0x3b)
#4 0x141fd20 (rel_gen_prjt_crt_mapping_and_replace_exp_in_exp_lst_with_pha+0x50)
#5 0x1420009 (rel_analytic_fun_gen_prjt_build_exp_maping_lst_and_replace_exp+0x249)
#6 0x1421e0e (rel_analytic_fun_gen_prjt_if_necessary+0xde)
#7 0x1421ef7 (rel_analytic_fun+0x57)
#8 0x13fa7f5 (rel_from_nsel+0xba5)
#9 0x12854df (phb_select+0x6f)
#10 0x12857bd (phb_real_sql+0x1cd)
#11 0x1285bac (phb_main+0xec)
#12 0x1c1c1d3 (ntsk_process_prepare_low2+0xe23)
#13 0x1c1cd74 (ntsk_process_prepare_low+0x344)
#14 0x1c1d038 (ntsk_process_prepare_and_exec+0x1c8)
#15 0x1c31f78 (ntsk_process_cop+0x1328)
#16 0x1ad0674 (uthr_db_main_for_sess+0x374)
#17 0x7fb1991ad609 (start_thread+0xd9)
#18 0x7fb198d9b133 (clone+0x43)
*/
