# Wingfuzz Detected Bugs

We propose WingFuzz which implements continuous fuzzing for DBMSs. It utilizes specification-based mutator construction, corpus-driven evolving code fuzzing, and noise-resilient anomaly assessment to address the obstacles. 
First, the framework automatically generates a unique query parser for each DBMS by following the DBMS grammar specifications. It then performs long-term concurrent fuzzing, using generated test cases for commit fuzzing and integrating fixed anomalies into regression tests. The framework also monitors and isolates anomaly threads to capture detailed data. Identified anomalies are de-duplicated and reported to developers for quick resolution, improving the system's robustness.

Until our submission, WingFuzz has reported 236 bugs in total on the tested DBMSs, including ClickHouse, DamengDB, MariaDB, MonetDB, MySQL, PostgreSQL, PolarDB, SQLite, TDengine, TenDB, VastBase-G100, and YashanDB in the submitted manuscript.
From submission until now, we have also adapted WingFuzz to test **xxx(TODO)** more DBMS including Virtuoso, Oceanbase, and GaussDB, and have found **xxx(TODO)** more bugs in total.

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

We also classify the bugs based on the types and root causes. As the table below shows, among the 236 identified bugs, there are 31 buffer overflows, 133 segmentation violations, 19 use-after-frees, and 10 use-after-poisons. These vulnerabilities are particularly severe as they could serve as effective attack vectors for executing arbitrary code. Specifically, attackers could exploit these vulnerabilities to take control of a DBMS server over the network, potentially leading to system control or privilege escalation. These bugs could significantly compromise the availability of the DBMS server. Additionally, WingFuzz also finds 7 null pointer dereferences, 30 assertion failures, and 6 cases of undefined behavior. These errors, primarily internal to the DBMSs, could lead to denial-of-service by causing the DBMS to crash or result in other unforeseen damages.

| Root Cause    | Buffer-Overflow | Segmentation Violation | Use-After-Free | Use-After-Poison | Null Pointer Dereference | Undefined Behavior | Assertion Failure | Total |
| ------------- | --------------- | ---------------------- | -------------- | ---------------- | ------------------------ | ------------------ | ----------------- | ----- |
| ClickHouse    | 1               | 28                     | 0              | 0                | 0                        | 0                  | 2                 | 31    |
| DamengDB      | 11              | 17                     | 10             | 0                | 0                        | 0                  | 14                | 52    |
| MariaDB       | 0               | 9                      | 0              | 1                | 0                        | 0                  | 0                 | 10    |
| MonetDB       | 0               | 12                     | 0              | 0                | 0                        | 0                  | 0                 | 12    |
| MySQL         | 3               | 8                      | 0              | 0                | 0                        | 0                  | 0                 | 11    |
| PostgreSQL    | 3               | 0                      | 0              | 0                | 0                        | 0                  | 0                 | 3     |
| PolarDB       | 0               | 9                      | 4              | 3                | 3                        | 0                  | 2                 | 21    |
| SQLite        | 3               | 6                      | 0              | 0                | 2                        | 0                  | 6                 | 17    |
| TDengine      | 8               | 12                     | 0              | 0                | 0                        | 2                  | 2                 | 24    |
| TenDB         | 0               | 14                     | 0              | 3                | 1                        | 0                  | 0                 | 18    |
| VastBase-G100 | 0               | 10                     | 5              | 3                | 0                        | 3                  | 2                 | 23    |
| YashanDB      | 2               | 0                      | 0              | 0                | 1                        | 1                  | 2                 | 6     |
| Total         | 31              | 133                    | 19             | 10               | 7                        | 6                  | 30                | 236   |


### Adaption to Other Databases After Submission

Furthermore, WingFuzz has been integrated into detecting more bugs across more databases, identifying over 500 bugs. 

| Root Cause    | Buffer-Overflow | Segmentation Violation | Use-After-Free | Use-After-Poison | Null Pointer Dereference | Undefined Behavior | Assertion Failure |
|---------------|------------------|------------------------|----------------|------------------|--------------------------|--------------------|-------------------|
| Total         |

## Case Study of Selected Bugs

First, we select 10 bugs to illustrate the different root causes of our detected bugs.

### Case Study 1: A segmentation violation in ClickHouse with user-defined functions. 

When using ClickHouse's UDF grammar to create two functions that call each other and then execute them, it will lead to a stack overflow in the database process and cause a segmentation violation, leading to denial of service.

```sql
SET allow_experimental_analyzer = 1;
CREATE FUNCTION x1 AS x -> x1(x);
CREATE FUNCTION x2 AS x -> x2(x);
SELECT x2(2);
```

*The root cause of the bug.* ClickHouse's UDF does not identify the depth of recursion when the experimental analyzer is enabled. It is fixed in ClickHouse by adding checks to recursive function calls.

### Case Study 2: A segmentation violation in DamengDB with CREATE VIEW. 

When creating view v1 from a table, creating view v2 from v1 with the check option in DamengDB enabled, and inserting data into v2, the server crashes due to a segmentation violation, leading to denial of service.

```sql
CREATE TABLE t1 (c1 INT);
CREATE VIEW v1 AS SELECT * FROM t1 WITH CHECK OPTION;
CREATE VIEW v2 AS SELECT * FROM v1 WITH CHECK OPTION;
INSERT INTO v2 VALUES (15);
```

*The root cause of the bug.* DamengDB wrongly handled the insertion operations on the nested views. View v2 is read-only because it is constructed by another view. However, the DamengDB incorrectly identified the readability of this view and still attempted to insert data into it, which caused the segmentation fault.

### Case Study 3: An use-after-free in MonetDB when truncating temporary tables.

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

### Case Study 4: A null pointer dereference in MonetDB with CREATE MERGE TABLE. 

The merge table is a unique feature of MonetDB. It can merge the tables with the same column definitions into a single table. However, when recursively merging three tables and then inserting data, the MonetDB crashes due to a null pointer dereference.

```sql
CREATE MERGE TABLE a (b int, subtable2 varchar(32)) PARTITION BY VALUES ON (b)  ;
 CREATE MERGE TABLE t1 (c int, d varchar(32)) PARTITION BY RANGE ON (c)  ;
 CREATE TABLE id (t1907060_1 int, age varchar(32))  ;
 ALTER TABLE a ADD TABLE id AS PARTITION IN ('1', '2', '3')  ;
 ALTER TABLE t1 ADD TABLE a AS PARTITION FROM '0' TO '100'  ;
 SELECT c, d FROM t1 ;
```

*The root cause of the bug.* MonetDB did not correctly maintain the column names of the merged tables. When the tables were merged recursively, the string representing column names was wrongly set to a null pointer, which caused the NPD when inserting data.

### Case Study 5: A null pointer dereference caused by empty arguments of MariaDB’s AES_ENCRYPT function. 

As the PoC below shows, a user can crash the whole MariaDB server by simply calling the AES_ENCRYPT function without any arguments, leading to a denial of service. The triggering of the crash does not rely on any table creation or data insertion.

```sql
SELECT AES_ENCRYPT ( );
```

*The root cause of the bug.* The bug is introduced in MariaDB 11.2 when the grammar of optional arguments for the AES_ENCRYPT function is supported. The code for parsing the function AES_ENCRYPT is completely rewritten to support this new grammar. However, the rewritten code does not account for the function call without arguments, leading to a crash.

### Case Study 6: An undefined behavior (integer overflow) in MonetDB when calling SQL function levenshtein(). 

When passing two large strings to the function levenshtein(), a piece of code in MonetDB that calculated the array length triggers an integer overflow. If execution continued, this led to array out-of-bounds access and then the DBMS crashed.
```sql
CREATE TABLE v0 ( v1 CHAR ( 100 ) );
 INSERT INTO v0 VALUES ( 222 ) , ( 10 ) , ( 3 ) , ( 947 ) , ( 742 ) , ( 1 ) , ( 306 ) , ( 10 ) , ( 510 ) , ( 1.100000 ) , ( 9223372036854775807 ) , ( 333 ) , ( 106 ) , ( 10 ) , ( 10 ) , ( 10 ) , ( 10 ) , ( 10 ) , ( NULL ) , ( 222 ) , ( 10.100000 ) , ( 5 ) , ( 2 ) , ( 1 ) , ( 2 ) , ( 34 ) ; 
 INSERT INTO v0 ( v1 ) SELECT group_concat ( 'table tn3 row 99' ) FROM v0 , v0 AS tri , v0 AS OMW WHERE 10 LIMIT 4 ; 
 SELECT levenshtein ( v1 , v1 , 16 , 10 , 561 ) , v1 , v1 FROM v0 ; 
```
*The root cause of the bug.* MonetDB uniquely supports the function levenshtein() to calculate the Damerau–Levenshtein distance between two strings. When the lengths of the two strings are m and n, MonetDB needs to allocate an array of length m×n to perform the algorithm. However, the variable used to calculate the array length was stored as a 32-bit integer, which led to an integer overflow when the lengths of the two strings were large. MonetDB fixed the bug by changing the data type from int to long.
```c++
int sz;						                            /* number of cells in matrix */
n = (int) strlen(s);
m = (int) strlen(t);
sz = (n + 1) * (m + 1) * sizeof(int);    /* integer overflow */
d = (int *) GDKmalloc(sz);
```

### Case Study 7: An assertion failure in MariaDB when inserting data into tables with spatial index.

When creating an InnoDB table with a SPATIAL index and inserting multiple rows of data, MariaDB will throw an assertion failure `!cursor->index->is_committed()' and raise SIGABRT.

```sql
CREATE TABLE t1(
f1 SERIAL,
f2 LINESTRING NOT NULL DEFAULT LineFromText('LINESTRING(1 1,2 2,3 3)'),
SPATIAL INDEX(f2))ENGINE=InnoDB;
INSERT INTO t1(f1) VALUES(0), (1), (2);
```
*The root cause of the bug.* When an InnoDB table contains any index, the InnoDB engine will try bulk insertion when inserting multiple rows. The bulk insertion depends on the primary key which is automatically constructed by the index. However, the SPATIAL index is a special index that never constructs the primary key. Thus, when the bulk insertion was looking for the primary key in the SPATIAL index, it triggered an assertion failure.

### Case Study 8: An assertion failure in SQLite when using RETURNING *.

The test case creates a table t1 in SQLite with data inserted, creates an empty temporary table t2, and inserts data of t1 into the temporary table t2. If the `RETURNING *` feature is enabled in the second insertion, the SQLite will trigger an assertion failure.

```sql
CREATE TABLE t1(a);
INSERT INTO t1(a) VALUES(1);
CREATE TEMP TABLE t2(b);
INSERT INTO t2 SELECT * FROM t1 RETURNING *;
```

*The root cause of the bug.* SQLite has an optimization to make statements like `INSERT INTO t2 SELECT * FROM t1` run much faster. However, the optimization cannot work together with `RETURNING *`, and it caused an assertion failure in SQLite and raised SIGABRT.

### Case Study 9: A buffer overflow in MonetDB by complex comparison expressions in queries.

When using the complex nested comparison expression with the WITH clause on a table in MonetDB, the optimizer of MonetDB triggers a buffer overflow while optimizing these comparisons.

```sql
CREATE TABLE v0 ( v1 SMALLINT ) ; 
UPDATE v0 SET v1 = v1 <= ( WITH v0 ( v1 ) AS ( SELECT ( CASE WHEN 59 THEN ( 0 * ( ( 'x' < v1 = 255 > v1 - v1 ) ) ) END ) ) SELECT v1 > 16 OR v1 > 2147483647 AND v1 >= 27 AS v4 FROM v0 ORDER BY v1 > v1 % v1 % ( v1 ) NULLS LAST ) OR v1 > -1 ; 
```

*The root cause of the bug.* To optimize the complex expression in the updating statement, MonetDB tries to rewrite the comparison by reconstructing the AST nodes. However, when meeting the nested comparisons, a wrong type of AST node was bound to the expression, which caused the buffer overflow in further processing.

---

Second, more case studies can be referred to links in the following table. Note that while we have detected numerous bugs in industrial databases (236 until submission, and **xxx(TODO)** after submission), they keep their bug information private. Therefore, we are only able to present a selection of bugs from open-source databases that have publicly accessible information.

| Database   | ID                                              | Bug Type               |
|------------|-------------------------------------------------|------------------------|
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20978 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20977 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20976 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20975 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20974 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20973 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20972 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20971 | Denial of Service      |
| PostgreSQL | https://www.cve.org/CVERecord?id=CVE-2023-5868  | Memory Disclosure      |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36371 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36371 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36370 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36369 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36368 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36367 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36366 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36365 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36364 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36363 | Segmentation Violation |
| MonetDB    | https://www.cve.org/CVERecord?id=CVE-2023-36362 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32091 | Use-After-Poison       |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32089 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32088 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32087 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32086 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32085 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32084 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32083 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32082 | Segmentation Violation |
| MariaDB    | https://www.cve.org/CVERecord?id=CVE-2022-32081 | Segmentation Violation |
