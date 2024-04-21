CREATE TABLE v0 ( v2 TEXT UNIQUE , v1 VARBINARY ( 255 ) NOT NULL PRIMARY KEY ) ;
ALTER TABLE v0 ADD ( JSON TIME NULL DEFAULT ( v1 IN ( 16 , v2 IN ( 33 , 7 ) AND v2 IN ( -1 , 'x' , 'x' , 39 ) ) ) ) ;
ALTER TABLE v0 ADD COLUMN ( MEMORY BOOLEAN DEFAULT ( v1 IN ( USER ( ) , 65244568.000000 , 'x' ) ) ) ;
ALTER TABLE v0 ADD COLUMN ( v3 BOOLEAN ) ;
DELETE v0 FROM v0 WHERE CONCAT ( 70 = ( NOT '' ) ) ;
DELETE FROM v0 WHERE abs ( ( ( v3 OR NOT v1 ) BETWEEN '' AND 127 ) + v1 = 33 = 255 ) ;

/*
stack_bottom = 0x7f75050fb880 thread_stack 0x5fc00                                                                                                                                           
??:0(__interceptor_backtrace)[0x7cbadb]                                                                                                                                                      
mysys/stacktrace.c:212(my_print_stacktrace)[0x2a86d37]                                                                                                                                       
sql/signal_handler.cc:0(handle_fatal_signal)[0x15af5d9]                                                                                                                                      
sigaction.c:0(__restore_rt)[0x7f752a0b23c0]                                                                                                                                                  
sql/item_cmpfunc.h:2105(Predicant_to_list_comparator::Predicant_to_value_comparator::cleanup())[0x8efc62]                                                                                    
sql/item.cc:573(Item::cleanup_processor(void*))[0x1603ff2]                                                                                                                                   
sql/table.cc:3624(fix_session_vcol_expr(THD*, Virtual_column_info*))[0x104a072]                                                                                                              
sql/sql_base.cc:5446(TABLE::fix_vcol_exprs(THD*))[0xa9fb5e]                                                                                                                                  
sql/sql_base.cc:5274(open_and_lock_tables(THD*, DDL_options_st const&, TABLE_LIST*, bool, unsigned int, Prelocking_strategy*))[0xaa205f]                                                     
sql/sql_base.h:512(open_and_lock_tables(THD*, TABLE_LIST*, bool, unsigned int))[0xb3925e]                                                                                                    
sql/sql_parse.cc:4804(mysql_execute_command(THD*, bool))[0xc69ee8]                                                                                                                           
sql/sql_class.h:2734(THD::enter_stage(PSI_stage_info_v1 const*, char const*, char const*, unsigned int))[0xc4a67f]                                                                           
sql/sql_parse.cc:1894(dispatch_command(enum_server_command, THD*, char*, unsigned int, bool))[0xc41baa]                                                                                      
sql/sql_parse.cc:1404(do_command(THD*, bool))[0xc4b74c]                                                                                                                                      
sql/sql_connect.cc:1418(do_handle_one_connection(CONNECT*, bool))[0x111f9f3]
??:0(handle_one_connection)[0x111f249]
perfschema/pfs.cc:2203(pfs_spawn_thread)[0x1f3f9de]
nptl/pthread_create.c:478(start_thread)[0x7f752a0a6609]
??:0(clone)[0x7f7529dbc163]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (0x629000091238): DELETE FROM v0 WHERE abs ( ( ( v3 OR NOT v1 ) BETWEEN '' AND 127 ) + v1 = 33 = 255 )
*/
