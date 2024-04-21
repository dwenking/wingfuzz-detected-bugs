create table sav_stb (ts timestamp, c1 int, c2 bigint, c3 float, c4 double, c5 smallint, c6 tinyint, c7 bool, c8 binary(10), c9 nchar(10)) tags(t1 int, t2 int);;
create table tb using sav_stb tags( 2 , 0 );
insert into tb (ts, a) values (now, 1);;
insert into tb (ts, a) values (now, 1);
create table i using sav_stb tags( 6 , 0 );
insert into tb (ts, a) values (now, 1);;
create table sqlsim0 using sav_stb tags( 7 , 0 );
create table test1 using sav_stb tags( 8 , 0 );
create table c6 using sav_stb tags( 9 , 0 );;
create table lm_tb4 using sav_stb tags( 10 , 0 );
insert into sqlsim0 (sqlsim1, sqlsim2) values (now, 1);;
insert into tb (ts, a) values (now, 1);
insert into c6 (c8, c9) values (now, 1);

/*


#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7f5280ff9700 (LWP 62516))]
(gdb) bt
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007f528dae292e in __GI_abort () at abort.c:100
#2  0x00007f528dae2729 in __assert_fail_base (fmt=0x7f528dc78588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x7f528e3ba6f9 "0", file=0x7f528e3b9579 "/root/tdengine/source/common/src/trow.c", 
    line=722, function=<optimized out>) at assert.c:92
#3  0x00007f528daf3fd6 in __GI___assert_fail (assertion=0x7f528e3ba6f9 "0", file=0x7f528e3b9579 "/root/tdengine/source/common/src/trow.c", line=722, 
    function=0x7f528e3b9826 "int32_t tdAppendColValToKvRow(SRowBuilder *, TDRowValT, const void *, _Bool, int8_t, int16_t, int32_t, col_id_t)") at assert.c:101
#4  0x00007f528dfb44b6 in tdAppendColValToKvRow (pBuilder=<optimized out>, valType=<optimized out>, val=0x7f51f4006489, isCopyVarData=<optimized out>, colType=0 '\000', colIdx=-16288, offset=0, colId=9)
    at /root/tdengine/source/common/src/trow.c:722
#5  0x00007f528dfb33ce in tdAppendColValToRow (pBuilder=0x2, colId=<optimized out>, colType=<optimized out>, valType=<optimized out>, val=<optimized out>, isCopyVarData=<optimized out>, 
    offset=<optimized out>, colIdx=<optimized out>) at /root/tdengine/source/common/src/trow.c:714
#6  0x00007f528e001e7f in insMemRowAppend (pMsgBuf=<optimized out>, value=<optimized out>, len=<optimized out>, param=0x7f5280fec638) at /root/tdengine/source/libs/parser/src/parInsertUtil.c:955
#7  0x00007f528e036f22 in parseValueToken (end=0x7f5280feca98, pToken=0x7f5280fec5f0, pSchema=<optimized out>, timePrec=<optimized out>, tmpTokenBuf=0x7f5280fecc49 "", func=<optimized out>, 
    param=<optimized out>, pMsgBuf=0x7f5280fecaa0) at /root/tdengine/source/libs/parser/src/parInsertSql.c:352
#8  parseOneRow (pCxt=<optimized out>, pDataBlocks=0x7f51f40024d0, timePrec=0, gotRow=0x7f5280fec6db, tmpTokenBuf=<optimized out>) at /root/tdengine/source/libs/parser/src/parInsertSql.c:953
#9  0x00007f528e030f91 in parseValues (pCxt=0x7f5280feca90, pDataBlock=0x7f51f40024d0, maxRows=46, numOfRows=<optimized out>) at /root/tdengine/source/libs/parser/src/parInsertSql.c:1042
#10 parseValuesClause (pCxt=0x7f5280feca90, dataBuf=0x7f51f40024d0) at /root/tdengine/source/libs/parser/src/parInsertSql.c:1070
#11 parseInsertBody (pCxt=<optimized out>) at /root/tdengine/source/libs/parser/src/parInsertSql.c:1323
#12 0x00007f528e02fe9d in parseInsertSql (pContext=0x7f52183102a0, pQuery=0x7f5280ff8c98, pMetaCache=<optimized out>) at /root/tdengine/source/libs/parser/src/parInsertSql.c:1479
#13 0x00007f528e02b9e4 in qAnalyseSqlSemantic (pCxt=0x7f52183102a0, pCatalogReq=0x7f52183107f0, pMetaData=0x7f5218324458, pQuery=0x7f5218316ad1) at /root/tdengine/source/libs/parser/src/parser.c:206
#14 0x00007f528dee0123 in retrieveMetaCallback (pResultMeta=0x7f5218324458, param=0x7f5218319e20, code=0) at /root/tdengine/source/client/src/clientMain.c:698
#15 0x00007f528e08ac32 in ctgCallUserCb (param=0x7f5218324430) at /root/tdengine/source/libs/catalog/src/ctgAsync.c:896
#16 0x00007f528e108f98 in execHelper (pSchedMsg=0x7f5280ff8e00) at /root/tdengine/source/libs/qcom/src/queryUtil.c:122
#17 0x00007f528df367c1 in taosProcessSchedQueue (scheduler=0x7f528e516a58 <pTaskQueue>) at /root/tdengine/source/util/src/tsched.c:166
#18 0x00007f528dcca609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#19 0x00007f528dbdf133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
