drop database test10;
create database test10;
use test10;
create table if not exists stb (ts timestamp, c1 int, c2 float, c3 double, c4 bigint) tags (t1 int unsigned);
create table test using stb tags(1000);
create sma index sma_index_name1 on stb function(max(c1),max(c2),min(c1)) interval(5m,10s) sliding(5m) watermark 1s max_delay 1s;
create table c1234 using stb tags(3000);
insert into c1234 values(1648791211000,1,2,3,7);
drop database test10; 


/*


#0 0x00000000009162f3 in taosWriteQitem (queue=0x7f0f88001da0, pItem=0x7f0fb8000c20) at /root/tdengine/source/util/src/tqueue.c:198
198 if (queue->tail) {
[Current thread is 1 (Thread 0x7f10b7c87700 (LWP 63717))]
(gdb) 
(gdb) bt
#0 0x00000000009162f3 in taosWriteQitem (queue=0x7f0f88001da0, pItem=0x7f0fb8000c20) at /root/tdengine/source/util/src/tqueue.c:198
#1 0x00000000005eee5a in streamTaskInput (pTask=0x7f0f88002430, pItem=0x7f0fb8000c20) at /root/tdengine/include/libs/stream/tstream.h:348
#2 streamSchedByTimer (param=0x7f0f88002430, tmrId=<optimized out>) at /root/tdengine/source/libs/stream/src/stream.c:70
#3 0x0000000000922af8 in processExpiredTimer (handle=0x7f0f88144cd0, arg=<optimized out>) at /root/tdengine/source/util/src/ttimer.c:294
#4 0x000000000091c714 in taosProcessSchedQueue (scheduler=0x2503bf0) at /root/tdengine/source/util/src/tsched.c:168
#5 0x00007f10bf2bc609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#6 0x00007f10bf1d1133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
