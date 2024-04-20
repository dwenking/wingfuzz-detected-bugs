# Wingfuzz Detected Bugs

We propose WingFuzz which implements continuous fuzzing for DBMSs. It utilizes specification-based mutator construction, corpus-driven evolving code fuzzing, and noise-resilient anomaly assessment to address the obstacles. 
First, the framework automatically generates a unique query parser for each DBMS by following the DBMS grammar specifications. It then performs long-term concurrent fuzzing, using generated test cases for commit fuzzing and integrating fixed anomalies into regression tests. The framework also monitors and isolates anomaly threads to capture detailed data. Identified anomalies are de-duplicated and reported to developers for quick resolution, improving the system's robustness.

Until our submission, WingFuzz has reported 236 bugs in total on the tested DBMSs, including ClickHouse, DamengDB, MariaDB, MonetDB, MySQL, PostgreSQL, PolarDB, SQLite, TDengine, TenDB, VastBase-G100, and YashanDB in the submitted manuscript.

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

We also classify the bugs based on the types and root causes. As the table below shows, XX, XX, XX, XX, XX, XX and XX bugs are due to ...

| Root Cause    | Buffer-Over-Flow | Segmentation Violation | Use-After-Free | Use-After-Poison | Null Pointer Dereference | Undefined Behavior | Assertion Failure | Denial of Service |
|---------------|------------------|------------------------|----------------|------------------|--------------------------|--------------------|-------------------|-------------------|
| ClickHouse    | 1                | 28                     |                |                  |                          |                    | 2                 |                   |
| DamengDB      | 11               | 17                     |                |                  |                          |                    | 4                 |                   |
| MariaDB       |                  | 9                      |                | 1                |                          |                    |                   |                   |
| MonetDB       |                  | 12                     |                |                  |                          |                    |                   |                   |
| MySQL         | 3                |                        |                |                  |                          |                    |                   | 8                 |
| PostgreSQL    | 3                |                        |                |                  |                          |                    |                   |                   |
| PolarDB       |                  |                        |                |                  |                          |                    |                   |                   |
| SQLite        |                  | 1                      |                |                  |                          |                    |                   |                   |
| TDengine      | 8                | 10                     |                |                  |                          | 2                  | 2                 | 2                 |
| TenDB         |                  |                        |                |                  |                          |                    |                   |                   |
| VastBase-G100 |                  |                        |                |                  |                          |                    |                   |                   |
| YashanDB      |                  |                        |                |                  |                          |                    |                   |                   |
| Total         |


### Adaption to Other Databases After Submission

Furthermore, WingFuzz has been integrated into detecting more bugs across more databases, identifying over 500 bugs. 

| Root Cause    | Buffer-Over-Flow | Segmentation Violation | Use-After-Free | Use-After-Poison | Null Pointer Dereference | Undefined Behavior | Assertion Failure | Denial of Service |
|---------------|------------------|------------------------|----------------|------------------|--------------------------|--------------------|-------------------|-------------------|
| Total         |

## Case Study of Selected Bugs

First, we select 10 bugs to illustrate the different root causes of our detected bugs.

### Case Study 1: A Null Pointer Dereference caused by empty arguments of MariaDB’s AES_ENCRYPT function. 

As the PoC below shows, a user can crash the whole MariaDB server by simply calling the AES_ENCRYPT function without any arguments, leading to a denial of service. The trigger of the crash does not rely on any table creation or data insertion.

```sql
SELECT AES_ENCRYPT ( );
```

The root cause of the bug. The bug is introduced in MariaDB 11.2 when the grammar of optional arguments for the AES_ENCRYPT function is supported. The code for parsing the function AES_ENCRYPT is completely rewritten to support this new grammar. However, the rewritten code does not account for the function call without arguments, leading to a crash.

The reason for detecting the bug by Wingfuzz. MariaDB includes test cases of AES_ENCRYPT, but it does not contain a test case of AES_ENCRYPT without arguments. Thus the bug-hidden commit passed the unit testing and regression testing of MariaDB and was released in MariaDB 11.2. Wingfuzz detected the code changes for AES_ENCRYPT when running test cases of AES_ENCRYPT in the corpus. Then, Wingfuzz started the commit fuzzing from these test cases and successfully found the bug in MariaDB 11.2.

### Case Study 2: A stack overflow in ClickHouse with user-defined functions. 

When using ClickHouse's UDF grammar to create two functions that call each other and then execute them, it will lead to a stack overflow in the database process and cause a crash.

```sql
SET allow_experimental_analyzer = 1;
CREATE FUNCTION x1 AS x -> x1(x);
CREATE FUNCTION x2 AS x -> x2(x);
SELECT x2(2);
```

The root cause of the bug. ClickHouse's UDF does not identify the depth of recursion when the experimental analyzer is enabled. It is fixed in ClickHouse by adding checks to recursive function calls.

### Case Study 3: A segmentation fault in DamengDB with CREATE VIEW. 

When creating view v1 from a table, creating view v2 from v1 with the check option in DamengDB enabled, and inserting data into v2, the server crashes due to a segmentation fault, leading to denial of service.

```sql
CREATE TABLE t1 (c1 INT);
CREATE VIEW v1 AS SELECT * FROM t1 WITH CHECK OPTION;
CREATE VIEW v2 AS SELECT * FROM v1 WITH CHECK OPTION;
INSERT INTO v2 VALUES (15);
```

The root cause of the bug. DamengDB wrongly handled the insertion operations on the nested views. View v2 is read-only since it is constructed by another view. However, the DamengDB incorrectly identified the readability of this view and still attempted to insert data into it, which caused the segmentation fault.

### Case Study 4: A Null Pointer Dereference in MonetDB with CREATE MERGE TABLE. 

The merge table is a unique feature of MonetDB. It can merge the tables with the same column definitions into a single table. However, when recursively merging three tables and then inserting data, the MonetDB crashes due to a null pointer dereference.

```sql
CREATE MERGE TABLE a (b int, subtable2 varchar(32)) PARTITION BY VALUES ON (b)  ;
 CREATE MERGE TABLE t1 (c int, d varchar(32)) PARTITION BY RANGE ON (c)  ;
 CREATE TABLE id (t1907060_1 int, age varchar(32))  ;
 ALTER TABLE a ADD TABLE id AS PARTITION IN ('1', '2', '3')  ;
 ALTER TABLE t1 ADD TABLE a AS PARTITION FROM '0' TO '100'  ;
 SELECT c, d FROM t1 ;
```

The root cause of the bug. MonetDB did not correctly maintain the column names of the merged tables. When the tables were merged recursively, the string representing column names was wrongly set to a null pointer, which caused the NPD when inserting data.

---

Second, more case studies can be referred to links in the following table. Note that while we have detected numerous bugs in industrial databases, they keep their bug information private. Therefore, we are only able to present a selection of bugs from open-source databases that have publicly accessible information.

| Database   | ID                                              | Bug Type               |
|------------|-------------------------------------------------|------------------------|
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
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20978 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20977 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20976 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20975 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20974 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20973 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20972 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2024-20971 | Denial of Service      |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2021-2444  | Memory Safety          |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2021-2357  | Memory Safety          |
| MySQL      | https://www.cve.org/CVERecord?id=CVE-2021-2230  | Memory Safety          |
| SQLite     | https://www.cve.org/CVERecord?id=CVE-2021-46100 | Segmentation Violation |
| PostgreSQL | https://www.cve.org/CVERecord?id=CVE-2023-5868  | Memory Disclosure      |
