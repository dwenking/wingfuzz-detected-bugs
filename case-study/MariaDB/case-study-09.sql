CREATE TABLE v0 ( v3 DATE , v2 INT , v1 DATE GENERATED ALWAYS AS ( UNIX_TIMESTAMP ( INET_ATON ( 87 ) ) IN ( 'x' , ASCII ( DATABASE ( ) = 'x' IS NULL ) ) ) ) ;
 SELECT v1 , '' , v2 FROM v0 INTO OUTFILE 'x' ;
 SELECT v2 FROM v0 ORDER BY 'x' = ( SELECT v1 WHERE v2 ) ;

/*
stack_bottom = 0x7fc2059b5880 thread_stack 0x5fc00
??:0(__interceptor_backtrace)[0x7cbadb]
mysys/stacktrace.c:212(my_print_stacktrace)[0x2a86d37]
sql/signal_handler.cc:0(handle_fatal_signal)[0x15af5d9]
sigaction.c:0(__restore_rt)[0x7fc22b17f3c0]
??:0(gsignal)[0x7fc22adad03b]
??:0(abort)[0x7fc22ad8c859]
??:0(__cxa_throw_bad_array_new_length)[0x7fc22b021911]
??:0(std::rethrow_exception(std::__exception_ptr::exception_ptr))[0x7fc22b02d38c]
??:0(std::terminate())[0x7fc22b02d3f7]
??:0(__cxa_pure_virtual)[0x7fc22b02e155]
sql/item_func.cc:148(Item_func::check_argument_types_like_args0() const)[0x177a944]
sql/item_func.cc:357(Item_func::fix_fields(THD*, Item**))[0x177d5fb]
sql/item_func.cc:347(Item_func::fix_fields(THD*, Item**))[0x177d31b]
sql/item_func.cc:347(Item_func::fix_fields(THD*, Item**))[0x177d31b]
sql/item_func.cc:347(Item_func::fix_fields(THD*, Item**))[0x177d31b]
sql/table.cc:3598(fix_vcol_expr(THD*, Virtual_column_info*))[0x104a248]
sql/table.cc:3644(fix_session_vcol_expr_for_read(THD*, Field*, Virtual_column_info*))[0x104aa7f]
??:0(Item_field::fix_fields(THD*, Item**))[0x1646c2a]
sql/item.h:1148(Item::fix_fields_if_needed_for_scalar(THD*, Item**))[0xaac399]
sql/sql_select.cc:1395(JOIN::prepare(TABLE_LIST*, Item*, unsigned int, st_order*, bool, st_order*, Item*, st_order*, st_select_lex*, st_select_lex_unit*))[0xd5ecfb]
sql/item_subselect.cc:3900(subselect_single_select_engine::prepare(THD*))[0x194ffcf]
sql/item_subselect.cc:295(Item_subselect::fix_fields(THD*, Item**))[0x1924be0]
sql/item_func.cc:347(Item_func::fix_fields(THD*, Item**))[0x177d31b]
sql/item.h:1148(Item::fix_fields_if_needed_for_scalar(THD*, Item**))[0xd651da]
sql/sql_select.cc:25056(setup_order(THD*, Bounds_checked_array<Item*>, TABLE_LIST*, List<Item>&, List<Item>&, st_order*, bool))[0xe3c0c5]
sql/sql_select.cc:847(setup_without_group(THD*, Bounds_checked_array<Item*>, TABLE_LIST*, List<TABLE_LIST>&, List<Item>&, List<Item>&, Item**, st_order*, st_order*, List<Window_spec>&, List<Item_window_func>&, bool*, unsigned int*))[0xd5f247]
sql/sql_select.cc:4982(mysql_select(THD*, TABLE_LIST*, List<Item>&, Item*, unsigned int, st_order*, st_order*, Item*, st_order*, unsigned long long, select_result*, st_select_lex_unit*, st_select_lex*))[0xd4de94]
sql/sql_select.cc:543(handle_select(THD*, LEX*, select_result*, unsigned long))[0xd4d74c]
sql/sql_parse.cc:6252(execute_sqlcom_select(THD*, TABLE_LIST*))[0xc74411]
sql/sql_parse.cc:3943(mysql_execute_command(THD*, bool))[0xc609ca]
sql/sql_class.h:2734(THD::enter_stage(PSI_stage_info_v1 const*, char const*, char const*, unsigned int))[0xc4a67f]
sql/sql_parse.cc:1894(dispatch_command(enum_server_command, THD*, char*, unsigned int, bool))[0xc41baa]
sql/sql_parse.cc:1404(do_command(THD*, bool))[0xc4b74c]
sql/sql_connect.cc:1418(do_handle_one_connection(CONNECT*, bool))[0x111f9f3]
sql/sql_connect.cc:0(handle_one_connection)[0x111f249]
perfschema/pfs.cc:2203(pfs_spawn_thread)[0x1f3f9de]
nptl/pthread_create.c:478(start_thread)[0x7fc22b173609]
??:0(clone)[0x7fc22ae89163]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (0x629000087238): SELECT v2 FROM v0 ORDER BY 'x' = ( SELECT v1 WHERE v2 )
*/
