SELECT ALL CASE WHEN ( SELECT x UNION SELECT * WHERE ( SELECT NULL ORDER BY x + 1 LIKE ( SELECT 
CAST ( 1 AS CHAR ) ) - ( SELECT x FROM ( SELECT x * x GROUP BY x HAVING x = 'x' ORDER BY 1 IN 
( SELECT NULL WHERE FALSE ) ASC ) WHERE ( x , x , x ) NOT IN ( ( 'x' , 'x' , 'x' ) , ( 1 , 1 , 
1 ) ) ) ) > CASE 1 - ( 1 + 1 ) WHEN CASE WHEN x >= x THEN 1 ELSE 1 END THEN 'x' END ) = 1 - ( 1 
+ 1 ) THEN x WHEN x = x THEN x ELSE x END FROM ( SELECT 1 AS x , 1 AS y UNION SELECT 1 AS p , 3 
AS q UNION SELECT 1 AS a , 5 AS b ) AS subquery ORDER BY x / 1 LIMIT 1 ; 


/*
#0 0x11eb38a (nsels_find_col_sym+0x1a)
#1 0x11eb3b7 (nsels_find_col_sym+0x47)
#2 0x11eb4c5 (nsel_node_remove_ref_tv_recursively+0x65)
#3 0x11eb541 (nsel_node_remove_ref_tv_recursively+0xe1)
#4 0x11eb541 (nsel_node_remove_ref_tv_recursively+0xe1)
#5 0x11eb6b7 (nsel_node_remove_ref_tv_of_orderby+0xa7)
#6 0x112832a (pha_opt_selitem_const_if_necessary+0x1ca)
#7 0x115d30e (pha_select_low+0x44e)
#8 0x122a18f (pha_nexp_query_exp+0xef)
#9 0x11ff177 (pha_nexp+0x207)
#10 0x11be18a (pha_nbexp_ops_exp+0x3a)
#11 0x11b3b1e (pha_nbexp+0x27e)
#12 0x1144b1b (pha_where_clause_null+0x9b)
#13 0x115b385 (pha_query_exp+0x455)
#14 0x115b904 (pha_subquery_recursively+0x104)
#15 0x115bab2 (pha_subquery_recursively+0x2b2)
#16 0x115c0a0 (pha_subquery_low+0x60)
#17 0x115d071 (pha_select_low+0x1b1)
#18 0x122a18f (pha_nexp_query_exp+0xef)
#19 0x11ff177 (pha_nexp+0x207)
#20 0x11be18a (pha_nbexp_ops_exp+0x3a)
#21 0x11b3b1e (pha_nbexp+0x27e)
#22 0x12181f4 (pha_get_ret_ntype_for_bool_case+0x64)
#23 0x12185b6 (pha_bool_case+0x36)
#24 0x11ff9e8 (pha_nexp+0xa78)
#25 0x11478f1 (pha_select_item_qaname+0xd1)
#26 0x114aaf2 (pha_select_item_list+0x62)
#27 0x115b471 (pha_query_exp+0x541)
#28 0x115b904 (pha_subquery_recursively+0x104)
#29 0x115c0a0 (pha_subquery_low+0x60)
#30 0x115d071 (pha_select_low+0x1b1)
#31 0x1162560 (pha_select2+0x90)
#32 0x1162e4f (pha_single_sql+0x7ff)
#33 0x11633e9 (pha_main_low+0x299)
#34 0x11636a6 (pha_main+0x16)
#35 0x1c19d79 (ntsk_pha_main+0x39)
#36 0x1c1ba3b (ntsk_process_prepare_low2+0x68b)
#37 0x1c1cd74 (ntsk_process_prepare_low+0x344)
#38 0x1c1d038 (ntsk_process_prepare_and_exec+0x1c8)
#39 0x1c31f78 (ntsk_process_cop+0x1328)
#40 0x1ad0674 (uthr_db_main_for_sess+0x374)
#41 0x7f3343317609 (start_thread+0xd9)
#42 0x7f3342f05133 (clone+0x43)
*/
