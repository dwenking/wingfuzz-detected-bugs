
create table t1 (id text, val text);
ANALYZE TABLE t1 UPDATE HISTOGRAM ON id USING DATA '{""buckets"": [[4, 0.25], [12, 0.5], [23, 0.625], [52, 0.75]], ""null-values"": 0.25, ""collation-id"": 8, ""sampling-rate"": 1.0, ""histogram-type"": ""singleton"", ""number-of-buckets-specified"": 4}';

/*
stack_bottom = 7fffcc510c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2158f91]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xff5d92]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xff5f45]
/lib64/libpthread.so.0(+0x12d40) [0x7ffff7bc0d40]
/usr/sbin/mysqld(free_blob_buffers_and_reset(TABLE*, unsigned int)+0x77) [0xf91e37]
/usr/sbin/mysqld(close_thread_table(THD*, TABLE**)+0xfb) [0xdddecb]
/usr/sbin/mysqld(close_thread_tables(THD*)+0x2bb) [0xdde1eb]
/usr/sbin/mysqld(Sql_cmd_analyze_table::handle_histogram_command_inner(THD*, Table_ref*, std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, histograms::Message, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, Stateless_allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, histograms::Message>, histograms::Histogram_psi_key_alloc, My_free_functor> >&)+0x55e) [0x1374a8e]
/usr/sbin/mysqld(Sql_cmd_analyze_table::handle_histogram_command(THD*, Table_ref*)+0x5a) [0x137828a]
/usr/sbin/mysqld(Sql_cmd_analyze_table::execute(THD*)+0xee) [0x137840e]
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
Query (7fff602ca9f0): ANALYZE TABLE t1 UPDATE HISTOGRAM ON id USING DATA '{"buckets": [[4, 0.25], [12, 0.5], [23, 0.625], [52, 0.75]], "null-values": 0.25, "collation-id": 8, "sampling-rate": 1.0, "histogram-type": "singleton", "number-of-buckets-specified": 4}'
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
