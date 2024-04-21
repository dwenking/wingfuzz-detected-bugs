create table st (ts timestamp, c1b binary(20)) tags(t1b binary(20));;;
create table test (ts timestamp, f1 nchar(1021));
select c1b from st where c1b match e;;
select tbname from st where tbname match '.*';
create table st_ct_1 using st tags('NOTMATCH');
select tbname from st where tbname match '^ct[[:digit:]]';select c1b from st where c1b nmatch e; "fish /root/run" 01:29 10-Nov-22
create table st_ct_4 using st tags('taosdata2');
select tbname from st where tbname match '.*';
insert into st_ct_1 values ( '2022-01-03 20:00:01.000', 7 );;;
insert into st_ct_1 values ( '2021-12-31 01:01:01.000', 1 );;
create table wrong_type(ts timestamp, c0 tinyint, test smallint, c2 int, c3 bigint, c4 float, c5 double, c6 bool, c7 nchar(20)) tags(t0 tinyint, t1 smallint, t2 int, t3 bigint, t4 float, t5 double, t6 bool, t7 nchar(10));;
select tbname from st where t1b match '[[:lower:]]+';
select * from wrong_type where ts match '.*';
select * from wrong_type where c0 match '.*';
insert into c12345 values ('2022-09-28 15:15:02', 1, "0", true);
select * from wrong_type where ts nmatch '.*';
select c1b from st where c1b nmatch e;
insert into st_ct_4 using wrong_type tags(1, 2, 3, 4, 5, 6, true, 'notsupport') values(now, 1, 2, 3, 4, 5, 6, false, 'notsupport');
select * from wrong_type where c3 match '.*';
select * from st_ct_4 where null = null;
select * from st_ct_1 where null <> null;
select * from wrong_type where c3 nmatch '.*';
select * from wrong_type where c3 nmatch '.*';
select * from wrong_type where c4 match '.*';
insert into st_ct_1 values (now, '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ____ _ _ _ _ _ __ _ _ _ _ _ _ _ _ _ _ _ _ _');
select * from wrong_type where t5 nmatch '.*';
insert into st_ct_1 values (now, '__ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ _______________________________________ ...');
select * from wrong_type where c5 match '.*';
insert into st_ct_4 values ('2022-09-30 15:15:03', 5, "5", false);;
select * from wrong_type where t2 match '.*';
select * from wrong_type where c7 nmatch '.*';
insert into st_ct_4 values (now, '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ...');
select * from wrong_type where t4 nmatch '.*';
select * from wrong_type where t1 match '.*';
select * from st_ct_1;
select * from wrong_type where t7 match '.*';

select * from st_ct_1;
select case when 0 then 1 else 3 end from st_ct_4;
select * from st_ct_4;
select * from st_ct_1;;;


/*


#0 0x00000000008dd7ca in tTSRowGetVal (pRow=0x7f48bdfff2f8, pTSchema=0x7f4734010bf0, iCol=<optimized out>, pColVal=0x7f48affe16a0) at /root/tdengine/source/common/src/trow.c:1087
1087 value.nData = varDataLen(cv.val);
[Current thread is 1 (Thread 0x7f48affe2700 (LWP 10641))]
(gdb) #0 0x00000000008dd7ca in tTSRowGetVal (pRow=0x7f48bdfff2f8, pTSchema=0x7f4734010bf0, iCol=<optimized out>, pColVal=0x7f48affe16a0) at /root/tdengine/source/common/src/trow.c:1087
#1 0x000000000071d305 in doAppendRowFromTSRow (pBlock=0x2, pReader=0x7f4734003418, pTSRow=0x7f48bdfff2f8, uid=<optimized out>) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3363
#2 0x000000000071c63e in buildDataBlockFromBufImpl (pBlockScanInfo=0x7f473400ff58, endKey=9223372036854775807, capacity=4096, pReader=0x7f4734003240) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3446
#3 buildDataBlockFromBuf (pReader=0x7f4734003240, pBlockScanInfo=0x7f473400ff58, endKey=9223372036854775807) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:1442
#4 0x0000000000713667 in buildBlockFromBufferSequentially (pReader=0x7f4734003240) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:2666
#5 doTsdbNextDataBlock (pReader=0x7f4734003240) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3745
#6 0x0000000000712dc2 in tsdbNextDataBlock (pReader=0x7f4734003240) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3777
#7 0x000000000058fd47 in doTableScanImpl (pOperator=0x7f4734002c50) at /root/tdengine/source/libs/executor/src/scanoperator.c:633
#8 0x000000000059b623 in doTableScanGroup (pOperator=0x7f4734002c50) at /root/tdengine/source/libs/executor/src/scanoperator.c:693
#9 0x000000000058f890 in doTableScan (pOperator=0x7f4734002c50) at /root/tdengine/source/libs/executor/src/scanoperator.c:787
#10 0x000000000057385d in qExecTaskOpt (tinfo=0x7f4734001dc0, pResList=0x7f47340031d0, useconds=0x7f48affe1a38, hasMore=0x7f48affe19f6, pLocal=<optimized out>) at /root/tdengine/source/libs/executor/src/executor.c:577
#11 0x00000000005e4183 in qwExecTask (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, ctx=<optimized out>, queryStop=<optimized out>) at /root/tdengine/source/libs/qworker/src/qworker.c:129
#12 0x00000000005e88ba in qwProcessQuery (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, qwMsg=<optimized out>, sql=<error reading variable: Cannot access memory at address 0x0>) at /root/tdengine/source/libs/qworker/src/qworker.c:637
#13 0x00000000005dd81a in qWorkerProcessQueryMsg (node=0x7f48affe1cc0, qWorkerMgmt=0x7f48c0252500, pMsg=<optimized out>, ts=<optimized out>) at /root/tdengine/source/libs/qworker/src/qwMsg.c:402
#14 0x00000000004f9b94 in vnodeProcessQueryMsg (pVnode=0x7f48c0120090, pMsg=0x7f48f4005680) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:346
#15 0x0000000000468752 in vmProcessQueryQueue (pInfo=<optimized out>, pMsg=0x7f48f4005680) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:69
#16 0x0000000000925d20 in tQWorkerThreadFp (worker=0x3280520) at /root/tdengine/source/util/src/tworker.c:87
#17 0x00007f492c19c609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#18 0x00007f492c0b1133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
