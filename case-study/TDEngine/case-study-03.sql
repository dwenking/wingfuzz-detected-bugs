create table st(ts timestamp, c1 int, c2 nchar(10)) tags(t1 int, t2 binary(10));CREATE TABLE ac_stb (TS TIMESTAMP, C1 INT, C2 BIGINT, C3 FLOAT, C4 DOUBLE, C5 BINARY(10), C6 BOOL, C7 SMALLINT, C8 TINYINT, C9 NCHAR(10)) TAGS (T1 INT);create table tb1 (ts timestamp, i int);
create table ctb0 using st tags(1, 'beijing');
insert into ctb0 values(now-28d, -28);
insert into ctb0 using ac_stb tags (1) values ( 1537146001000 , 1,1,1,1,'bin',1,1,1,'________') ( 1537146002000 , 2,2,2,2,'binar', 1,1,1,'nchar');
insert into ntb0 using ac_stb tags (-1) values ( 1537146001000 , 1,1,1,1,'bin',1,1,1,'________') ( 1537146002000 , 2,2,2,2,'binar', 1,1,1,'nchar');
insert into ntb0 using ac_stb tags (2) values ( 1537146003000 , 1,1,1,1,'bin',1,1,1,'________') ( 1537146004000 , 2,2,2,2,'binar', 1,1,1,'nchar');
insert into ctb6 using ac_stb tags(1) values ( 1537146000000 , 1, 1, 1, 1, 'bin1', 1, 1, 1, '________1') ctb6 using ac_stb tags(2) values ( 1537146000000 , 2, 2, 2, 2, 'bin2', 2, 2, 2, '________2') ctb6 using ac_stb tags(3) values ( 1537146000000 , 3, 3, 3, 3, 'bin3', 3, 3, 3, '________3');
select last_row(*) from tb1;
select * from ta_cr_mt3 where tgcol = 1;
select c1,c1,c2,c3,c4,c5,c7,c8,c9 from ac_stb;
kill transaction 2;
select t1, count(*), first(c9) from ac_stb partition by t1 order by t1 asc slimit 3;
import into ctb0 values(1520000010004, 4);
insert into ctb0 values(now-19d, -19, 6, 3, 0);
import into ntb0 values(1520000010007, 7);
select last_row(*) from ctb6;
select * from ctb0 order by c1 asc;;
create table txu using tb1 tags(0) values(now, 1);;
insert into ntb0 values(now-13d, -13, 12, 11, 10, 9, 8);
select * from ctb6;
select * from ctb0 order by c2 asc;
insert into ctb6 values(now-7d, -7, 18, 17, 16, 15, 14, 13, '11');

/*


#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7eff8a7ed700 (LWP 1116))]
(gdb) bt
#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1 0x00007efffd33d92e in __GI_abort () at abort.c:100
#2 0x00007efffd33d729 in __assert_fail_base (fmt=0x7efffd4d3588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x9a3207 "pColVal->value.nData <= pColInfoData->info.bytes", 
file=0x9a2595 "/root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c", line=690, function=<optimized out>) at assert.c:92
#3 0x00007efffd34efd6 in __GI___assert_fail (assertion=0x9a3207 "pColVal->value.nData <= pColInfoData->info.bytes", file=0x9a2595 "/root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c", line=690, 
function=0x9a3238 "void doCopyColVal(SColumnInfoData *, int32_t, int32_t, SColVal *, SBlockLoadSuppInfo *)") at assert.c:101
#4 0x000000000071d77d in doCopyColVal (pColInfoData=0x7efeb8005b20, rowIndex=0, colIndex=<optimized out>, pColVal=<optimized out>, pSup=0x7efeb8005538) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:690
#5 0x000000000071d31c in doAppendRowFromTSRow (pBlock=0x3, pReader=0x7efeb8005538, pTSRow=0x7efef1ecc180, uid=<optimized out>) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3364
#6 0x000000000071c63e in buildDataBlockFromBufImpl (pBlockScanInfo=0x7efeb8016578, endKey=9223372036854775807, capacity=4096, pReader=0x7efeb8005360) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3446
#7 buildDataBlockFromBuf (pReader=0x7efeb8005360, pBlockScanInfo=0x7efeb8016578, endKey=9223372036854775807) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:1442
#8 0x0000000000713667 in buildBlockFromBufferSequentially (pReader=0x7efeb8005360) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:2666
#9 doTsdbNextDataBlock (pReader=0x7efeb8005360) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3745
#10 0x0000000000712dc2 in tsdbNextDataBlock (pReader=0x7efeb8005360) at /root/tdengine/source/dnode/vnode/src/tsdb/tsdbRead.c:3777
#11 0x000000000058fd47 in doTableScanImpl (pOperator=0x7efeb80045c0) at /root/tdengine/source/libs/executor/src/scanoperator.c:633
#12 0x000000000059b623 in doTableScanGroup (pOperator=0x7efeb80045c0) at /root/tdengine/source/libs/executor/src/scanoperator.c:693
#13 0x000000000058f890 in doTableScan (pOperator=0x7efeb80045c0) at /root/tdengine/source/libs/executor/src/scanoperator.c:787
#14 0x00000000005ce13d in createInitialSources (pHandle=0x7efeb80051f0) at /root/tdengine/source/libs/executor/src/tsort.c:609
#15 tsortOpen (pHandle=0x7efeb80051f0) at /root/tdengine/source/libs/executor/src/tsort.c:691
#16 0x00000000005a116b in doOpenSortOperator (pOperator=0x7efeb8004af0) at /root/tdengine/source/libs/executor/src/sortoperator.c:182
#17 0x00000000005a12bc in doSort (pOperator=0x7efeb8004af0) at /root/tdengine/source/libs/executor/src/sortoperator.c:204
#18 0x000000000057385d in qExecTaskOpt (tinfo=0x7efeb80035e0, pResList=0x7efeb8003eb0, useconds=0x7eff8a7eca38, hasMore=0x7eff8a7ec9f6, pLocal=<optimized out>) at /root/tdengine/source/libs/executor/src/executor.c:577
#19 0x00000000005e4183 in qwExecTask (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, ctx=<optimized out>, queryStop=<optimized out>)
at /root/tdengine/source/libs/qworker/src/qworker.c:129
#20 0x00000000005e88ba in qwProcessQuery (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, qwMsg=<optimized out>, 
sql=<error reading variable: Cannot access memory at address 0x0>) at /root/tdengine/source/libs/qworker/src/qworker.c:637
#21 0x00000000005dd81a in qWorkerProcessQueryMsg (node=0x7eff8a7eccc0, qWorkerMgmt=0x7eff9c250a00, pMsg=<optimized out>, ts=<optimized out>) at /root/tdengine/source/libs/qworker/src/qwMsg.c:402
#22 0x00000000004f9b94 in vnodeProcessQueryMsg (pVnode=0x7eff9c2c33a0, pMsg=0x7effc8069b40) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:346
#23 0x0000000000468752 in vmProcessQueryQueue (pInfo=<optimized out>, pMsg=0x7effc8069b40) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:69
#24 0x0000000000925d20 in tQWorkerThreadFp (worker=0x3c5a468) at /root/tdengine/source/util/src/tworker.c:87
#25 0x00007efffd525609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#26 0x00007efffd43a133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

*/
