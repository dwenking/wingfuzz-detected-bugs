CREATE TEMPORARY TABLE v0 ( SELECT DISTINCT abs ( 55 + 7 ) AS v1 GROUP BY v1 + 37 , v1 ) ;
 CREATE TRIGGER v0 AFTER INSERT ON v0 FOR EACH ROW DROP TABLE v0 ;
 SELECT DISTINCT * FROM v0 ORDER BY RANK ( ) OVER ( PARTITION BY -1 , -32768 , -128 , -128 ) * -2147483648 ;

/*
stack_bottom = 7f6a443f1c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2123181]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xfe6a12]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xfe6bc5]
/lib64/libpthread.so.0(+0x12d40) [0x7f6a5dfc5d40]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7f69dc045420): SELECT DISTINCT * FROM v0 ORDER BY RANK ( ) OVER ( PARTITION BY -1 , -32768 , -128 , -128 ) * -2147483648
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
