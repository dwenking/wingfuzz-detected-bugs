CREATE TABLE v0 ( v1 TINYINT , b SMALLINT , v2 MEDIUMINT , d INT , v3
BIGINT PRIMARY KEY REFERENCES v0 ) ;
INSERT INTO v0 VALUES ( 87 , 59 , 11 , 2147483647 , 3 ) ;
INSERT INTO v0 VALUES ( -1 , 83 , 70 , -128 , 29 ) ;
SELECT ( AVG ( v2 ) OVER ( PARTITION BY v1 , v2 ORDER BY v2) , v2 ) IN (
SELECT v2 AS v4 , v2 AS v5 FROM v0 WHERE v3 > 69 GROUP BY v1 , v1 ) FROM
v0 WINDOW x AS ( ORDER BY v1 RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING )
ORDER BY v3 ;

/*
stack_bottom = 7fffcc510c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned
long)+0x41) [0x2158f91]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xff5d92]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xff5f45]
/lib64/libpthread.so.0(+0x12d40) [0x7ffff7bc0d40]
/usr/sbin/mysqld() [0x213e2a0]
/usr/sbin/mysqld(Item_sum_avg::val_decimal(my_decimal*)+0x565)
[0x122b1d5]
/usr/sbin/mysqld(Item_ref::val_decimal(my_decimal*)+0x23) [0x1131533]
/usr/sbin/mysqld(Item_cache_decimal::cache_value()+0x38) [0x1136018]
/usr/sbin/mysqld(Item_cache_row::cache_value()+0xbb) [0x1131c4b]
/usr/sbin/mysqld(Item_in_optimizer::val_int()+0x49) [0x1156919]
/usr/sbin/mysqld(Item::save_in_field_inner(Field*, bool)+0x13a)
[0x113383a]
/usr/sbin/mysqld(copy_funcs(Temp_table_param*, THD const*,
Copy_func_type)+0x65) [0xe3d615]
/usr/sbin/mysqld(BufferingWindowIterator::Read()+0x173) [0x13ed123]
/usr/sbin/mysqld(MaterializeIterator<DummyIteratorProfiler>::Materialize
QueryBlock(materialize_iterator::QueryBlock const&, unsigned long
long*)+0x112) [0x13dfed2]
/usr/sbin/mysqld(MaterializeIterator<DummyIteratorProfiler>::Init()+0x34
3) [0x13e0ed3]
/usr/sbin/mysqld(filesort(THD*, Filesort*, RowIterator*, unsigned long,
unsigned long long, Filesort_info*, Sort_result*, unsigned long
long*)+0x220) [0x10f34a0]
/usr/sbin/mysqld(SortingIterator::DoSort()+0x70) [0x1257fa0]
/usr/sbin/mysqld(SortingIterator::Init()+0x34) [0x1258034]
/usr/sbin/mysqld(Query_expression::ExecuteIteratorQuery(THD*)+0x268)
[0xf5cbd8]
/usr/sbin/mysqld(Query_expression::execute(THD*)+0x30) [0xf5cfd0]
/usr/sbin/mysqld(Sql_cmd_dml::execute(THD*)+0x1e4) [0xee7314]
/usr/sbin/mysqld(mysql_execute_command(THD*, bool)+0xae5) [0xe82fb5]
/usr/sbin/mysqld(dispatch_sql_command(THD*, Parser_state*)+0x51b)
[0xe8696b]
/usr/sbin/mysqld(dispatch_command(THD*, COM_DATA const*,
enum_server_command)+0xe5e) [0xe87dbe]
/usr/sbin/mysqld(do_command(THD*)+0x15b) [0xe89d6b]
/usr/sbin/mysqld() [0xfe5fa8]
/usr/sbin/mysqld() [0x286ec74]
/lib64/libpthread.so.0(+0x81da) [0x7ffff7bb61da]
/lib64/libc.so.6(clone+0x43) [0x7ffff6165e73]
Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7fff7c2b5740): SELECT ( AVG ( v2 ) OVER ( PARTITION BY v1 , v2
ORDER BY v2) , v2 ) IN ( SELECT v2 AS v4 , v2 AS v5 FROM v0 WHERE v3 >
69 GROUP BY v1 , v1 ) FROM v0 WINDOW x AS ( ORDER BY v1 RANGE BETWEEN 1
PRECEDING AND 1 PRECEDING ) ORDER BY v3
Connection ID (thread ID): 8
Status: NOT_KILLED
The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html
contains
information that should help you find out what is causing the crash.
*/
