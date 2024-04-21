insert into test using stb (t3) tags (3.3) values ( now + 3s, 'binary3', 3, 3.3);
select * from information_schema.ins_dnodes;
create table test (ts timestamp, f1 int);
create table st_ct_3 using stb tags (1, 1);
import into test values (1520000009996, 1) (1520000009997, 2) (1520000009998, 3) (1520000009999, 4) (1520000010000, 5) (1520000010001, 6) (1520000010002, 7) (1520000010003, 8) (1520000010004, 9) (1520000010005, 10) (1520000010006, 11) (1520000010007, 12) (1520000010008, 13) (1520000010009, 14) (1520000010010, 15) (1520000010011, 16) (1520000010012, 17) (1520000010013, 18) (1520000010014, 19) (1520000010015, 20) (1520000010016, 21) (1520000010017, 22) (1520000010018, 23) (1520000010019, 24) (1520000010020, 25) (1520000010021, 26) (1520000010022, 27) (1520000010023, 28) (1520000010024, 29) (1520000010025, 30);
insert into c12 (c123, c12345, c1234) using stb (t1, t2) tags ('tag4', 4) values ( now + 4s, 'binary4', 4);
select * from test;
insert into test values(now-24d, -24, 1);
alter table test add column st_ct_1 tinyint;
alter table test add column st_ct_2 bigint;
select * from information_schema.ins_mnodes;
describe db_test.st;
select count(st_ct_2) from test;
insert into tb14 using stb () tags (2) values ( now + 2s, 'binary2', 2, 2.2);
alter table stb add tag tnc nchar(10);
insert into test values(now-10d, -10, 15, 0, 0, 0, 0, 0);
select count(f1) from test;
insert into tb18 (ts, c1, c3) using stb tags ('tag5', 16) values ( now + 5s, 'binary6', 6.6);
alter table test add column st_ct_3 binary(10);
insert into test values(now-6d, -6, 19, 1, 1, 1, 1, 1, '1');

create table stby (ts timestamp, c1 binary(10), c2 int, c3 float) tags (t1 binary(10), t2 int, t3 float);
insert into c1 using stby (t2) tags (2) values ( now + 2s, 'binary2', 2, 2.2);
insert into c123 using stby (t3) tags (3.3) values ( now + 3s, 'binary3', 3, 3.3);
create table stbx (st_ct_5 timestamp, c1 binary(10), i int, c12 float) tags (t1 binary(10), t2 int, t3 float);
insert into tb4 (tb12, fts, tb13, fint) using stby tags ('tag5', 7, 11.11) values ( now + 5s, 'binary7', 7, 7.7);
insert into fusmall (fuint, ffloat, fubig, lm_cn_tb0) using stby tags ('tag5', 7, 11.11) values ( now + 5s, 'binary7', 7, 7.7);
select * from stby order by ts asc;
alter table test set tag st_ct_3 = 'abcd1';

/*


#0 0x00000000005050f0 in metaUpdateTableTagVal (pMeta=0x7f89f42c3220, version=9, pAlterTbReq=0x7f891cffb990) at /root/tdengine/source/dnode/vnode/src/meta/metaTable.c:973
973 tdbTbGet(pMeta->pTbDb, &((STbDbKey){.uid = ctbEntry.ctbEntry.suid, .version = ((SUidIdxVal *)pVal)[0].version}),
[Current thread is 1 (Thread 0x7f891cffc700 (LWP 23764))]
(gdb) #0 0x00000000005050f0 in metaUpdateTableTagVal (pMeta=0x7f89f42c3220, version=9, pAlterTbReq=0x7f891cffb990) at /root/tdengine/source/dnode/vnode/src/meta/metaTable.c:973
#1 metaAlterTable (pMeta=0x7f89f42c3220, version=9, pReq=0x7f891cffb990, pMetaRsp=<optimized out>) at /root/tdengine/source/dnode/vnode/src/meta/metaTable.c:1175
#2 0x00000000004f7138 in vnodeProcessAlterTbReq (pVnode=0x7f89f42be280, version=9, pReq=0x7f8a1c0ca2fb, len=32, pRsp=0x7f891cffbca0) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:714
#3 vnodeProcessWriteMsg (pVnode=0x7f89f42be280, pMsg=<optimized out>, version=9, pRsp=<optimized out>) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:206
#4 0x00000000004faf72 in vnodeHandleWriteMsg (pVnode=0x7f89f42be280, pMsg=0x7f8a1c0ca350) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSync.c:75
#5 vnodeProposeBatchMsg (pVnode=0x7f89f42be280, pMsgArr=<optimized out>, pIsWeakArr=<optimized out>, arrSize=<optimized out>) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSync.c:113
#6 0x00000000004faa67 in vnodeProposeWriteMsg (pInfo=<optimized out>, qall=<optimized out>, numOfMsgs=<optimized out>) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSync.c:189
#7 0x0000000000926832 in tWWorkerThreadFp (worker=0x2980468) at /root/tdengine/source/util/src/tworker.c:206
#8 0x00007f8a55f47609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#9 0x00007f8a55e5c133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

*/
