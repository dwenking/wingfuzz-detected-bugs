WITH RECURSIVE x ( x ) AS ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT x + 1 FROM x WHERE x < 1 ) SELECT * FROM x WHERE x % 1.000000 * x BETWEEN 1.000000 * 1.000000 * 1.000000 * 1.000000 AND 1 GROUP BY x HAVING x + ( 1 * x ) + ( 1 * x ) + 1 UNION SELECT 'x' FROM x WHERE ( x IN ( SELECT x FROM x ) AND x IN ( SELECT * FROM x WHERE ( 'x' LIKE x OR x LIKE 'x' ) ) ) AND ( select 1 , 1 , 1 ) IN ( ( 1 , NULL , 1 ) , ( 1 , 1 , 1 ) , ( 1 , 1 , 1 ) ) GROUP BY x HAVING x + ( 1 * x ) + ( 1 % 1.000000 * x BETWEEN 1.000000 * 1.000000 * 1.000000 * 1.000000 AND 1 ) + 1 ORDER BY 1 DESC ) SELECT * FROM x WHERE x IN ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT 1 UNION SELECT 1 UNION SELECT 1 INTERSECT SELECT 1 UNION SELECT 1 UNION SELECT 1 UNION SELECT 1 UNION SELECT 1 ) SELECT 'x' LIKE 'x' FROM x WHERE x NOT IN ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT 1 GROUP BY ( SELECT 1 UNION SELECT x + 1 ) > 1 ) SELECT * FROM x WHERE ( NOT ( x < 1 ) AND NOT ( 1 > 1 ) ) IN ( SELECT 'x' LIKE 'x' FROM x WHERE x IN ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT 1 GROUP BY ( SELECT 1 UNION SELECT x ORDER BY ( SELECT x + 1 ) > 1 ) ) SELECT * FROM x WHERE x IN ( SELECT ( SELECT 'x' ) FROM x WHERE ( ( SELECT 1 FROM x ) IN ( SELECT 1 FROM x GROUP BY x HAVING x > 1 ) ) - ( 1 ) IN ( WITH RECURSIVE x AS ( SELECT 1 UNION SELECT x + 1 FROM x WHERE 1 + 1 < - 1 ) SELECT * FROM x WHERE x = ( SELECT x FROM x ) GROUP BY ( SELECT 1 UNION SELECT x ORDER BY ( SELECT x + 1 ) > 1 ) ) ) ) ) ) );

/*
stack_bottom = 7fffcc510c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2158f91]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xff5d92]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xff5f45]
/lib64/libpthread.so.0(+0x12d40) [0x7ffff7bc0d40]
/usr/sbin/mysqld(Item_singlerow_subselect::val_str(String*)+0x55) [0x1211b35]
/usr/sbin/mysqld(Item::evaluate(THD*, String*)+0x67) [0x1148577]
/usr/sbin/mysqld(Item::update_null_value()+0x72) [0x11486f2]
/usr/sbin/mysqld(Item_subselect::is_null()+0x15) [0x120fbf5]
/usr/sbin/mysqld(in_row::find_item(Item*)+0x3d) [0x1157f3d]
/usr/sbin/mysqld(Item_func_in::val_int()+0x41) [0x116aa61]
/usr/sbin/mysqld(Item::val_bool()+0xcc) [0x11325dc]
/usr/sbin/mysqld(eval_const_cond(THD*, Item*, bool*)+0x1d) [0x11b77fd]
/usr/sbin/mysqld(remove_eq_conds(THD*, Item*, Item**, Item::cond_result*)+0x34f) [0xe6a36f]
/usr/sbin/mysqld(remove_eq_conds(THD*, Item*, Item**, Item::cond_result*)+0xe6) [0xe6a106]
/usr/sbin/mysqld(optimize_cond(THD*, Item**, COND_EQUAL**, mem_root_deque<Table_ref*>*, Item::cond_result*)+0x1c8) [0xe750d8]
/usr/sbin/mysqld(JOIN::optimize(bool)+0x78c) [0xe796fc]
/usr/sbin/mysqld(Query_block::optimize(THD*, bool)+0xc1) [0xedd021]
/usr/sbin/mysqld(Query_expression::optimize(THD*, TABLE*, bool, bool)+0xad) [0xf5ba7d]
/usr/sbin/mysqld(Table_ref::optimize_derived(THD*)+0x43) [0x138b8b3]
/usr/sbin/mysqld(JOIN::optimize(bool)+0x3d3) [0xe79343]
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
Query (7fff6000d480): WITH RECURSIVE x ( x ) AS ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT x + 1 FROM x WHERE x < 1 ) SELECT * FROM x WHERE x % 1.000000 * x BETWEEN 1.000000 * 1.000000 * 1.000000 * 1.000000 AND 1 GROUP BY x HAVING x + ( 1 * x ) + ( 1 * x ) + 1 UNION SELECT 'x' FROM x WHERE ( x IN ( SELECT x FROM x ) AND x IN ( SELECT * FROM x WHERE ( 'x' LIKE x OR x LIKE 'x' ) ) ) AND ( select 1 , 1 , 1 ) IN ( ( 1 , NULL , 1 ) , ( 1 , 1 , 1 ) , ( 1 , 1 , 1 ) ) GROUP BY x HAVING x + ( 1 * x ) + ( 1 % 1.000000 * x BETWEEN 1.000000 * 1.000000 * 1.000000 * 1.000000 AND 1 ) + 1 ORDER BY 1 DESC ) SELECT * FROM x WHERE x IN ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT 1 UNION SELECT 1 UNION SELECT 1 INTERSECT SELECT 1 UNION SELECT 1 UNION SELECT 1 UNION SELECT 1 UNION SELECT 1 ) SELECT 'x' LIKE 'x' FROM x WHERE x NOT IN ( WITH RECURSIVE x ( x ) AS ( SELECT 1 UNION SELECT 1 GROUP BY ( SELECT 1 UNION SELECT x + 1 ) > 1 ) SELECT * FROM x WHERE ( NOT ( x < 1 ) AND NOT ( 1 > 1 ) ) IN ( SELECT 'x' LIKE 'x' FROM x WHERE x IN ( W
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
