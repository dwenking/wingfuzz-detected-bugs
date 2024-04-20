WITH RECURSIVE x ( x ) AS ( SELECT ( SELECT 'x' ) ) SELECT * FROM x WHERE x IN ( WITH RECURSIVE x AS ( SELECT 1 UNION SELECT 'x' GROUP BY x HAVING x > 1 ORDER BY 1 DESC , x , x , x ) SELECT ( SELECT DISTINCT x FROM x WHERE x NOT IN ( WITH x AS ( SELECT 1 FROM x ) SELECT * FROM x WHERE x = ( x = 1 AND x != 1 ) AND ( x , x ) NOT IN ( ( 1 , 1 ) , ( 1 , 1 ) ) AND x = x ) ) FROM x WHERE x NOT IN ( SELECT * FROM x WHERE x LIKE 'x' AND x IN ( SELECT DISTINCT x FROM x WHERE ( 'x' ) ) AND NOT ( SELECT x + 1 FROM x GROUP BY x NOT IN ( SELECT x + 1 FROM x ) ) ) GROUP BY x HAVING 1.000000 / 1.000000 + 1 ) ; 

/*
stack_bottom = 7fffcc510c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2158f91]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xff5d92]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xff5f45]
/lib64/libpthread.so.0(+0x12d40) [0x7ffff7bc0d40]
/usr/sbin/mysqld(Query_expression::num_visible_fields() const+0x32) [0xf5c862]
/usr/sbin/mysqld(Item_singlerow_subselect::result_type() const+0x36) [0x12108f6]
/usr/sbin/mysqld(types_allow_materialization(Item*, Item*)+0x20) [0xedc250]
/usr/sbin/mysqld() [0xe68b50]
/usr/sbin/mysqld(JOIN::make_join_plan()+0x10d0) [0xe786c0]
/usr/sbin/mysqld(JOIN::optimize(bool)+0xfc5) [0xe79f35]
/usr/sbin/mysqld(Query_block::optimize(THD*, bool)+0xc1) [0xedd021]
/usr/sbin/mysqld(Query_expression::optimize(THD*, TABLE*, bool, bool)+0xad) [0xf5ba7d]
/usr/sbin/mysqld(Item_subselect::exec(THD*)+0x268) [0x12127a8]
/usr/sbin/mysqld(Item_in_subselect::val_bool_naked()+0x38) [0x1215ba8]
/usr/sbin/mysqld(Item_in_optimizer::val_int()+0x198) [0x1156a68]
/usr/sbin/mysqld() [0xe6c531]
/usr/sbin/mysqld(JOIN::optimize(bool)+0x12bd) [0xe7a22d]
/usr/sbin/mysqld(Query_block::optimize(THD*, bool)+0xc1) [0xedd021]
/usr/sbin/mysqld(Query_expression::optimize(THD*, TABLE*, bool, bool)+0xad) [0xf5ba7d]
/usr/sbin/mysqld(Sql_cmd_dml::execute_inner(THD*)+0x34) [0xedbf44]
/usr/sbin/mysqld(Sql_cmd_dml::execute(THD*)+0x1e4) [0xee7314]
/usr/sbin/mysqld(mysql_execute_command(THD*, bool)+0xae5) [0xe82fb5]
/usr/sbin/mysqld(dispatch_sql_command(THD*, Parser_state*)+0x51b) [0xe8696b]
/usr/sbin/mysqld(dispatch_command(THD*, COM_DATA const*, enum_server_command)+0xe5e) [0xe87dbe]
/usr/sbin/mysqld(do_command(THD*)+0x15b) [0xe89d6b]
/usr/sbin/mysqld() [0xfe5fa8]
/usr/sbin/mysqld() [0x286ec74]
/lib64/libpthread.so.0(+0x81da) [0x7ffff7bb61da]
/lib64/libc.so.6(clone+0x43) [0x7ffff6165e73]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7fff7c00d4a0): WITH RECURSIVE x ( x ) AS ( SELECT ( SELECT 'x' ) ) SELECT * FROM x WHERE x IN ( WITH RECURSIVE x AS ( SELECT 1 UNION SELECT 'x' GROUP BY x HAVING x > 1 ORDER BY 1 DESC , x , x , x ) SELECT ( SELECT DISTINCT x FROM x WHERE x NOT IN ( WITH x AS ( SELECT 1 FROM x ) SELECT * FROM x WHERE x = ( x = 1 AND x != 1 ) AND ( x , x ) NOT IN ( ( 1 , 1 ) , ( 1 , 1 ) ) AND x = x ) ) FROM x WHERE x NOT IN ( SELECT * FROM x WHERE x LIKE 'x' AND x IN ( SELECT DISTINCT x FROM x WHERE ( 'x' ) ) AND NOT ( SELECT x + 1 FROM x GROUP BY x NOT IN ( SELECT x + 1 FROM x ) ) ) GROUP BY x HAVING 1.000000 / 1.000000 + 1 )
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
