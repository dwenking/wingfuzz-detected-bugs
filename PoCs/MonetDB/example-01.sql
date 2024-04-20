CREATE TABLE t2 (c1 int, t1 int, c2 int);
INSERT INTO t2 VALUES(127,255,1),(127,1,2),(-128,0,3),(-128,2,4),(-1,NULL,5);
INSERT INTO t2 VALUES(200,126,1),(250,-127,2);
INSERT INTO t2 VALUES (-128,0,1),(-1,1,1),(-2,2,2),(-3,3,3),(-4,4,4),(-5,5,5),(-6,6,6),(0,0,7),(1,1,8),(2,NULL,9),(3,NULL,10),(127,255,11);
DELETE FROM t2 WHERE c1 IN (-2, 0);
START TRANSACTION;
UPDATE t2 SET c2 = c2 + 100;
UPDATE t2 SET c2 = c2 + 100;

/*
#0 0x7f6388374871 (cs_bind_ubat+0x151)
#1 0x7f6388373483 (bind_ubat+0x43)
#2 0x7f638836d860 (bind_updates+0xe0)
#3 0x7f63882854ce (mvc_bind_wrap+0x28e)
#4 0x7f6388614c63 (runMALsequence+0x763)
#5 0x7f63886185d4 (DFLOWworker+0x2c4)
#6 0x7f6388d4fba0 (THRstarter+0x100)
#7 0x7f6388dbfcc4 (thread_starter+0x34)
#8 0x7f6388134609 (start_thread+0xd9)
#9 0x7f6388059133 (clone+0x43)
*/
