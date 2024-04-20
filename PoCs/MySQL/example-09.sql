CREATE TABLE v0 (v1 TEXT);
SELECT DISTINCT ( ( SELECT 'x' FROM v0 ORDER BY LAST_VALUE ( v1 % 1 ) OVER ( PARTITION BY NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , x ORDER BY v1 ) DESC ) ) FROM ( SELECT 1.000000 AS x UNION SELECT 1 ORDER BY 1 , x , x ) AS x WHERE v1 = v1 + 1 ;

/*
stack_bottom = 7fffcc510c10 thread_stack 0x100000
/usr/sbin/mysqld(my_print_stacktrace(unsigned char const*, unsigned long)+0x41) [0x2158f91]
/usr/sbin/mysqld(print_fatal_signal(int)+0x2a2) [0xff5d92]
/usr/sbin/mysqld(handle_fatal_signal+0xa5) [0xff5f45]
/lib64/libpthread.so.0(+0x12d40) [0x7ffff7bc0d40]
/usr/sbin/mysqld(my_charset_bin+0) [0x3f3c720]

Trying to get some variables.
Some pointers may be invalid and cause the dump to abort.
Query (7fff642b3180): SELECT DISTINCT ( ( SELECT 'x' FROM v0 ORDER BY LAST_VALUE ( v1 % 1 ) OVER ( PARTITION BY NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , x ORDER BY v1 ) DESC ) ) FROM ( SELECT 1.000000 AS x UNION SELECT 1 ORDER BY 1 , x , x ) AS x WHERE v1 = v1 + 1
Connection ID (thread ID): 8
Status: NOT_KILLED

The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.
*/
