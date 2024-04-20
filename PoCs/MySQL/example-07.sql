SET optimizer_switch = 'subquery_to_derived=on' ; 
CREATE TABLE v0 ( v1 INT ) ; 
CREATE TABLE v2 ( v3 INT ) ;
INSERT INTO v2 VALUES ( 1 ) , ( ( SELECT v1 FROM v0 WHERE v1 = 'x' AND v1 NOT IN 
( NULL , NULL IN ( 'x' , 'x' , 'x' , 'x' , 'x' , 'x' , 'x' , 'x' , ( SELECT ( 1 + 1 ) UNION SELECT 1 ) ) ) ) IN 
( SELECT v1 FROM v0 WHERE x IN ( WITH RECURSIVE x ( x ) AS ( SELECT NULL UNION SELECT x + 1 FROM x ) 
SELECT ( SELECT DISTINCT x FROM x WHERE ( x , x ) IN ( ( 1 , NULL ) ) ) FROM x WHERE ( WITH x AS ( SELECT 1 FROM x ) 
SELECT 1 WHERE ( x = 1 OR x = 1 ) AND x = 'x' AND ( 1 , 1 ) = 
( SELECT 1 , 1 FROM x WHERE 1 = 1 WINDOW x AS ( PARTITION BY NULL , NULL ORDER BY NULL ASC ) ) AND x = x AND x = x AND x = x AND x = x ) ) ) ) ;

/*
stack_bottom = 7fffcc510c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2158f91]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xff5d92]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xff5f45]
/lib64/libpthread.so.0(+0x12d40) [0x7ffff7bc0d40]
/usr/sbin/mysqld(Item_singlerow_subselect::collect_scalar_subqueries(unsigned char*)+0x150) [0x121cc50]
/usr/sbin/mysqld(Item_subselect::walk(bool (Item::*)(unsigned char*), enum_walk, unsigned char*)+0x4a) [0x120fc5a]
/usr/sbin/mysqld(Item_func::walk(bool (Item::*)(unsigned char*), enum_walk, unsigned char*)+0x93) [0x11a7603]
/usr/sbin/mysqld(Item_cond::walk(bool (Item::*)(unsigned char*), enum_walk, unsigned char*)+0x75) [0x11546c5]
/usr/sbin/mysqld(Query_block::supported_correlated_scalar_subquery(THD*, Item::Css_info*, Item**)+0x4af) [0xecbd6f]
/usr/sbin/mysqld(Query_block::transform_scalar_subqueries_to_join_with_derived(THD*)+0x6f0) [0xed3780]
/usr/sbin/mysqld(Query_block::prepare(THD*, mem_root_deque<Item*>*)+0xe1d) [0xed48bd]
/usr/sbin/mysqld(Query_expression::prepare(THD*, Query_result*, mem_root_deque<Item*>*, unsigned long long, unsigned long long)+0x17d) [0xf5f18d]
/usr/sbin/mysqld(Item_subselect::fix_fields(THD*, Item**)+0x6d) [0x1213ebd]
/usr/sbin/mysqld(Item_exists_subselect::fix_fields(THD*, Item**)+0xd1) [0x1215801]
/usr/sbin/mysqld(Query_block::setup_conds(THD*)+0x7a) [0xebfe0a]
/usr/sbin/mysqld(Query_block::prepare(THD*, mem_root_deque<Item*>*)+0x3b2) [0xed3e52]
/usr/sbin/mysqld(Query_expression::prepare(THD*, Query_result*, mem_root_deque<Item*>*, unsigned long long, unsigned long long)+0x17d) [0xf5f18d]
/usr/sbin/mysqld(Item_subselect::fix_fields(THD*, Item**)+0x6d) [0x1213ebd]
/usr/sbin/mysqld(Item_exists_subselect::fix_fields(THD*, Item**)+0xd1) [0x1215801]
/usr/sbin/mysqld(setup_fields(THD*, unsigned long, bool, bool, bool, mem_root_deque<Item*> const*, mem_root_deque<Item*>*, Bounds_checked_array<Item*>)+0x21a) [0xdd9e6a]
/usr/sbin/mysqld(Sql_cmd_insert_base::prepare_inner(THD*)+0x350) [0x139c5f0]
/usr/sbin/mysqld(Sql_cmd_dml::prepare(THD*)+0x24e) [0xedb65e]
/usr/sbin/mysqld(Sql_cmd_dml::execute(THD*)+0xfc) [0xee722c]
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
Query (7fff742c9310): INSERT INTO v2 VALUES ( 1 ) , ( ( SELECT v1 FROM v0 WHERE v1 = 'x' AND v1 NOT IN  ( NULL , NULL IN ( 'x' , 'x' , 'x' , 'x' , 'x' , 'x' , 'x' , 'x' , ( SELECT ( 1 + 1 ) UNION SELECT 1 ) ) ) ) IN  ( SELECT v1 FROM v0 WHERE x IN ( WITH RECURSIVE x ( x ) AS ( SELECT NULL UNION SELECT x + 1 FROM x )  SELECT ( SELECT DISTINCT x FROM x WHERE ( x , x ) IN ( ( 1 , NULL ) ) ) FROM x WHERE ( WITH x AS ( SELECT 1 FROM x )  SELECT 1 WHERE ( x = 1 OR x = 1 ) AND x = 'x' AND ( 1 , 1 ) =  ( SELECT 1 , 1 FROM x WHERE 1 = 1 WINDOW x AS ( PARTITION BY NULL , NULL ORDER BY NULL ASC ) ) AND x = x AND x = x AND x = x AND x = x ) ) ) )
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
