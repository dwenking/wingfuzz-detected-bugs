SELECT '' IS NULL , -2147483648 IS NULL , 28 IS NOT NULL , 28 IS NOT NULL ;
CREATE TABLE v0 ( v1 CHAR PRIMARY KEY ) ;
CREATE TABLE v2 ( v4 INT NOT NULL , v3 INT NOT NULL ) ;
ALTER TABLE v0 ADD COLUMN ( MEMORY BIGINT DEFAULT ( ( CASE 'x' 'x' WHEN 17 THEN ( 'x' * 'x' * 'x' * 16 ) END ) BETWEEN 96 AND ( 'x' XOR CURRENT_USER ) ) ) ;
CREATE TABLE v5 AS SELECT '' AS v6 ;
DELETE IGNORE FROM v0 WHERE -1 + 81 + 81 IS NOT NULL ORDER BY v1 LIMIT 83 ;
SELECT * FROM v5 WHERE '' ORDER BY v6 DESC LIMIT 0 ;
DELETE FROM v0 WHERE DAY ( ( 'x' OR 'x' 'x' ) * 0 NOT IN ( NULL , '' , '' ) ) OR 'x' ;

/*
    #0 0x16e7cf4 in Item_cond::fix_fields(THD*, Item**) /root/mariadb/sql/item_cmpfunc.cc:4869:18
    #1 0xab0b54 in Item::fix_fields_if_needed(THD*, Item**) /root/mariadb/sql/item.h:1144:30
    #2 0xab0b54 in Item::fix_fields_if_needed_for_scalar(THD*, Item**) /root/mariadb/sql/item.h:1148:12
    #3 0xab0b54 in Item::fix_fields_if_needed_for_bool(THD*, Item**) /root/mariadb/sql/item.h:1152:12
    #4 0xab0b54 in setup_conds(THD*, TABLE_LIST*, List<TABLE_LIST>&, Item**) /root/mariadb/sql/sql_base.cc:8474:19
    #5 0xb433d7 in mysql_prepare_delete(THD*, TABLE_LIST*, Item**, bool*) /root/mariadb/sql/sql_delete.cc:1062:7
    #6 0xb3991f in mysql_delete(THD*, TABLE_LIST*, Item*, SQL_I_List<st_order>*, unsigned long long, unsigned long long, select_result*) /root/mariadb/sql/sql_delete.cc:371:7
    #7 0xc69ee7 in mysql_execute_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:4804:11
    #8 0xc4a67e in mysql_parse(THD*, char*, unsigned int, Parser_state*) /root/mariadb/sql/sql_parse.cc:8027:18
    #9 0xc41ba9 in dispatch_command(enum_server_command, THD*, char*, unsigned int, bool) /root/mariadb/sql/sql_parse.cc:1894:7
    #10 0xc4b74b in do_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:1402:17
    #11 0x111f9f2 in do_handle_one_connection(CONNECT*, bool) /root/mariadb/sql/sql_connect.cc:1418:11
    #12 0x111f248 in handle_one_connection /root/mariadb/sql/sql_connect.cc:1312:5
    #13 0x1f3f9dd in pfs_spawn_thread /root/mariadb/storage/perfschema/pfs.cc:2201:3
    #14 0x7f4eb3645608 in start_thread /build/glibc-sMfBJT/glibc-2.31/nptl/pthread_create.c:477:8
    #15 0x7f4eb335b162 in clone /build/glibc-sMfBJT/glibc-2.31/misc/../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
