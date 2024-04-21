CREATE TABLE v(t1 INT, pk INT, KEY(t1), KEY pk using btree (pk), KEY v using btree(t1, pk)) engine=memory;
HANDLER v OPEN;
HANDLER v READ t1=(2) limit 3;
HANDLER v READ pk PREV;
HANDLER v READ pk PREV;

/*
stack_bottom = 0x7f9e1a217680 thread_stack 0x5fc00
??:0(__interceptor_backtrace)[0x7cbadb]
mysys/stacktrace.c:212(my_print_stacktrace)[0x2a86d37]
sql/signal_handler.cc:0(handle_fatal_signal)[0x15af5d9]
sigaction.c:0(__restore_rt)[0x7f9e417f43c0]
mysys/tree.c:502(tree_search_next)[0x2a9a51c]
:0(heap_rprev)[0x214b1bb]
sql/handler.cc:3524(handler::ha_index_prev(unsigned char*))[0x15c8b2e]
??:0(mysql_ha_read(THD*, TABLE_LIST*, enum_ha_read_modes, char const*, List<Item>*, ha_rkey_function, Item*, unsigned long long, unsigned long long))[0xb60f2b]
sql/sql_parse.cc:5588(mysql_execute_command(THD*, bool))[0xc601de]
sql/sql_class.h:2734(THD::enter_stage(PSI_stage_info_v1 const*, char const*, char const*, unsigned int))[0xc4a67f]
sql/sql_parse.cc:1894(dispatch_command(enum_server_command, THD*, char*, unsigned int, bool))[0xc41baa]
sql/sql_parse.cc:1404(do_command(THD*, bool))[0xc4b74c]
sql/sql_connect.cc:1418(do_handle_one_connection(CONNECT*, bool))[0x111f9f3]
sql/sql_connect.cc:0(handle_one_connection)[0x111f249]
perfschema/pfs.cc:2203(pfs_spawn_thread)[0x1f3f9de]
nptl/pthread_create.c:478(start_thread)[0x7f9e417e8609]
??:0(clone)[0x7f9e414fe163]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (0x629000087238): HANDLER v READ pk PREV
*/
