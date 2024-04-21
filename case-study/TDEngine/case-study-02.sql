create dnode localhost port 7200;
create dnode localhost port 7300;;
create table tb (ts timestamp, a int);
insert into tb values (now + 1m , 1 );;
create table b(c timestamp, d int, e int , f int, g double);
insert into b values (now + 3m , 3 );;
create stream streams0 trigger at_once into streamt as select _wstart c1, count(*) c2, max(a) c3 from tb state_window(a);
insert into b values(1648791213000,NULL,NULL,NULL,NULL);
insert into h values (now + 4m , 4 );
insert into b values (now + 6m , 6 );;
select * from streamt order by c1, c2, c3;
insert into b values (now + 10m , 10 );
insert into b values(1648791213000,NULL,NULL,NULL,NULL);
show vgroups;
insert into h values (now + 1m , 1 );
insert into h values (now + 2m , 2 );
insert into h values (now + 4m , 4 );
insert into b values (now + 5m , 5 );
select * from streamt order by c1, c2, c3;
insert into h values (now + 7m , 7 );;
insert into b values(1648791213001,1,2,2,2.0);;
insert into b values(1648791213002,1,3,3,3.0);
insert into h values (now + 9m , 9 );
insert into tb values(1648791213003,1,4,4,4.0);;
delete from b where c >= 1648791213001 and c <= 1648791213002;;
insert into h values (now + 1m , 1 );
insert into h values (now + 2m , 2 );
insert into h values(1648791223000,2,2,3,1.0);
insert into h values (now + 4m , 4 );
insert into h values (now + 6m , 6 );
insert into h values (now + 10m , 10 );;
insert into b values(1648791223003,2,2,3,1.0);
select * from h;
show vgroups;
show vgroups;
show vgroups;
show vgroups;
insert into h values (now + 10m , 10);
insert into b values (now + 13m , 10);
insert into h values(1648791223000,2,1,1,1.0);
insert into h values (now + 14m , 10);;
insert into h values (now + 15m , 10);
insert into b values(1648791223002,2,3,3,3.0);
insert into h values(1648791223003,2,4,4,4.0);;
insert into h values(1648791233001,3,2,2,2.0);
insert into tb values (now + 1m , 1 );
insert into h values (now + 3m , 3 );
insert into h values (now + 4m , 4 );;
insert into h values (now + 5m , 5 );;
insert into b values (now + 6m , 6 );
insert into h values (now + 7m , 7 );
delete from b where c >= 1648791213001 and c <= 1648791233005;;;

insert into h values (now + 9m , 9 );
show vgroups;
insert into h values (now + 5m , 10);
insert into b values (now + 7m , 10);
insert into h values (now + 9m , 10);
insert into h values (now + 11m , 10);
insert into h values (now + 12m , 10);
insert into h values (now + 14m , 10);
select * from h;
insert into h values (now + 2m , 10);
insert into h values (now + 3m , 10);
insert into h values (now + 7m , 10);
insert into h values (now + 9m , 10);

/*


#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7fc0a76f1700 (LWP 20228))]
(gdb) bt
#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1 0x00007fc19fa0f92e in __GI_abort () at abort.c:100
#2 0x00007fc19fa0f729 in __assert_fail_base (fmt=0x7fc19fba5588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x98314f "pTwSup->maxTs == (-9223372036854775807L-1) || pTwSup->maxTs > 0", 
file=0x982f38 "/root/tdengine/source/libs/executor/src/timewindowoperator.c", line=885, function=<optimized out>) at assert.c:92
#3 0x00007fc19fa20fd6 in __GI___assert_fail (assertion=0x98314f "pTwSup->maxTs == (-9223372036854775807L-1) || pTwSup->maxTs > 0", 
file=0x982f38 "/root/tdengine/source/libs/executor/src/timewindowoperator.c", line=885, function=0x98318f "_Bool isOverdue(int64_t, STimeWindowAggSupp *)") at assert.c:101
#4 0x00000000005aed60 in isOverdue (ekey=<optimized out>, pTwSup=<optimized out>) at /root/tdengine/source/libs/executor/src/timewindowoperator.c:885
#5 0x000000000059db40 in checkUpdateData (pInfo=0x7fc088122bc0, invertible=<optimized out>, pBlock=<optimized out>, out=<optimized out>) at /root/tdengine/source/libs/executor/src/scanoperator.c:1580
#6 0x0000000000593cf2 in doStreamScan (pOperator=<optimized out>) at /root/tdengine/source/libs/executor/src/scanoperator.c:2087
#7 0x00000000005c0047 in doStreamStateAgg (pOperator=<optimized out>) at /root/tdengine/source/libs/executor/src/timewindowoperator.c:4575
#8 0x0000000000573e31 in qExecTask (tinfo=0x7fc0881222e0, pRes=0x7fc0a76f0b60, useconds=0x7fc0a76f0b70) at /root/tdengine/source/libs/executor/src/executor.c:642
#9 0x00000000005f41fb in streamTaskExecImpl (pTask=0x7fc088004fb0, data=<optimized out>, pRes=0x7fc01c000b60) at /root/tdengine/source/libs/stream/src/streamExec.c:52
#10 streamExecForAll (pTask=0x7fc088004fb0) at /root/tdengine/source/libs/stream/src/streamExec.c:249
#11 0x00000000005f4a87 in streamTryExec (pTask=0x7fc088004fb0) at /root/tdengine/source/libs/stream/src/streamExec.c:290
#12 0x00000000005efdc9 in streamProcessRunReq (pTask=0x7fc088004fb0) at /root/tdengine/source/libs/stream/src/stream.c:230
#13 0x0000000000560941 in tqProcessTaskRunReq (pTq=<optimized out>, pMsg=<optimized out>) at /root/tdengine/source/dnode/vnode/src/tq/tq.c:1306
#14 0x0000000000468ac8 in vmProcessStreamQueue (pInfo=0x7fc0a76f0e20, pMsg=0x7fc088137800) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:86
#15 0x0000000000925d20 in tQWorkerThreadFp (worker=0x1f32d00) at /root/tdengine/source/util/src/tworker.c:87
#16 0x00007fc19fbf7609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#17 0x00007fc19fb0c133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
(gdb)
*/
