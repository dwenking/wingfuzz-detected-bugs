CREATE TABLE v0 ( v2 BIGINT , v1 INT DEFAULT ( v2 + -1 ) ) ;
OPTIMIZE TABLE v0 ; SELECT '' , '' , NULL ;
ALTER TABLE v0 ADD v0 CHAR ( 13 ) ;
UPDATE IGNORE v0 SET v2 = 0 ;
ALTER TABLE v0 ADD ( SOCKET TIME DEFAULT ( LEFT ( v1 * -128 + TRUE , 19018902.000000 ^ ( CASE WEEK ( 'x' ) / 'x' WHEN CONVERT ( 5 , DOUBLE ) THEN 66 END ) ) ) PRIMARY KEY ) ;
DELETE FROM v0 WHERE NOT WEEK ( 'x' ) / 96 ;
DELETE FROM v0 WHERE COALESCE ( NULL , LAST_INSERT_ID ( + ( 'x' AND REPLACE ( 'x' , 'x' , 'x' ) ) ) ) ;

/*
    #0 0x17261d2 in Predicant_to_list_comparator::Predicant_to_value_comparator::cleanup() /root/mariadb/sql/item_cmpfunc.h:2105:9
    #1 0x17261d2 in Predicant_to_list_comparator::cleanup() /root/mariadb/sql/item_cmpfunc.h:2214:24
    #2 0x17261d2 in Item_func_case_simple::cleanup() /root/mariadb/sql/item_cmpfunc.h:2397:35
    #3 0x1603ff1 in Item::cleanup_processor(void*) /root/mariadb/sql/item.cc:572:5
    #4 0x8eaecb in Item_args::walk_args(bool (Item::*)(void*), bool, void*) /root/mariadb/sql/item.h:2741:20
    #5 0x8eaecb in Item_func_or_sum::walk(bool (Item::*)(void*), bool, void*) /root/mariadb/sql/item.h:5437:9
    #6 0x8eaecb in Item_args::walk_args(bool (Item::*)(void*), bool, void*) /root/mariadb/sql/item.h:2741:20
    #7 0x8eaecb in Item_func_or_sum::walk(bool (Item::*)(void*), bool, void*) /root/mariadb/sql/item.h:5437:9
    #8 0x104a071 in fix_session_vcol_expr(THD*, Virtual_column_info*) /root/mariadb/sql/table.cc:3622:15
    #9 0xa9fb5d in TABLE::fix_vcol_exprs(THD*) /root/mariadb/sql/sql_base.cc:5447:9
    #10 0xa9fb5d in fix_all_session_vcol_exprs(THD*, TABLE_LIST*) /root/mariadb/sql/sql_base.cc:5478:17
    #11 0xa9fb5d in lock_tables(THD*, TABLE_LIST*, unsigned int, unsigned int) /root/mariadb/sql/sql_base.cc:5662:13
    #12 0xaa205e in open_and_lock_tables(THD*, DDL_options_st const&, TABLE_LIST*, bool, unsigned int, Prelocking_strategy*) /root/mariadb/sql/sql_base.cc:5274:7
    #13 0xb3925d in open_and_lock_tables(THD*, TABLE_LIST*, bool, unsigned int) /root/mariadb/sql/sql_base.h:509:10
    #14 0xb3925d in mysql_delete(THD*, TABLE_LIST*, Item*, SQL_I_List<st_order>*, unsigned long long, unsigned long long, select_result*) /root/mariadb/sql/sql_delete.cc:341:7
    #15 0xc69ee7 in mysql_execute_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:4804:11
    #16 0xc4a67e in mysql_parse(THD*, char*, unsigned int, Parser_state*) /root/mariadb/sql/sql_parse.cc:8027:18
    #17 0xc41ba9 in dispatch_command(enum_server_command, THD*, char*, unsigned int, bool) /root/mariadb/sql/sql_parse.cc:1894:7
    #18 0xc4b74b in do_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:1402:17
    #19 0x111f9f2 in do_handle_one_connection(CONNECT*, bool) /root/mariadb/sql/sql_connect.cc:1418:11
    #20 0x111f248 in handle_one_connection /root/mariadb/sql/sql_connect.cc:1312:5
    #21 0x1f3f9dd in pfs_spawn_thread /root/mariadb/storage/perfschema/pfs.cc:2201:3
    #22 0x7fc4fc246608 in start_thread /build/glibc-sMfBJT/glibc-2.31/nptl/pthread_create.c:477:8
    #23 0x7fc4fbf5c162 in clone /build/glibc-sMfBJT/glibc-2.31/misc/../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
