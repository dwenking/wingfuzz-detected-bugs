CREATE TABLE maximum_value(
  start_value int NOT NULL, increment int NOT NULL, cache_size varchar(1) NOT NULL,
  PRIMARY KEY (start_value), INDEX maximum_value (cache_size, increment)
) ENGINE=ARIA;
INSERT INTO maximum_value VALUES 
  (1,9,'x'), (2,5,'g'), (3,1,'o'), (4,0,'g'), (5,1,'cache_size'),
  (6,190,'cache_size'), (7,6,'x'), (8,3,'c'), (9,4,'z'), (10,3,'increment'),
  (11,186,'x'), (12,1,'g'), (13,8,'q'), (14,226,'cache_size'), (15,133,'p');
select to_char('2000-11-11', cache_size) from maximum_value;

/*
    #0 0x19c0bc7 in Item_func_tochar::parse_format_string(String const*, unsigned int*) /root/mariadb/sql/item_timefunc.cc:2176:18
    #1 0x19c2a49 in Item_func_tochar::val_str(String*) /root/mariadb/sql/item_timefunc.cc:2704:9
    #2 0x1335e49 in Type_handler::Item_send_str(Item*, Protocol*, st_value*) const /root/mariadb/sql/sql_type.cc:7468:19
    #3 0x920511 in Protocol::send_result_set_row(List<Item>*) /root/mariadb/sql/protocol.cc:1328:15
    #4 0xaf9409 in select_send::send_data(List<Item>&) /root/mariadb/sql/sql_class.cc:3060:17
    #5 0xdb5094 in select_result_sink::send_data_with_check(List<Item>&, st_select_lex_unit*, unsigned long long) /root/mariadb/sql/sql_class.h:5612:12
    #6 0xdb5094 in end_send(JOIN*, st_join_table*, bool) /root/mariadb/sql/sql_select.cc:22331:9
    #7 0xe315ff in evaluate_join_record(JOIN*, st_join_table*, int) /root/mariadb/sql/sql_select.cc:21325:11
    #8 0xd4c23d in sub_select(JOIN*, st_join_table*, bool) /root/mariadb/sql/sql_select.cc:21134:9
    #9 0xdc6797 in do_select(JOIN*, Procedure*) /root/mariadb/sql/sql_select.cc:20640:14
    #10 0xdc6797 in JOIN::exec_inner() /root/mariadb/sql/sql_select.cc:4749:50
    #11 0xdc344c in JOIN::exec() /root/mariadb/sql/sql_select.cc:4527:3
    #12 0xd4e4e8 in mysql_select(THD*, TABLE_LIST*, List<Item>&, Item*, unsigned int, st_order*, st_order*, Item*, st_order*, unsigned long long, select_result*, st_select_lex_unit*, st_select_lex*) /root/mariadb/sql/sql_select.cc:5007:9
    #13 0xd4d74b in handle_select(THD*, LEX*, select_result*, unsigned long) /root/mariadb/sql/sql_select.cc:543:10
    #14 0xc74410 in execute_sqlcom_select(THD*, TABLE_LIST*) /root/mariadb/sql/sql_parse.cc:6252:12
    #15 0xc609c9 in mysql_execute_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:3943:12
    #16 0xc4a67e in mysql_parse(THD*, char*, unsigned int, Parser_state*) /root/mariadb/sql/sql_parse.cc:8027:18
    #17 0xc41ba9 in dispatch_command(enum_server_command, THD*, char*, unsigned int, bool) /root/mariadb/sql/sql_parse.cc:1894:7
    #18 0xc4b74b in do_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:1402:17
    #19 0x111f9f2 in do_handle_one_connection(CONNECT*, bool) /root/mariadb/sql/sql_connect.cc:1418:11
    #20 0x111f248 in handle_one_connection /root/mariadb/sql/sql_connect.cc:1312:5
    #21 0x1f3f9dd in pfs_spawn_thread /root/mariadb/storage/perfschema/pfs.cc:2201:3
    #22 0x7f1f622a1608 in start_thread /build/glibc-sMfBJT/glibc-2.31/nptl/pthread_create.c:477:8
    #23 0x7f1f61fb7162 in clone /build/glibc-sMfBJT/glibc-2.31/misc/../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
