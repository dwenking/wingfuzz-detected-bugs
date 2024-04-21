CREATE TABLE t1 (dummy VARCHAR(200), a TEXT, FULLTEXT (dummy,a));
ALTER TABLE t1 DISCARD TABLESPACE;
ALTER TABLE t1 DROP INDEX dummy;

/*
stack_bottom = 7f4a5c5f5c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2123181]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xfe6a12]
/usr/sbin/mysqld(my_server_abort()+0x75) [0xfe6c55]
/usr/sbin/mysqld(my_abort()+0xe) [0x211d00e]
/usr/sbin/mysqld(ut_dbg_assertion_failed(char const*, char const*, unsigned long)+0x309) [0x2369cd9]
/usr/sbin/mysqld() [0x228a7ef]
/usr/sbin/mysqld(pars_update_statement(upd_node_t*, sym_node_t*, void*)+0x2d) [0x228ad0d]
/usr/sbin/mysqld(yyparse()+0x155a) [0x254ff1a]
/usr/sbin/mysqld(pars_sql(pars_info_t*, char const*)+0x9d) [0x22890ad]
/usr/sbin/mysqld(fts_parse_sql(fts_table_t*, pars_info_t*, char const*)+0x29f) [0x2524f2f]
/usr/sbin/mysqld() [0x250c311]
/usr/sbin/mysqld(fts_empty_common_tables(trx_t*, dict_table_t*)+0x75) [0x250c3f5]
/usr/sbin/mysqld(fts_drop_index(dict_table_t*, dict_index_t*, trx_t*, aux_name_vec_t*)+0x2eb) [0x250c72b]
/usr/sbin/mysqld(commit_cache_norebuild(ha_innobase_inplace_ctx*, trx_t*)+0x2c3) [0x21af663]
/usr/sbin/mysqld(bool ha_innobase::commit_inplace_alter_table_impl<dd::Table>(TABLE*, Alter_inplace_info*, bool, dd::Table*)+0x2a3e) [0x21b22ce]
/usr/sbin/mysqld(ha_innobase::commit_inplace_alter_table(TABLE*, Alter_inplace_info*, bool, dd::Table const*, dd::Table*)+0xa9) [0x21b2d89]
/usr/sbin/mysqld() [0xf1c8fe]
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
/lib64/libpthread.so.0(+0x81da) [0x7f4a769bf1da]
/lib64/libc.so.6(clone+0x43) [0x7f4a74f6de73]
 
Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7f4a0001f1f0): ALTER TABLE t1 DROP INDEX dummy
Connection ID (thread ID): 9
Status: NOT_KILLED
 
The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
