# Wingfuzz Detected Bugs

We propose WingFuzz which implements continuous fuzzing for DBMSs. It utilizes specification-based mutator construction, corpus-driven evolving code fuzzing, and noise-resilient anomaly assessment to address the obstacles. 
First, the framework automatically generates a unique query parser for each DBMS by following the DBMS grammar specifications. It then performs long-term concurrent fuzzing, using generated test cases for commit fuzzing and integrating fixed anomalies into regression tests. The framework also monitors and isolates anomaly threads to capture detailed data. Identified anomalies are de-duplicated and reported to developers for quick resolution, improving the system's robustness.

WingFuzz has reported 236 bugs in total on the tested DBMSs, including ClickHouse, DamengDB, MariaDB, MonetDB, MySQL, PostgreSQL, PolarDB, SQLite, TDengine, TenDB, VastBase-G100, and YashanDB.

## Bugs in Database Component

We classify the bugs based on the root cause component. As the table below shows, 89, 59, 38, and 33 bugs are due to errors in the optimizer, parser, executor, and storage engine. 23 are caused by errors in other components like loggers. 

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

## The Details of Bugs

We have detailed information about the bugs we detected. For bugs reported through the bug tracking system, we have retained the IDs, but for some databases, such as XX and XX, we reported via email, therefore they lack IDs.

| Database   | ID             | Bug Type              |
|------------|----------------|-----------------------|
| ClickHouse | -              | Assertion Failure     |
| ClickHouse | -              | Assertion Failure     |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | SEGV                  |
| ClickHouse | -              | Memory Safety         |
| ClickHouse | -              | SIGABRT               |
| ClickHouse | -              | SIGABRT               |
| ClickHouse | -              | SIGABRT               |
| ClickHouse | -              | SIGABRT               |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | SEGV                  |
| DamengDB   | -              | Assertion Failure     |
| DamengDB   | -              | Assertion Failure     |
| DamengDB   | -              | Assertion Failure     |
| DamengDB   | -              | Assertion Failure     |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| DamengDB   | -              | SIGFPE                |
| MariaDB    | CVE-2022-32091 | Use After Poison      |
| MariaDB    | CVE-2022-32089 | SEGV                  |
| MariaDB    | CVE-2022-32088 | SEGV                  |
| MariaDB    | CVE-2022-32087 | SEGV                  |
| MariaDB    | CVE-2022-32086 | SEGV                  |
| MariaDB    | CVE-2022-32085 | SEGV                  |
| MariaDB    | CVE-2022-32084 | SEGV                  |
| MariaDB    | CVE-2022-32083 | SEGV                  |
| MariaDB    | CVE-2022-32082 | SEGV                  |
| MariaDB    | CVE-2022-32081 | SEGV                  |
| MonetDB    | CVE-2023-36371 | SEGV                  |
| MonetDB    | CVE-2023-36371 | SEGV                  |
| MonetDB    | CVE-2023-36370 | SEGV                  |
| MonetDB    | CVE-2023-36369 | SEGV                  |
| MonetDB    | CVE-2023-36368 | SEGV                  |
| MonetDB    | CVE-2023-36367 | SEGV                  |
| MonetDB    | CVE-2023-36366 | SEGV                  |
| MonetDB    | CVE-2023-36365 | SEGV                  |
| MonetDB    | CVE-2023-36364 | SEGV                  |
| MonetDB    | CVE-2023-36363 | SEGV                  |
| MonetDB    | CVE-2023-36362 | SEGV                  |
| MySQL      | CVE-2024-20978 | Denial of Service     |
| MySQL      | CVE-2024-20977 | Denial of Service     |
| MySQL      | CVE-2024-20976 | Denial of Service     |
| MySQL      | CVE-2024-20975 | Denial of Service     |
| MySQL      | CVE-2024-20974 | Denial of Service     |
| MySQL      | CVE-2024-20973 | Denial of Service     |
| MySQL      | CVE-2024-20972 | Denial of Service     |
| MySQL      | CVE-2024-20971 | Denial of Service     |
| MySQL      | CVE-2021-2444  | Memory Safety         |
| MySQL      | CVE-2021-2357  | Memory Safety         |
| MySQL      | CVE-2021-2230  | Memory Safety         |
| PostgreSQL | CVE-2023-5868  | Memory Disclosure     |
| PostgreSQL | -              | Memory Disclosure     |
| PostgreSQL | -              | Memory Disclosure     |
| SQLite     | CVE-2021-46100 | SEGV                  |
| Tdengine   | -              | Heap Buffer Overflow  |
| Tdengine   | -              | Hang Out              |
| Tdengine   | -              | Segmentation Fault    |
| Tdengine   | -              | Assertion Failure     |
| Tdengine   | -              | Overflow              |
| Tdengine   | -              | Crashed               |
| Tdengine   | -              | Heap-Buffer-Overflow  |
| Tdengine   | -              | Hang Out              |
| Tdengine   | -              | Segmentation Fault    |
| Tdengine   | -              | Assertion Failure     |
| Tdengine   | -              | Buffer Overflow       |
| Tdengine   | -              | Crash                 |
| Tdengine   | -              | SIGABRT               |
| Tdengine   | -              | SIGABRT               |
| Tdengine   | -              | SIGABRT               |
| Tdengine   | -              | SIGABRT               |
| Tdengine   | -              | SEGV                  |
| Tdengine   | -              | SEGV                  |
| Tdengine   | -              | SEGV                  |
| Tdengine   | -              | SEGV                  |
| Tdengine   | -              | SEGV                  |
| Tdengine   | -              | SEGV                  |
| Tdengine   | -              | SEGV                  |


