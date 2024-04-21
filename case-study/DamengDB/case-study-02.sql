
CREATE TABLE t1 (c1 INT);
CREATE VIEW v1 AS SELECT * FROM t1 WITH CHECK OPTION;
CREATE VIEW v2 AS SELECT * FROM v1 WITH CHECK OPTION;
INSERT INTO v2 VALUES (15);

/*
#0  0x0000000001696ac7 in assert_fun ()
#1  0x00000000016af990 in sigterm_handler ()
#2  <signal handler called>
#3  0x0000000000e37822 in phb_nblk_nbexp ()
#4  0x0000000000e38c24 in phb_insert ()
#5  0x0000000000e39143 in phb_real_sql ()
#6  0x0000000000e39424 in phb_main ()
#7  0x00000000016dd224 in ntsk_process_prepare_low2 ()
#8  0x00000000016ddc2d in ntsk_process_prepare_low ()
#9  0x00000000016dded8 in ntsk_process_prepare_and_exec ()
#10 0x00000000016efa29 in ntsk_process_cop ()
#11 0x00000000015c43f6 in uthr_db_main_for_sess ()
#12 0x00007fd0984c3e65 in start_thread () from /lib64/libpthread.so.0
#13 0x00007fd0979df88d in clone () from /lib64/libc.so.6
*/
