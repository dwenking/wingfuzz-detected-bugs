create table if not exists stb (ts timestamp, c1 int, c2 bigint, c3 float, c4 double) tags (t1 int);
create table tb1 using stb tags(1000);
create table ttm1(ts timestamp, k int) tags(a nchar(12));
create sma index sma_index_name1 on stb function(max(c1),max(c2),min(c1)) interval(5m,10s) sliding(5m) watermark 1s max_delay 1s;
insert into tb1 values (1640966400001 , 1 , 11 , 10 , -9 );
insert into tb1 values (1640966400002 , 2 , 12 , 20 , -8 );
drop stream if exists streams3;
drop stream if exists streams4;

insert into tb1 values (1640966400007 , 7 , 17 , 70 , -3 );;;
insert into tb1 values(1648791213004,4,2,3,4.1);
select * from information_schema.ins_dnodes;
select * from information_schema.ins_dnodes;
select * from information_schema.ins_dnodes;;
select * from tb1;
create table tb12 (tb13 timestamp, speed binary(20));
select * from streamt;
insert into tb12 values('2020-12-20 18:11:49.412', 1);
insert into tb12 values ('2019-10-05 18:00:07.000', "udp\"002");
insert into tb12 values ('2019-10-05 18:00:09.000', "udp'004");
insert into tb12 values(1648791223001,1,1,1,1.1);
select apercentile(f1, 50) from tb1 where ts>='2020-10-30 18:11:56.680' and ts<='2020-12-09 18:11:17.098';;
delete from tb1 where ts >= 1648791213001 and ts <= 1648791233005;
insert into tb12 values(1648791223002,2,2,2,2.1);

/*


#0 __memmove_avx_unaligned_erms () at ../sysdeps/x86_64/multiarch/memmove-vec-unaligned-erms.S:416
416 ../sysdeps/x86_64/multiarch/memmove-vec-unaligned-erms.S: No such file or directory.
[Current thread is 1 (Thread 0x7f90136de700 (LWP 38426))]
(gdb) 
(gdb) bt
#0 __memmove_avx_unaligned_erms () at ../sysdeps/x86_64/multiarch/memmove-vec-unaligned-erms.S:416
#1 0x00000000008e4aaa in taosArrayAddBatch (pArray=0x7f8fec002430, pData=0x7f90136dd660, nEles=<optimized out>) at /root/tdengine/source/util/src/tarray.c:88
#2 0x0000000000568fac in taosArrayPush (pArray=0x20, pData=<optimized out>) at /root/tdengine/include/util/tarray.h:104
#3 tqBuildDeleteReq (pVnode=0x7f90b42bfc10, stbFullName=0x7f8fb0001920 "1.test1.sma_index_name1_td_tsma_rst_tb", pDataBlock=<optimized out>, deleteReq=0x7f90136ddaf8) at /root/tdengine/source/dnode/vnode/src/tq/tqSink.c:55
#4 0x0000000000569f28 in tqBlockToSubmit (pVnode=<optimized out>, pBlocks=<optimized out>, pTSchema=<optimized out>, pTagSchemaWrapper=<optimized out>, createTb=<optimized out>, suid=<optimized out>, stbFullName=<optimized out>, pDeleteReq=<optimized out>)
at /root/tdengine/source/dnode/vnode/src/tq/tqSink.c:227
#5 0x0000000000523156 in tdProcessTSmaInsertImpl (pSma=<optimized out>, indexUid=<optimized out>, msg=0x7f90e0004cd0 "\001") at /root/tdengine/source/dnode/vnode/src/sma/smaTimeRange.c:208
#6 tdProcessTSmaInsert (pSma=0x7f90b4459820, indexUid=4447219769167546600, msg=0x7f90e0004cd0 "\001") at /root/tdengine/source/dnode/vnode/src/sma/smaTimeRange.c:31
#7 0x00000000005f4051 in streamTaskOutput (pTask=0x7f8fec001d20, pBlock=0x7f90e000b3e0) at /root/tdengine/include/libs/stream/tstream.h:392
#8 streamExecForAll (pTask=0x7f8fec001d20) at /root/tdengine/source/libs/stream/src/streamExec.c:242
#9 0x00000000005f4a87 in streamTryExec (pTask=0x7f8fec001d20) at /root/tdengine/source/libs/stream/src/streamExec.c:290
#10 0x00000000005efdc9 in streamProcessRunReq (pTask=0x7f8fec001d20) at /root/tdengine/source/libs/stream/src/stream.c:230
#11 0x0000000000560941 in tqProcessTaskRunReq (pTq=<optimized out>, pMsg=<optimized out>) at /root/tdengine/source/dnode/vnode/src/tq/tq.c:1306
#12 0x0000000000468ac8 in vmProcessStreamQueue (pInfo=0x7f90136dde20, pMsg=0x7f90e000c2f0) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:86
#13 0x0000000000925d20 in tQWorkerThreadFp (worker=0x37b2de8) at /root/tdengine/source/util/src/tworker.c:87
#14 0x00007f9114c7c609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#15 0x00007f9114b91133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
