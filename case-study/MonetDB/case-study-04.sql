create schema test;
drop schema test cascade;
create schema test;
set schema test;
CREATE TABLE test (sect int NOT NULL auto_increment, PRIMARY KEY (sect));
create trigger count after delete on test for each row insert into test values (1);
delete from test;

/*
#0 0x7f76ea76ebee (__nss_database_lookup+0x2078e)
#1 0x7f76eadf66fd (OPTemptybindImplementation+0x4fd)
#2 0x7f76eae124f1 (OPTwrapper+0x191)
#3 0x7f76eacdae23 (optimizeMALBlock+0x1a3)
#4 0x7f76ea98391f (SQLoptimizeQuery+0x1df)
#5 0x7f76ea94c57b (SQLparser+0x7eb)
#6 0x7f76ea94b87b (SQLengine_+0x59b)
#7 0x7f76ea94a343 (SQLengine+0x23)
#8 0x7f76eacd96cf (runScenario+0x4f)
#9 0x7f76eacda16c (MSscheduleClient+0x68c)
#10 0x7f76ead81c2b (doChallenge+0xfb)
#11 0x7f76eb400ba0 (THRstarter+0x100)
#12 0x7f76eb470cc4 (thread_starter+0x34)
#13 0x7f76ea7e5609 (start_thread+0xd9)
#14 0x7f76ea70a133 (clone+0x43)
*/
