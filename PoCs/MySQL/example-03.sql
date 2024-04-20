CREATE TEMPORARY TABLE IF NOT EXISTS v0 ( v1 FLOAT UNIQUE ) ;
 INSERT INTO v0 ( ) VALUES ( 55 ) , ( 19 ) ;
 INSERT INTO v0 VALUES ( NULL ) ;
 ( SELECT v1 FROM v0 ) ORDER BY AVG ( v1 * -128 ) OVER ( PARTITION BY v1 ) ;

/*
stack_bottom = 7f18283f1c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2123181]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xfe6a12]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xfe6bc5]
/lib64/libpthread.so.0(+0x12d40) [0x7f1842798d40]
/usr/sbin/mysqld(Item_sum_avg::val_real()+0xa5) [0x12138c5]
/usr/sbin/mysqld(Sort_param::make_sortkey(Bounds_checked_array<unsigned char>, Mem_root_array<TABLE*> const&, unsigned long*)+0x312) [0x10dd1d2]
/usr/sbin/mysqld() [0x10dddaa]
/usr/sbin/mysqld(filesort(THD*, Filesort*, RowIterator*, unsigned long, unsigned long long, Filesort_info*, Sort_result*, unsigned long long*)+0xb5d) [0x10e06ad]
/usr/sbin/mysqld(SortingIterator::DoSort()+0x70) [0x123fd90]
/usr/sbin/mysqld(SortingIterator::Init()+0x34) [0x123fe24]
/usr/sbin/mysqld(Query_expression::ExecuteIteratorQuery(THD*)+0x268) [0xf51498]
/usr/sbin/mysqld(Query_expression::execute(THD*)+0x30) [0xf51890]
/usr/sbin/mysqld(Sql_cmd_dml::execute(THD*)+0x187) [0xedb4b7]
/usr/sbin/mysqld(mysql_execute_command(THD*, bool)+0xae7) [0xe781f7]
/usr/sbin/mysqld(dispatch_sql_command(THD*, Parser_state*)+0x51b) [0xe7b9eb]
/usr/sbin/mysqld(dispatch_command(THD*, COM_DATA const*, enum_server_command)+0x233d) [0xe7e31d]
/usr/sbin/mysqld(do_command(THD*)+0x15b) [0xe7eeab]
/usr/sbin/mysqld() [0xfd6c18]
/usr/sbin/mysqld() [0x2832314]
/lib64/libpthread.so.0(+0x81da) [0x7f184278e1da]
/lib64/libc.so.6(clone+0x43) [0x7f1840d3de73]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7f17ac178dc0): ( SELECT v1 FROM v0 ) ORDER BY AVG ( v1 * -128 ) OVER ( PARTITION BY v1 )
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
