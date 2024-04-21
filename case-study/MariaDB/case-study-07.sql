CREATE TABLE v0 ( v1 INT UNIQUE UNIQUE UNIQUE PRIMARY KEY ) ;
SET GLOBAL READ_ONLY = TRUE ;
INSERT v0 ( ) VALUES ( 85075355.000000 ) , ( 52251370.000000 ) ;
CREATE TABLE v2 ( v3 BIGINT ( 43 ) ) ENGINE = MEMORY ;
INSERT IGNORE v2 SET v3 = DEFAULT ;
ALTER TABLE v0 ADD ( v4 INT AS ( ( TIME ( CASE DAYNAME ( 'x' ) WHEN 'x' THEN RIGHT ( + '' , 78 ) END ) ) ) VIRTUAL ) ;
UPDATE v0 MEMORY SET v1 = v1 ;
SELECT * FROM v0 WHERE v1 LIKE 'x' ORDER BY COALESCE ( 'x' ) ;

/*
stack_bottom = 0x7f8171428880 thread_stack 0x5fc00                                                                                                                                           
??:0(__interceptor_backtrace)[0x7cbadb]                                                                                                                                                      
mysys/stacktrace.c:212(my_print_stacktrace)[0x2a86d37]                                                                                                                                       
sql/signal_handler.cc:0(handle_fatal_signal)[0x15af5d9]                                                                                                                                      
sigaction.c:0(__restore_rt)[0x7f8195bc23c0]                                                                                                                                                  
sql/item_cmpfunc.h:2058(Predicant_to_list_comparator::cmp_arg(Item_args*, unsigned int))[0x16ccaaf]                                                                                          
??:0(Item_func_case::str_op(String*))[0x16cd3e2]                                                                                                                                             
sql/sql_type.cc:5665(Type_handler_string_result::Item_func_hybrid_field_type_get_date(THD*, Item_func_hybrid_field_type*, Temporal::Warn*, st_mysql_time*, date_mode_t) const)[0x131bef1]    
sql/sql_type.cc:5145(Type_handler::Item_func_hybrid_field_type_get_date_with_warn(THD*, Item_func_hybrid_field_type*, st_mysql_time*, date_mode_t) const)[0x1317054]                         
sql/sql_type.cc:758(Time::make_from_item(THD*, int*, Item*, Time::Options))[0x12f1254]                                                                                                       
??:0(Item_time_typecast::get_date(THD*, st_mysql_time*, date_mode_t))[0x19cfef0]                                                                                                             
sql/item.cc:363(Item::save_time_in_field(Field*, bool))[0x1601545]                                                                                                                           
sql/item.cc:6812(Item::save_in_field(Field*, bool))[0x164ce5a]                                                                                                                               
sql/table.cc:8761(TABLE::update_virtual_fields(handler*, enum_vcol_update_mode))[0x1072e99]                                                                                                  
??:0(handler::ha_rnd_next(unsigned char*))[0x15c4e50]                                                                                                                                        
sql/records.cc:519(rr_sequential(READ_RECORD*))[0x930065]                                                                                                                                    
sql/sql_select.cc:21092(sub_select(JOIN*, st_join_table*, bool))[0xd4c04e]                                                                                                                   
??:0(JOIN::exec_inner())[0xdc6798]                                                                                                                                                           
sql/sql_select.cc:4528(JOIN::exec())[0xdc344d]                                                                                                                                               
sql/sql_select.cc:5009(mysql_select(THD*, TABLE_LIST*, List<Item>&, Item*, unsigned int, st_order*, st_order*, Item*, st_order*, unsigned long long, select_result*, st_select_lex_unit*, st_
select_lex*))[0xd4e4e9]                                                                                                                                                                      
sql/sql_select.cc:543(handle_select(THD*, LEX*, select_result*, unsigned long))[0xd4d74c]                                                                                                    
sql/sql_parse.cc:6252(execute_sqlcom_select(THD*, TABLE_LIST*))[0xc74411]                                                                                                                    
sql/sql_parse.cc:3943(mysql_execute_command(THD*, bool))[0xc609ca]                                                                                                                           
sql/sql_class.h:2734(THD::enter_stage(PSI_stage_info_v1 const*, char const*, char const*, unsigned int))[0xc4a67f]                                                                           
sql/sql_parse.cc:1894(dispatch_command(enum_server_command, THD*, char*, unsigned int, bool))[0xc41baa]                                                                                      
sql/sql_parse.cc:1404(do_command(THD*, bool))[0xc4b74c]                                                                                                                                      
sql/sql_connect.cc:1418(do_handle_one_connection(CONNECT*, bool))[0x111f9f3]
sql/sql_connect.cc:0(handle_one_connection)[0x111f249]
perfschema/pfs.cc:2203(pfs_spawn_thread)[0x1f3f9de]
nptl/pthread_create.c:478(start_thread)[0x7f8195bb6609]
??:0(clone)[0x7f81958cc163]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (0x62900008c238): SELECT * FROM v0 WHERE v1 LIKE 'x' ORDER BY COALESCE ( 'x' )
*/
