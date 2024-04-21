CREATE TABLE v0 ( v1 BIGINT NOT NULL ) ;
SELECT v1 FROM v0 AS ONE ORDER BY v1 LIMIT 0 ;
ALTER TABLE v0 ADD ( v3 INT , v2 DATETIME , VALUE NUMERIC ( 53 ) ) ;
ALTER TABLE v0 ADD ( v4 INT DEFAULT ( + EXP ( REPLACE ( 'x' IN ( CURRENT_USER , 'x' , -32768 , -1 ) , NULL , NULL ) ) ) ) ;
DESCRIBE FORMAT = JSON SELECT '' FROM v0 WHERE v2 IN ( -1 , 127 , -1 ) ;
DELETE FROM v0 WHERE v3 IN ( v3 / v3 , -128 ) ;
DELETE v0 FROM v0 WHERE v2 = '' AND v3 = 'x' AND v2 = 2147483647 ;

/*
stack_bottom = 0x7ff881a19880 thread_stack 0x5fc00                                                                                                                                           
??:0(__interceptor_backtrace)[0x7cbadb]                                                                                                                                                      
mysys/stacktrace.c:212(my_print_stacktrace)[0x2a86d37]                                                                                                                                       
sql/signal_handler.cc:0(handle_fatal_signal)[0x15af5d9]                                                                                                                                      
sigaction.c:0(__restore_rt)[0x7ff8a79fe3c0]                                                                                                                                                  
sql/item_cmpfunc.h:2105(Predicant_to_list_comparator::Predicant_to_value_comparator::cleanup())[0x8efc62]                                                                                    
sql/item.cc:573(Item::cleanup_processor(void*))[0x1603ff2]                                                                                                                                   
sql/item.h:2741(Item_args::walk_args(bool (Item::*)(void*), bool, void*))[0x8eaecc]                                                                                                          
sql/item.h:2741(Item_args::walk_args(bool (Item::*)(void*), bool, void*))[0x8eaecc]                                                                                                          
sql/table.cc:3624(fix_session_vcol_expr(THD*, Virtual_column_info*))[0x104a072]                                                                                                              
sql/sql_base.cc:5446(TABLE::fix_vcol_exprs(THD*))[0xa9fb5e]                                                                                                                                  
sql/sql_base.cc:5274(open_and_lock_tables(THD*, DDL_options_st const&, TABLE_LIST*, bool, unsigned int, Prelocking_strategy*))[0xaa205f]                                                     
??:0(mysql_execute_command(THD*, bool))[0xc692af]                                                                                                                                            
sql/sql_class.h:2734(THD::enter_stage(PSI_stage_info_v1 const*, char const*, char const*, unsigned int))[0xc4a67f]                                                                           
sql/sql_parse.cc:1894(dispatch_command(enum_server_command, THD*, char*, unsigned int, bool))[0xc41baa]                                                                                      
sql/sql_parse.cc:1404(do_command(THD*, bool))[0xc4b74c]                                                                                                                                      
sql/sql_connect.cc:1418(do_handle_one_connection(CONNECT*, bool))[0x111f9f3]
sql/sql_connect.cc:0(handle_one_connection)[0x111f249]
perfschema/pfs.cc:2203(pfs_spawn_thread)[0x1f3f9de]
nptl/pthread_create.c:478(start_thread)[0x7ff8a79f2609]
??:0(clone)[0x7ff8a7708163]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (0x62900008c238): DELETE v0 FROM v0 WHERE v2 = '' AND v3 = 'x' AND v2 = 2147483647
*/
