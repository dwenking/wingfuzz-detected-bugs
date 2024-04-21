START TRANSACTION;
CREATE TEMPORARY TABLE t1 (keyc INT, c1 VARCHAR(100), c2 VARCHAR(100), PRIMARY KEY(keyc));
CREATE TABLE c1(c2 DECIMAL(9,4) NOT NULL);
SAVEPOINT a_a;
TRUNCATE TABLE t1;
DELETE FROM w;
COMMIT;
SELECT 1;

/*
#0 0x7ff2e7285dd6 (gc_col+0x26)
#1 0x7ff2e7282cd5 (tc_gc_col+0x15)
#2 0x7ff2e7251307 (store_pending_changes+0x307)
#3 0x7ff2e7255a87 (sql_trans_commit+0x567)
#4 0x7ff2e7260353 (sql_trans_end+0x83)
#5 0x7ff2e72a310c (mvc_commit+0x4fc)
#6 0x7ff2e71a4564 (SQLengine_+0x284)
#7 0x7ff2e71a3343 (SQLengine+0x23)
#8 0x7ff2e75326cf (runScenario+0x4f)
#9 0x7ff2e753316c (MSscheduleClient+0x68c)
#10 0x7ff2e75dac2b (doChallenge+0xfb)
#11 0x7ff2e7c59ba0 (THRstarter+0x100)
#12 0x7ff2e7cc9cc4 (thread_starter+0x34)
#13 0x7ff2e703e609 (start_thread+0xd9)
#14 0x7ff2e6f63133 (clone+0x43)
*/
