SELECT FROM_UNIXTIME ( COALESCE ( 'GEOMETRYCOLLECTION(POINT(2 2),POINT(3 3))' ) OVER 
( PARTITION BY x ORDER BY 4000 ) RESPECT NULLS OVER ( ) , REPLACE ( '2001-9-11' ) ) GROUP BY x ;


/*
#0 0x11cf813 (pha_nexp_is_include_grouping+0x13)
#1 0x11cfa6c (pha_nexp_is_include_grouping+0x26c)
#2 0x11cfc0c (pha_nexp_is_include_grouping+0x40c)
#3 0x112496f (pha_check_nexp_grouping_valid+0x7f)
#4 0x1145436 (pha_group_null+0x46)
#5 0x115b3a8 (pha_query_exp+0x478)
#6 0x115b904 (pha_subquery_recursively+0x104)
#7 0x115c0a0 (pha_subquery_low+0x60)
#8 0x115d071 (pha_select_low+0x1b1)
#9 0x1162560 (pha_select2+0x90)
#10 0x1162e4f (pha_single_sql+0x7ff)
#11 0x11633e9 (pha_main_low+0x299)
#12 0x11636a6 (pha_main+0x16)
#13 0x1c19d79 (ntsk_pha_main+0x39)
#14 0x1c1ba3b (ntsk_process_prepare_low2+0x68b)
#15 0x1c1cd74 (ntsk_process_prepare_low+0x344)
#16 0x1c1d038 (ntsk_process_prepare_and_exec+0x1c8)
#17 0x1c31f78 (ntsk_process_cop+0x1328)
#18 0x1ad0674 (uthr_db_main_for_sess+0x374)
#19 0x7f17e5eb9609 (start_thread+0xd9)
#20 0x7f17e5aa7133 (clone+0x43)
*/
