CREATE TABLE v0 ( v1 INT UNIQUE PRIMARY KEY ) ; 
DROP EVENT IF EXISTS v0 ; 
UPDATE v0 SET v1 = -1 WHERE v1 = 'x' ORDER BY 'x' DESC LIMIT 93 ; 
ALTER TABLE v0 ADD COLUMN ( MEMORY TINYBLOB DEFAULT ( v1 IN ( DAYNAME ( v1 ) , '' , 'x' 'x' 'x' ) ) UNIQUE ) ;
 UPDATE v0 SET v1 = NULL WHERE ( IF ( v1 AND v1 , 72 , 30 ) ) ;
 INSERT IGNORE INTO v0 SET v1 = ( '' ) + ( ( 'x' / NULL = INET_ATON ( ( v1 OR 'x' ) ) ) ) ;

/*
    #0 0x9086a0 in Binary_string::free_buffer() /root/mariadb/sql/sql_string.h:224:9
    #1 0x9086a0 in Binary_string::free() /root/mariadb/sql/sql_string.h:680:5
    #2 0x9086a0 in Binary_string::~Binary_string() /root/mariadb/sql/sql_string.h:271:5
    #3 0x9086a0 in Arg_comparator::~Arg_comparator() /root/mariadb/sql/item_cmpfunc.h:45:7
    #4 0x171733a in Item_bool_rowready_func2::~Item_bool_rowready_func2() /root/mariadb/sql/item_cmpfunc.h:535:7
    #5 0x171733a in Item_func_eq::~Item_func_eq() /root/mariadb/sql/item_cmpfunc.h:751:7
    #6 0xaefe90 in Item::delete_self() /root/mariadb/sql/item.h:2522:5
    #7 0xaefe90 in Query_arena::free_items() /root/mariadb/sql/sql_class.cc:3833:16
    #8 0xaefe90 in THD::cleanup_after_query() /root/mariadb/sql/sql_class.cc:2292:3
    #9 0xc41ba9 in dispatch_command(enum_server_command, THD*, char*, unsigned int, bool) /root/mariadb/sql/sql_parse.cc:1894:7
    #10 0xc4b74b in do_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:1402:17
    #11 0x111f9f2 in do_handle_one_connection(CONNECT*, bool) /root/mariadb/sql/sql_connect.cc:1418:11
    #12 0x111f248 in handle_one_connection /root/mariadb/sql/sql_connect.cc:1312:5
    #13 0x1f3f9dd in pfs_spawn_thread /root/mariadb/storage/perfschema/pfs.cc:2201:3
    #14 0x7f2f26f57608 in start_thread /build/glibc-sMfBJT/glibc-2.31/nptl/pthread_create.c:477:8
    #15 0x7f2f26c6d162 in clone /build/glibc-sMfBJT/glibc-2.31/misc/../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
