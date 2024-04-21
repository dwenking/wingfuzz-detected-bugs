# Wingfuzz Detected Bugs

We propose WingFuzz which implements continuous fuzzing for DBMSs. It utilizes specification-based mutator construction, corpus-driven evolving code fuzzing, and noise-resilient anomaly assessment to address the obstacles. 
First, the framework automatically generates a unique query parser for each DBMS by following the DBMS grammar specifications. It then performs long-term concurrent fuzzing, using generated test cases for commit fuzzing and integrating fixed anomalies into regression tests. The framework also monitors and isolates anomaly threads to capture detailed data. Identified anomalies are de-duplicated and reported to developers for quick resolution, improving the system's robustness.

Until our submission, WingFuzz has reported 236 bugs in total on the tested DBMSs, including ClickHouse, DamengDB, MariaDB, MonetDB, MySQL, PostgreSQL, PolarDB, SQLite, TDengine, TenDB, VastBase-G100, and YashanDB in the submitted manuscript.
From submission until now, we have also adapted WingFuzz to test 4 more DBMS including Virtuoso, Oceanbase, GaussDB, and Comdb2, and have found 164 more bugs in total.

## Bug Details 

### 236 Bugs in Different Database Components

We classify the bugs based on the localized component. As the table below shows, 89, 59, 38, and 33 bugs are due to errors in the optimizer, parser, executor, and storage engine. 23 are caused by errors in other components like loggers. 

| Component     | Optimizer | Parser | Executor | Storage-Engine | Others  |
|---------------|-----------|--------|----------|----------------|---------|
| ClickHouse    | 11        | 5      | 5        | 3              | 7       |
| DamengDB      | 31        | 10     | 7        | 14             | 8       |
| MariaDB       | 4         | 3      | 3        | 0              | 0       |
| MonetDB       | 3         | 6      | 2        | 0              | 1       |
| MySQL         | 2         | 2      | 3        | 2              | 0       |
| PostgreSQL    | 1         | 0      | 1        | 0              | 0       |
| PolarDB       | 8         | 4      | 6        | 2              | 0       |
| SQLite        | 3         | 7      | 3        | 3              | 1       |
| TDengine      | 7         | 7      | 4        | 3              | 3       |
| TenDB         | 8         | 5      | 2        | 3              | 0       |
| VastBase-G100 | 8         | 8      | 2        | 2              | 3       |
| YashanDB      | 3         | 2      | 0        | 1              | 0       |
| Total         | 89        | 59     | 38       | 33             | 23      |

### 236 Bugs in Different Types and Root Cause

We also classify the bugs based on the types and root causes. As the table below shows, among the 236 identified bugs, there are 31 buffer overflows, 133 segmentation violations, and 29 use-after-frees. These vulnerabilities are particularly severe as they could serve as effective attack vectors for executing arbitrary code. Specifically, attackers could exploit these vulnerabilities to take control of a DBMS server over the network, potentially leading to system control or privilege escalation. These bugs could significantly compromise the availability of the DBMS server. Additionally, WingFuzz also finds 7 null pointer dereferences, 30 assertion failures, and 6 cases of undefined behavior. These errors, primarily internal to the DBMSs, could lead to denial-of-service by causing the DBMS to crash or result in other unforeseen damages.

| Root Cause    | Buffer-Overflow | Segmentation Violation | Use-After-Free | Null Pointer Dereference | Undefined Behavior | Assertion Failure | Total |
| ------------- | --------------- | ---------------------- | -------------- | ------------------------ | ------------------ | ----------------- | ----- |
| ClickHouse    | 1               | 28                     | 0              | 0                        | 0                  | 2                 | 31    |
| DamengDB      | 11              | 27                     | 8              | 0                        | 0                  | 14                | 60    |
| MariaDB       | 0               | 8                      | 2              | 0                        | 0                  | 0                 | 10    |
| MonetDB       | 3               | 8                      | 1              | 0                        | 0                  | 0                 | 12    |
| MySQL         | 3               | 8                      | 0              | 0                        | 0                  | 0                 | 11    |
| PostgreSQL    | 3               | 0                      | 0              | 0                        | 0                  | 0                 | 3     |
| PolarDB       | 0               | 9                      | 7              | 3                        | 0                  | 2                 | 21    |
| SQLite        | 0               | 9                      | 0              | 2                        | 0                  | 6                 | 17    |
| TDengine      | 8               | 12                     | 0              | 0                        | 2                  | 2                 | 24    |
| TenDB         | 0               | 14                     | 3              | 1                        | 0                  | 0                 | 18    |
| VastBase-G100 | 0               | 10                     | 8              | 0                        | 3                  | 2                 | 23    |
| YashanDB      | 2               | 0                      | 0              | 1                        | 1                  | 2                 | 6     |
| Total         | 31              | 133                    | 29             | 7                        | 6                  | 30                | 236   |


### Adaption to Other Databases After Submission

Furthermore, WingFuzz has been integrated into detecting more bugs across more databases, identifying 164 bugs. 

|           | Buffer-Overflow | Segmentation Violation | Use-After-Free | Null Pointer Dereference | Undefined Behavior | Assertion Failure | Total |
| --------- | --------------- | ---------------------- | -------------- | ------------------------ | ------------------ | ----------------- | ----- |
| Virtuoso  | 23              | 39                     | 4              | 30                       | 0                  | 0                 | 96    |
| Comdb2    | 4               | 6                      | 1              | 0                        | 22                 | 0                 | 33    |
| GaussDB   | 1               | 3                      | 0              | 1                        | 26                 | 1                 | 32    |
| OceanBase | 0               | 3                      | 0              | 0                        | 0                  | 0                 | 3     |
| Total     | 28              | 51                     | 5              | 31                       | 48                 | 1                 | 164   |

## Case Study of Selected Bugs

First, we select 6 bugs to illustrate the different root causes of our detected bugs.

### Case Study 1: A buffer overflow in MonetDB by complex comparison expressions in queries.

When using the complex nested comparison expression with the WITH clause on a table in MonetDB, the optimizer of MonetDB triggers a buffer overflow while optimizing these comparisons.

```sql
CREATE TABLE v0 ( v1 SMALLINT ) ; 
UPDATE v0 SET v1 = v1 <= ( WITH v0 ( v1 ) AS ( SELECT ( CASE WHEN 59 THEN ( 0 * ( ( 'x' < v1 = 255 > v1 - v1 ) ) ) END ) ) SELECT v1 > 16 OR v1 > 2147483647 AND v1 >= 27 AS v4 FROM v0 ORDER BY v1 > v1 % v1 % ( v1 ) NULLS LAST ) OR v1 > -1 ; 
```

*The root cause of the bug.* To optimize the complex expression in the UPDATE statement, MonetDB tries to rewrite the comparison by reconstructing the AST nodes. However, when meeting the nested comparisons, a wrong type of AST node was bound to the expression, which caused the buffer overflow in further processing.

### Case Study 2: A segmentation violation in DamengDB with CREATE VIEW. 

When creating view v1 from a table, creating view v2 from v1 with the check option in DamengDB enabled, and inserting data into v2, the server crashes due to a segmentation violation, leading to denial of service.

```sql
CREATE TABLE t1 (c1 INT);
CREATE VIEW v1 AS SELECT * FROM t1 WITH CHECK OPTION;
CREATE VIEW v2 AS SELECT * FROM v1 WITH CHECK OPTION;
INSERT INTO v2 VALUES (15);
```

*The root cause of the bug.* DamengDB wrongly handled the insertion operations on the nested views. View v2 is read-only because it is constructed by another view. However, the DamengDB incorrectly identified the readability of this view and still attempted to insert data into it, which caused the segmentation fault.

### Case Study 3: A use-after-free in MonetDB when truncating temporary tables.

In MonetDB, when creating a temporary table within a transaction and truncating the temporary table, the MonetDB server will trigger a use-after-free when rolling back or committing the transaction.

```sql
START TRANSACTION;
CREATE TEMPORARY TABLE t1 (keyc INT, c1 VARCHAR(100), c2 VARCHAR(100), PRIMARY KEY(keyc)) on commit delete rows;
CREATE TABLE c1(c2 DECIMAL(9,4) NOT NULL);
SAVEPOINT a_a;
TRUNCATE TABLE t1;
DELETE FROM w;
ROLLBACK;
SELECT 1;
```

*The root cause of the bug.* When executing the test case, the statement `TRUNCATE TABLE t1` operated the truncation operation, which freed the resource of the temporary table. However, it forgot to set the flag representing the finished truncation. When committing or rollbacking the transaction, the temporary table was attempted to truncate again, which caused the already-freed resource to be accessed again, leading to use-after-free.

### Case Study 4: A null pointer dereference caused by empty arguments of MariaDB’s AES_ENCRYPT function. 

As the PoC below shows, a user can crash the whole MariaDB server by simply calling the AES_ENCRYPT function without any arguments, leading to a denial of service. The triggering of the crash does not rely on any table creation or data insertion.

```sql
SELECT AES_ENCRYPT ( );
```

*The root cause of the bug.* The bug is introduced in MariaDB 11.2 when the grammar of optional arguments for the AES_ENCRYPT function is supported. The code for parsing the function AES_ENCRYPT is completely rewritten to support this new grammar. However, the rewritten code does not account for the function call without arguments, leading to a null pointer dereference.

### Case Study 5: An undefined behavior (integer overflow) in MonetDB when calling SQL function levenshtein(). 

When passing two large strings to the function levenshtein(), a piece of code in MonetDB that calculated the array length triggers an integer overflow. If execution continued, this led to array out-of-bounds access and then the DBMS crashed.
```sql
CREATE TABLE v0 ( v1 CHAR ( 100 ) );
 INSERT INTO v0 VALUES ( 222 ) , ( 10 ) , ( 3 ) , ( 947 ) , ( 742 ) , ( 1 ) , ( 306 ) , ( 10 ) , ( 510 ) , ( 1.100000 ) , ( 9223372036854775807 ) , ( 333 ) , ( 106 ) , ( 10 ) , ( 10 ) , ( 10 ) , ( 10 ) , ( 10 ) , ( NULL ) , ( 222 ) , ( 10.100000 ) , ( 5 ) , ( 2 ) , ( 1 ) , ( 2 ) , ( 34 ) ; 
 INSERT INTO v0 ( v1 ) SELECT group_concat ( 'table tn3 row 99' ) FROM v0 , v0 AS tri , v0 AS OMW WHERE 10 LIMIT 4 ; 
 SELECT levenshtein ( v1 , v1 , 16 , 10 , 561 ) , v1 , v1 FROM v0 ; 
```
*The root cause of the bug.* MonetDB uniquely supports the function levenshtein() to calculate the Damerau–Levenshtein distance between two strings. When the lengths of the two strings are m and n, MonetDB needs to allocate an array of length m×n to perform the algorithm. However, the variable used to calculate the array length was stored as a 32-bit integer, which led to an integer overflow when the lengths of the two strings were large. MonetDB fixed the bug by changing the data type from int to long.
```c++
int sz;
n = (int) strlen(s);
m = (int) strlen(t);
sz = (n + 1) * (m + 1) * sizeof(int);    /* integer overflow */
d = (int *) GDKmalloc(sz);
```

### Case Study 6: An assertion failure in MariaDB when inserting data into tables with spatial index.

When creating an InnoDB table with a SPATIAL index and inserting multiple rows of data, MariaDB will throw an assertion failure `!cursor->index->is_committed()' and raise SIGABRT.

```sql
CREATE TABLE t1(
f1 SERIAL,
f2 LINESTRING NOT NULL DEFAULT LineFromText('LINESTRING(1 1,2 2,3 3)'),
SPATIAL INDEX(f2))ENGINE=InnoDB;
INSERT INTO t1(f1) VALUES(0), (1), (2);
```
*The root cause of the bug.* When an InnoDB table contains any index, the InnoDB engine will try bulk insertion when inserting multiple rows. The bulk insertion depends on the primary key which is automatically constructed by the index. However, the SPATIAL index is a special index that never constructs the primary key. Thus, when the bulk insertion was looking for the primary key in the SPATIAL index, it triggered the assertion failure.

---

Second, more case studies can be referred to links in the following table. Note that while we have detected 400 bugs (236 until submission, and 164 after submission) in industrial databases, and many of them keep their bug information private. Therefore, we are only able to present a selection of bugs from industry databases.

| DBMS       | Case Study Link                                                                    |  | DBMS     | Case Study Link                                                                |
| ---------- | ---------------------------------------------------------------------------------- |--| -------- | ------------------------------------------------------------------------------ |
| ClickHouse | [case-study/ClickHouse/case-study-01.sql](case-study/ClickHouse/case-study-01.sql) |  | MonetDB  | [case-study/MonetDB/case-study-01.sql](case-study/MonetDB/case-study-01.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-02.sql](case-study/ClickHouse/case-study-02.sql) |  | MonetDB  | [case-study/MonetDB/case-study-02.sql](case-study/MonetDB/case-study-02.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-03.sql](case-study/ClickHouse/case-study-03.sql) |  | MonetDB  | [case-study/MonetDB/case-study-03.sql](case-study/MonetDB/case-study-03.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-04.sql](case-study/ClickHouse/case-study-04.sql) |  | MonetDB  | [case-study/MonetDB/case-study-04.sql](case-study/MonetDB/case-study-04.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-05.sql](case-study/ClickHouse/case-study-05.sql) |  | MonetDB  | [case-study/MonetDB/case-study-05.sql](case-study/MonetDB/case-study-05.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-06.sql](case-study/ClickHouse/case-study-06.sql) |  | MonetDB  | [case-study/MonetDB/case-study-06.sql](case-study/MonetDB/case-study-06.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-07.sql](case-study/ClickHouse/case-study-07.sql) |  | MonetDB  | [case-study/MonetDB/case-study-07.sql](case-study/MonetDB/case-study-07.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-08.sql](case-study/ClickHouse/case-study-08.sql) |  | MonetDB  | [case-study/MonetDB/case-study-08.sql](case-study/MonetDB/case-study-08.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-09.sql](case-study/ClickHouse/case-study-09.sql) |  | MonetDB  | [case-study/MonetDB/case-study-09.sql](case-study/MonetDB/case-study-09.sql)   |
| ClickHouse | [case-study/ClickHouse/case-study-10.sql](case-study/ClickHouse/case-study-10.sql) |  | MonetDB  | [case-study/MonetDB/case-study-10.sql](case-study/MonetDB/case-study-10.sql)   |
| DamengDB   | [case-study/DamengDB/case-study-01.sql](case-study/DamengDB/case-study-01.sql)     |  | MySQL    | [case-study/MySQL/case-study-01.sql](case-study/MySQL/case-study-01.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-02.sql](case-study/DamengDB/case-study-02.sql)     |  | MySQL    | [case-study/MySQL/case-study-02.sql](case-study/MySQL/case-study-02.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-03.sql](case-study/DamengDB/case-study-03.sql)     |  | MySQL    | [case-study/MySQL/case-study-03.sql](case-study/MySQL/case-study-03.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-04.sql](case-study/DamengDB/case-study-04.sql)     |  | MySQL    | [case-study/MySQL/case-study-04.sql](case-study/MySQL/case-study-04.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-05.sql](case-study/DamengDB/case-study-05.sql)     |  | MySQL    | [case-study/MySQL/case-study-05.sql](case-study/MySQL/case-study-05.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-06.sql](case-study/DamengDB/case-study-06.sql)     |  | MySQL    | [case-study/MySQL/case-study-06.sql](case-study/MySQL/case-study-06.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-07.sql](case-study/DamengDB/case-study-07.sql)     |  | MySQL    | [case-study/MySQL/case-study-07.sql](case-study/MySQL/case-study-07.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-08.sql](case-study/DamengDB/case-study-08.sql)     |  | MySQL    | [case-study/MySQL/case-study-08.sql](case-study/MySQL/case-study-08.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-09.sql](case-study/DamengDB/case-study-09.sql)     |  | MySQL    | [case-study/MySQL/case-study-09.sql](case-study/MySQL/case-study-09.sql)       |
| DamengDB   | [case-study/DamengDB/case-study-10.sql](case-study/DamengDB/case-study-10.sql)     |  | MySQL    | [case-study/MySQL/case-study-10.sql](case-study/MySQL/case-study-10.sql)       |
| MariaDB    | [case-study/MariaDB/case-study-01.sql](case-study/MariaDB/case-study-01.sql)       |  | TDEngine | [case-study/TDEngine/case-study-01.sql](case-study/TDEngine/case-study-01.sql) |
| MariaDB    | [case-study/MariaDB/case-study-02.sql](case-study/MariaDB/case-study-02.sql)       |  | TDEngine | [case-study/TDEngine/case-study-02.sql](case-study/TDEngine/case-study-02.sql) |
| MariaDB    | [case-study/MariaDB/case-study-03.sql](case-study/MariaDB/case-study-03.sql)       |  | TDEngine | [case-study/TDEngine/case-study-03.sql](case-study/TDEngine/case-study-03.sql) |
| MariaDB    | [case-study/MariaDB/case-study-04.sql](case-study/MariaDB/case-study-04.sql)       |  | TDEngine | [case-study/TDEngine/case-study-04.sql](case-study/TDEngine/case-study-04.sql) |
| MariaDB    | [case-study/MariaDB/case-study-05.sql](case-study/MariaDB/case-study-05.sql)       |  | TDEngine | [case-study/TDEngine/case-study-05.sql](case-study/TDEngine/case-study-05.sql) |
| MariaDB    | [case-study/MariaDB/case-study-06.sql](case-study/MariaDB/case-study-06.sql)       |  | TDEngine | [case-study/TDEngine/case-study-06.sql](case-study/TDEngine/case-study-06.sql) |
| MariaDB    | [case-study/MariaDB/case-study-07.sql](case-study/MariaDB/case-study-07.sql)       |  | TDEngine | [case-study/TDEngine/case-study-07.sql](case-study/TDEngine/case-study-07.sql) |
| MariaDB    | [case-study/MariaDB/case-study-08.sql](case-study/MariaDB/case-study-08.sql)       |  | TDEngine | [case-study/TDEngine/case-study-08.sql](case-study/TDEngine/case-study-08.sql) |
| MariaDB    | [case-study/MariaDB/case-study-09.sql](case-study/MariaDB/case-study-09.sql)       |  | TDEngine | [case-study/TDEngine/case-study-09.sql](case-study/TDEngine/case-study-09.sql) |
| MariaDB    | [case-study/MariaDB/case-study-10.sql](case-study/MariaDB/case-study-10.sql)       |  | TDEngine | [case-study/TDEngine/case-study-10.sql](case-study/TDEngine/case-study-10.sql) |
