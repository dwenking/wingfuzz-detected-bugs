DROP SCHEMA test CASCADE;
CREATE SCHEMA test;
SET SCHEMA test;
CREATE TABLE src (src_c1_pkey INT, c1 VARCHAR(100));
START TRANSACTION;
DELETE   FROM src;
ALTER TABLE src DROP src_c1_pkey;
INSERT INTO src VALUES(1,1),(2,2),(3,3),(4,4),(6,6),(7,7),(8,8),(9,9),(10,10);
COMMIT;
SET SCHEMA sys;
DROP SCHEMA test CASCADE;
CREATE SCHEMA test;

/*
#0 0x7f280338000b (gsignal+0xcb)
#1 0x7f280335f859 (abort+0x12b)
#2 0x7f28033ca26e (__fsetlocking+0x42e)
#3 0x7f28033d22fc (pthread_attr_setschedparam+0x54c)
#4 0x7f28033d3f6d (pthread_attr_setschedparam+0x21bd)
#5 0x7f280414f765 (GDKfree+0x25)
#6 0x7f280377af7b (destroy_delta+0x7b)
#7 0x7f280377576d (destroy_col+0x2d)
#8 0x7f2803745345 (column_destroy+0x45)
#9 0x7f2803761ec2 (list_destroy2+0xa2)
#10 0x7f2803760d14 (ol_destroy+0x34)
#11 0x7f2803745450 (table_destroy+0x90)
#12 0x7f280375ec17 (objectversion_destroy+0x77)
#13 0x7f280375eb4f (os_destroy+0xcf)
#14 0x7f2803750cdc (schema_destroy+0x7c)
#15 0x7f280375ec17 (objectversion_destroy+0x77)
#16 0x7f280376065d (objectversion_destroy_recursive+0x3d)
#17 0x7f2803760345 (tc_gc_objectversion+0x75)
#18 0x7f280374a307 (store_pending_changes+0x307)
#19 0x7f280374ea87 (sql_trans_commit+0x567)
#20 0x7f2803759353 (sql_trans_end+0x83)
#21 0x7f280379c10c (mvc_commit+0x4fc)
#22 0x7f280369d564 (SQLengine_+0x284)
#23 0x7f280369c343 (SQLengine+0x23)
#24 0x7f2803a2b6cf (runScenario+0x4f)
#25 0x7f2803a2c16c (MSscheduleClient+0x68c)
#26 0x7f2803ad3c2b (doChallenge+0xfb)
#27 0x7f2804152ba0 (THRstarter+0x100)
#28 0x7f28041c2cc4 (thread_starter+0x34)
#29 0x7f2803537609 (start_thread+0xd9)
#30 0x7f280345c133 (clone+0x43)
*/
