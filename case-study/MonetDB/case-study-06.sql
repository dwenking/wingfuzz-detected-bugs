CREATE VIEW t2 AS SELECT 1 UNION ALL SELECT 1;
CREATE VIEW v2 AS SELECT * FROM t2;

/*
#0 0x7fc48d1c68d1 (rel_deps+0x191)
#1 0x7fc48d1c6997 (rel_deps+0x257)
#2 0x7fc48d1c670a (rel_dependencies+0x4a)
#3 0x7fc48d072b25 (create_table_or_view+0x865)
#4 0x7fc48d0aab57 (SQLcreate_view+0xe7)
#5 0x7fc48d404c63 (runMALsequence+0x763)
#6 0x7fc48d40431e (runMAL+0x9e)
#7 0x7fc48d08b9f9 (SQLrun+0xd9)
#8 0x7fc48d08cbee (SQLengineIntern+0x4e)
#9 0x7fc48d08a8c2 (SQLengine_+0x5e2)
#10 0x7fc48d089343 (SQLengine+0x23)
#11 0x7fc48d4186cf (runScenario+0x4f)
#12 0x7fc48d41916c (MSscheduleClient+0x68c)
#13 0x7fc48d4c0c2b (doChallenge+0xfb)
#14 0x7fc48db3fba0 (THRstarter+0x100)
#15 0x7fc48dbafcc4 (thread_starter+0x34)
#16 0x7fc48cf24609 (start_thread+0xd9)
#17 0x7fc48ce49133 (clone+0x43)
*/
