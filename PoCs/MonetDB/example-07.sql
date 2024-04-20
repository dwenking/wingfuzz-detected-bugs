CREATE TABLE v0 ( v1 SMALLINT ) ;
 INSERT INTO v0 SELECT 0 FROM generate_series(1, 1000000);
 SELECT NULL , v1 FROM v0 v0 ORDER BY v1 + v1 , v1 , -1 LIMIT 2147483647 ;

/*
 #0 0x7f5d6dcba2a0 (intCmp+0x0)
 #1 0x7f5d6d81f946 (BATselect+0x166)
 #2 0x7f5d6ddc0c40 (BATfirstn+0x47a0)
 #3 0x7f5d6d675e02 (ALGfirstn+0x1a2)
 #4 0x7f5d6d59b4a9 (runMALsequence+0x889)
 #5 0x7f5d6d59ebc4 (DFLOWworker+0x2b4)
 #6 0x7f5d6dcb71fb (THRstarter+0xeb)
 #7 0x7f5d6dd24c67 (thread_starter+0x27)
 #8 0x7f5d6d0dc609 (start_thread+0xd9)
 #9 0x7f5d6d001133 (clone+0x43)
*/
