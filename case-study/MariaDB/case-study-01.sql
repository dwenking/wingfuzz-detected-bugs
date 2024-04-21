create or replace trigger A before insert on B
for each row select table_rows from information_schema.tables
where table_name = 'C' into @#;

/*
    #0 0xb9e5a3 in lex_end_nops(LEX*) /root/mariadb/sql/sql_lex.cc:1372:14
    #1 0xb9e5a3 in lex_end(LEX*) /root/mariadb/sql/sql_lex.cc:1340:3
    #2 0xb03989 in THD::end_statement() /root/mariadb/sql/sql_class.cc:3908:3
    #3 0xc4a897 in mysql_parse(THD*, char*, unsigned int, Parser_state*) /root/mariadb/sql/sql_parse.cc:8049:10
    #4 0xc41ba9 in dispatch_command(enum_server_command, THD*, char*, unsigned int, bool) /root/mariadb/sql/sql_parse.cc:1894:7
    #5 0xc4b74b in do_command(THD*, bool) /root/mariadb/sql/sql_parse.cc:1402:17
    #6 0x111f9f2 in do_handle_one_connection(CONNECT*, bool) /root/mariadb/sql/sql_connect.cc:1418:11
    #7 0x111f248 in handle_one_connection /root/mariadb/sql/sql_connect.cc:1312:5
    #8 0x1f3f9dd in pfs_spawn_thread /root/mariadb/storage/perfschema/pfs.cc:2201:3
    #9 0x7f17d6fdc608 in start_thread /build/glibc-sMfBJT/glibc-2.31/nptl/pthread_create.c:477:8
    #10 0x7f17d6cf2162 in clone /build/glibc-sMfBJT/glibc-2.31/misc/../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
