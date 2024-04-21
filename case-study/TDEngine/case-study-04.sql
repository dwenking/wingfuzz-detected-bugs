;create stable st1 (ts timestamp, f1 int, f2 binary(200)) tags(t1 int);create stable st2 (ts timestamp, f1 int, f2 float, f3 double, f4 bigint, f5 smallint, f6 tinyint, f7 bool, f8 binary(10), f9 nchar(10)) tags (id1 int, id2 float, id3 nchar(10), id4 double, id5 smallint, id6 bigint, id7 binary(10));
create stable st2 (ts timestamp, f1 int, f2 binary(200)) tags(t1 int);reset query cache;;
(select client_version()) union all (select server_version());
select * from information_schema.ins_qnodes;
create table test using st1 tags(2);
select * from information_schema.ins_qnodes;;;
drop qnode on dnode 2;;
explain select * from st1;;
select * from information_schema.ins_qnodes;;
explain select * from information_schema.ins_stables;
explain select count(*),sum(f1) from test;
explain select count(*),sum(f1) from st1 group by f1;;
explain verbose true select * from st1 where f1 > 0 and ts > '2020-10-31 00:00:00' and ts < '2021-10-31 00:00:00';
explain verbose true select * from information_schema.ins_stables where db_name='db2';
explain analyze select ts from st1 where -2;;
explain analyze select count(*),sum(f1) from st1 group by f1;;;
explain analyze verbose true select count(*),sum(f1) from test;
explain analyze verbose true select count(*),sum(f1) from st1;;
explain analyze verbose true select f1 from st1 where f1 > 0 and ts > '2020-10-31 00:00:00' and ts < '2021-10-31 00:00:00';
explain analyze verbose true select st1.f1 from st1 join st2 on st1.ts=st2.ts and st1.f1 > 0;

/*


#0 tsortGetSortExecInfo (pHandle=0x0) at /root/tdengine/source/libs/executor/src/tsort.c:807
807 info.sortBuffer = pHandle->pageSize * pHandle->numOfPages;
[Current thread is 1 (Thread 0x7f5e577e4700 (LWP 16923))]
(gdb) bt
#0 tsortGetSortExecInfo (pHandle=0x0) at /root/tdengine/source/libs/executor/src/tsort.c:807
#1 0x00000000005a3092 in getMultiwayMergeExplainExecInfo (pOptr=0x7f5d4c00d5e0, pOptrExplain=0x7f5d4c01530c, len=0x7f5d4c015308) at /root/tdengine/source/libs/executor/src/sortoperator.c:710
#2 0x000000000058380b in getOperatorExplainExecInfo (operatorInfo=0x7f5d4c00d5e0, pExecInfoList=0x7f5d4c014d70) at /root/tdengine/source/libs/executor/src/executorimpl.c:3873
#3 0x0000000000583881 in getOperatorExplainExecInfo (operatorInfo=0x7f5d4c00de40, pExecInfoList=0x7f5d4c014d70) at /root/tdengine/source/libs/executor/src/executorimpl.c:3882
#4 0x00000000005e3c79 in qwHandleTaskComplete (mgmt=<optimized out>, sId=<optimized out>, qId=14704732076410142762, tId=33, rId=18, eId=0, ctx=0x7f5eb400d758)
at /root/tdengine/source/libs/qworker/src/qworker.c:65
#5 0x00000000005e49a2 in qwExecTask (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, ctx=<optimized out>, 
queryStop=<optimized out>) at /root/tdengine/source/libs/qworker/src/qworker.c:165
#6 0x00000000005e88ba in qwProcessQuery (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, qwMsg=<optimized out>, 
sql=<error reading variable: Cannot access memory at address 0x0>) at /root/tdengine/source/libs/qworker/src/qworker.c:637
#7 0x00000000005dd81a in qWorkerProcessQueryMsg (node=0x7f5e577e3cc0, qWorkerMgmt=0x7f5e6c128e90, pMsg=<optimized out>, ts=<optimized out>) at /root/tdengine/source/libs/qworker/src/qwMsg.c:402
#8 0x00000000004f9b94 in vnodeProcessQueryMsg (pVnode=0x7f5e6c120090, pMsg=0x7f5eb400ca00) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:346
#9 0x0000000000468752 in vmProcessQueryQueue (pInfo=<optimized out>, pMsg=0x7f5eb400ca00) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:69
#10 0x0000000000925d20 in tQWorkerThreadFp (worker=0x2439528) at /root/tdengine/source/util/src/tworker.c:87
#11 0x00007f5ec64f3609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#12 0x00007f5ec6408133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

*/
