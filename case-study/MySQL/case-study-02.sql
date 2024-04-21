CREATE TABLE t2(c CHAR(3) CHARACTER SET UTF8) ROW_FORMAT=REDUNDANT ENGINE=InnoDB;
INSERT INTO t2 VALUES(1);
ALTER TABLE t2 CONVERT TO CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_520_CI;

/*
stack_bottom = 7f71dc40fc10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2123181]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xfe6a12]
/usr/sbin/mysqld(my_server_abort()+0x75) [0xfe6c55]
/usr/sbin/mysqld(my_abort()+0xe) [0x211d00e]
/usr/sbin/mysqld(ut_dbg_assertion_failed(char const*, char const*, unsigned long)+0x309) [0x2369cd9]
/usr/sbin/mysqld(ddl::Builder::copy_columns(ddl::Copy_ctx&, unsigned long&, unsigned long&)+0x626) [0x255f4f6]
/usr/sbin/mysqld(ddl::Builder::copy_row(ddl::Copy_ctx&, unsigned long&)+0xde) [0x255f69e]
/usr/sbin/mysqld(ddl::Builder::add_to_key_buffer(ddl::Copy_ctx&, unsigned long&)+0x26) [0x255f966]
/usr/sbin/mysqld(ddl::Builder::bulk_add_row(ddl::Cursor&, ddl::Row&, unsigned long, std::function<dberr_t ()>&&)+0xf8) [0x2564de8]
/usr/sbin/mysqld(ddl::Builder::add_row(ddl::Cursor&, ddl::Row&, unsigned long, std::function<dberr_t ()>&&)+0xc5) [0x2565535]
/usr/sbin/mysqld() [0x24b5174]
/usr/sbin/mysqld() [0x24b54c9]
/usr/sbin/mysqld(Parallel_reader::Ctx::traverse_recs(PCursor*, mtr_t*)+0x508) [0x22cc6a8]
/usr/sbin/mysqld(Parallel_reader::Ctx::traverse()+0x148) [0x22cc938]
/usr/sbin/mysqld(Parallel_reader::worker(Parallel_reader::Thread_ctx*)+0x248) [0x22d2a78]
/usr/sbin/mysqld(Parallel_reader::spawn(unsigned long)+0x24) [0x22d3434]
/usr/sbin/mysqld(Parallel_reader::run(unsigned long)+0x36) [0x22d34c6]
/usr/sbin/mysqld(ddl::Parallel_cursor::scan(std::vector<ddl::Builder*, ut::allocator<ddl::Builder*, ut::detail::allocator_base_pfs<ddl::Builder*> > >&)+0xa2b) [0x24b6dab]
/usr/sbin/mysqld(ddl::Loader::scan_and_build_indexes()+0xd2) [0x24b2872]
/usr/sbin/mysqld(ddl::Loader::build_all()+0xf0) [0x24b29b0]
/usr/sbin/mysqld(ddl::Context::build()+0x38) [0x24a68b8]
/usr/sbin/mysqld(bool ha_innobase::inplace_alter_table_impl<dd::Table>(TABLE*, Alter_inplace_info*)+0x4bc) [0x21a623c]
/usr/sbin/mysqld(ha_innobase::inplace_alter_table(TABLE*, Alter_inplace_info*, dd::Table const*, dd::Table*)+0x51) [0x21a6581]
/usr/sbin/mysqld() [0xf1d13d]
/usr/sbin/mysqld(mysql_alter_table(THD*, char const*, char const*, HA_CREATE_INFO*, Table_ref*, Alter_info*)+0x2e59) [0xf30a39]
/usr/sbin/mysqld(Sql_cmd_alter_table::execute(THD*)+0x44c) [0x1350f0c]
/usr/sbin/mysqld(mysql_execute_command(THD*, bool)+0xae7) [0xe781f7]
/usr/sbin/mysqld(Prepared_statement::execute(THD*, String*, bool)+0x5c0) [0xea6360]
/usr/sbin/mysqld(Prepared_statement::execute_loop(THD*, String*, bool)+0x12d) [0xeab03d]
/usr/sbin/mysqld(mysqld_stmt_execute(THD*, Prepared_statement*, bool, unsigned long, PS_PARAM*)+0x1c4) [0xeab6a4]
/usr/sbin/mysqld(dispatch_command(THD*, COM_DATA const*, enum_server_command)+0x1033) [0xe7d013]
/usr/sbin/mysqld(do_command(THD*)+0x15b) [0xe7eeab]
/usr/sbin/mysqld() [0xfd6c18]
/usr/sbin/mysqld() [0x2832314]
/lib64/libpthread.so.0(+0x81da) [0x7f7207a271da]
/lib64/libc.so.6(clone+0x43) [0x7f7205fd5e73]
 
Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7f71680ddac0): ALTER TABLE t2 CONVERT TO CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_520_CI
Connection ID (thread ID): 9
Status: NOT_KILLED
 
The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
