create table x (ts timestamp, y int);
select * from x join x as c on c.ts = c.ts ;

/*


#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7fafafffa700 (LWP 128718))]
(gdb) bt
#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1 0x00007fb02ba5b92e in __GI_abort () at abort.c:100
#2 0x00007fb02ba5b729 in __assert_fail_base (fmt=0x7fb02bbf1588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x98063d "col2->dataBlockId == pDownstream[0]->resultDataBlockId", 
file=0x98056a "/root/tdengine/source/libs/executor/src/joinoperator.c", line=47, function=<optimized out>) at assert.c:92
#3 0x00007fb02ba6cfd6 in __GI___assert_fail (assertion=0x98063d "col2->dataBlockId == pDownstream[0]->resultDataBlockId", file=0x98056a "/root/tdengine/source/libs/executor/src/joinoperator.c", line=47, 
function=0x9805a1 "void extractTimeCondition(SJoinOperatorInfo *, SOperatorInfo **, int32_t, SSortMergeJoinPhysiNode *)") at assert.c:101
#4 0x000000000058a364 in extractTimeCondition (pInfo=0x7faef8008390, pDownstream=0x7faef8005d90, numOfDownstream=<optimized out>, pJoinNode=<optimized out>) at /root/tdengine/source/libs/executor/src/joinoperator.c:47
#5 createMergeJoinOperatorInfo (pDownstream=0x7faef8005d90, numOfDownstream=2, pJoinNode=0x7faef8001581, pTaskInfo=0x7faef80054a0) at /root/tdengine/source/libs/executor/src/joinoperator.c:84
#6 0x0000000000582051 in createOperatorTree (pPhyNode=0x7faef8001581, pTaskInfo=<optimized out>, pHandle=0x7fafafff9cc0, pTagCond=0x0, pTagIndexCond=0x0, pUser=<optimized out>) at /root/tdengine/source/libs/executor/src/executorimpl.c:3539
#7 0x00000000005816eb in createOperatorTree (pPhyNode=0x7faef8000f11, pTaskInfo=0x7fafafff95b0, pHandle=0x7fafafff9cc0, pTagCond=0x0, pTagIndexCond=0x0, pUser=0x7faef8000c12 "root")
at /root/tdengine/source/libs/executor/src/executorimpl.c:3475
#8 0x00000000005830c4 in createExecTaskInfoImpl (pPlan=<optimized out>, pTaskInfo=0x7fafafff9b10, pHandle=0x7fafafff9cc0, taskId=3, sql=<error reading variable: Cannot access memory at address 0x0>, model=OPTR_EXEC_MODEL_BATCH)
at /root/tdengine/source/libs/executor/src/executorimpl.c:3790
#9 0x0000000000572607 in qCreateExecTask (readHandle=0x7fafafff9cc0, vgId=2, taskId=3, pSubplan=0x7faef8000ba1, pTaskInfo=0x7fafafff9b10, handle=0x7fafafff9b18, sql=0x7faef8000b60 "select * from x join x as c on c.ts = c.ts ;", 
model=OPTR_EXEC_MODEL_BATCH) at /root/tdengine/source/libs/executor/src/executor.c:447
#10 0x00000000005e8246 in qwProcessQuery (mgmt=<optimized out>, sId=<optimized out>, qId=<optimized out>, tId=<optimized out>, rId=<optimized out>, eId=<optimized out>, qwMsg=<optimized out>, sql=<optimized out>)
at /root/tdengine/source/libs/qworker/src/qworker.c:618
#11 0x00000000005dd81a in qWorkerProcessQueryMsg (node=0x7fafafff9cc0, qWorkerMgmt=0x7fafb412a150, pMsg=<optimized out>, ts=<optimized out>) at /root/tdengine/source/libs/qworker/src/qwMsg.c:402
#12 0x00000000004f9b94 in vnodeProcessQueryMsg (pVnode=0x7fafb40015e0, pMsg=0x7faff0008640) at /root/tdengine/source/dnode/vnode/src/vnd/vnodeSvr.c:346
#13 0x0000000000468752 in vmProcessQueryQueue (pInfo=<optimized out>, pMsg=0x7faff0008640) at /root/tdengine/source/dnode/mgmt/mgmt_vnode/src/vmWorker.c:69
#14 0x0000000000925d20 in tQWorkerThreadFp (worker=0x31313a8) at /root/tdengine/source/util/src/tworker.c:87
#15 0x00007fb02bc43609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#16 0x00007fb02bb58133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
