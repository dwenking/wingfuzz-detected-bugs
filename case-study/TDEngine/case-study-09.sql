create table fi_in_mt0 (ts timestamp, col1 int, col2 bigint, col3 float, col4 double, col5 binary(20), col6 bool, col7 smallint, col8 tinyint, col9 nchar(10)) tags (tag1 int);
create table mt (ts timestamp, c1 int, c2 int, c3 int) tags (t1 int);
show transactions;;
create table tb1 using sta tags(0, false, '0');;
create table tb1 (ts timestamp, f1 int) tags (j int);;;;
create table tb1 (ts timestamp, f1 int);
select * from streamt order by c1, c2, c3;
select top(f1, 2) from tb1 group by f1;
select bottom(f1, 2) from tb1 group by f1;;;;
create table tb1 using stb1 tags(1);
insert into tb1 values('2020-11-19 18:11:45.773', NULL);
insert into tb1 (ts, f1) values (now-1s, 1) (now, 2) tb1 (ts, f1) values (now-2s, 1) (now-1s, 2) (now, 3);
import into tb1 values ('2018-11-01 16:29:58.000', 2, 'import', 3);
insert into tb1 values ('2018-09-17 09:00:00.000', '1', 1, 1, 1, '____nchar', 'quoted int');
create table tb1 (ts timestamp, f1 int);
create table tb1 (ts timestamp, f1 int);;

insert into tb1 values ('2022-09-29 15:15:01', 0, "a", false);
insert into tb1 values ('2022-09-29 15:15:04', null, null, null);
insert into tb1 values ('2022-09-30 15:15:04', null, null, null);
select case when null then 4 end from tb1;
insert into tb1 select * from tb1;
insert into consumeresult values(1648791213000,NULL,NULL,NULL,NULL);;;
select * from information_schema.ins_qnodes;
insert into tb1 values (now - 120m , -120 );
select case when 0 then 1 else 3 end from tb1;
select case when 'a' then 'b' when null then 0 end from tb1;
insert into f values(1648791213007,1,4,4,4.0);;
insert into tb1 values (now + 109m , 109 );
insert into tb1 values(1648791223003,2,4,4,4.0);

/*


#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7ff13a7ed700 (LWP 38985))]
(gdb) bt
#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1 0x00007ff1abd7a92e in __GI_abort () at abort.c:100
#2 0x00007ff1abd7a729 in __assert_fail_base (fmt=0x7ff1abf10588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x9a2998 "mr.me.type == TSDB_NORMAL_TABLE", file=0x9a2595 "/root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c", line=4124, 
function=<optimized out>) at assert.c:92
#3 0x00007ff1abd8bfd6 in __GI___assert_fail (assertion=0x9a2998 "mr.me.type == TSDB_NORMAL_TABLE", file=0x9a2595 "/root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c", line=4124, 
function=0x9a29b8 "int32_t tsdbGetTableSchema(SVnode *, int64_t, STSchema **, int64_t *)") at assert.c:101
#4 0x0000000000717686 in tsdbGetTableSchema (pVnode=0x7ff14c120090, uid=4450860294588598233, pSchema=0x7ff044004dd8, suid=0x7ff13a7eca10) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:4124
#5 0x00000000005db7d5 in createDataInserter (pManager=0xad4218 <gDataSinkManager>, pDataSink=0x7ff044001711, pHandle=0x7ff13a7ecb18, pParam=0x7ff044004d80) at /root/tdengine/source/libs/executor/src/dataInserter.c:324
#6 0x0000000000572789 in qCreateExecTask (readHandle=0x7ff13a7eccc0, vgId=4, taskId=14, pSubplan=0x7ff044000b91, pTaskInfo=0x7ff13a7ecb10, handle=0x7ff13a7ecb18, sql=0x7ff044000b60 "\ninsert into tb1 select * from tb1;", model=OPTR_EXEC_MODEL_BATCH)
at /root/tdengine/source/libs/executor/src/executor.c:468
#7 0x00000000005e8246 in qwProcessQuery (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, qwMsg=<optimized out>, sql=<optimized out>)
at /root/tdengine/source/libs/qworker/src/qworker.c:618
#8 0x00000000005dd81a in qWorkerProcessQueryMsg (node=0x7ff13a7eccc0, qWorkerMgmt=0x7ff14c2c55b0, pMsg=<optimized out>, ts=<optimized out>) at /root/tdengine/source/libs/qworker/src/qwMsg.c:402
#9 0x00000000004f9b94 in vnodeProcessQueryMsg (pVnode=0x7ff14c120090, pMsg=0x7ff15c069040) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:346
#10 0x0000000000468752 in vmProcessQueryQueue (pInfo=<optimized out>, pMsg=0x7ff15c069040) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:69
#11 0x0000000000925d20 in tQWorkerThreadFp (worker=0x2704358) at /root/tdengine/source/util/src/tworker.c:87
#12 0x00007ff1abf62609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#13 0x00007ff1abe77133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

*/
