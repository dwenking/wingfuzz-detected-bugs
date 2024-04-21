CREATE TABLE t1 (c_int INTEGER, c_char VARCHAR);
INSERT INTO t1 VALUES (3, '4'), (2, '4');
CREATE TABLE t2 (c_int INTEGER);
WITH X1 AS (SELECT * FROM t2), c_int AS (WITH t2 AS (SELECT * FROM t1) SELECT * FROM X1) SELECT * FROM c_int;

/*
#0  0x0000000001696ac7 in assert_fun ()
#1  0x00000000016af990 in sigterm_handler ()
#2  <signal handler called>
#3  0x000000000114c7f6 in nset2_set_row_data_into_buf_new_struct ()
#4  0x000000000114cb24 in nset2_set_rows_into_msg ()
#5  0x000000000114cfdd in nset2_build_rs_msg ()
#6  0x000000000114d111 in nset2_build_msg ()
#7  0x000000000114d29d in nset2_exec_after_fetch ()
#8  0x000000000114d688 in nset2_exec ()
#9  0x00000000011e40dc in vm_run_low ()
#10 0x00000000011e4491 in vm_run ()
#11 0x00000000011e565b in vm_run_pln_low ()
#12 0x00000000011e5828 in vm_run_pln ()
#13 0x00000000016d9fe8 in ntsk_process_exec_low ()
#14 0x00000000016dde80 in ntsk_process_prepare_and_exec ()
#15 0x00000000016efa29 in ntsk_process_cop ()
#16 0x00000000015c43f6 in uthr_db_main_for_sess ()
#17 0x00007f717fee4e65 in start_thread () from /lib64/libpthread.so.0
#18 0x00007f717f40088d in clone () from /lib64/libc.so.6
*/
