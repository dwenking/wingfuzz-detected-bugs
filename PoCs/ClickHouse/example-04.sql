create table t (d Int64, s AggregateFunction(groupUniqArrayArray, Array(UInt64)), c SimpleAggregateFunction(groupUniqArrayArray, Array(UInt64))) engine = SummingMergeTree() order by d;;
WITH
x AS (SELECT d-4000 d FROM t WHERE t.d >700),
y AS (SELECT * FROM t),
z AS (SELECT * FROM x WHERE d % 3 = 1),
w AS (SELECT * FROM y WHERE d > 333 AND d < 1000)
SELECT max(d), min(d), count(*) FROM x
WHERE d <100;
INSERT INTO t VALUES ('こんにちは', 'このコードは編集して実行出来ます！');

/*
Thread 3 "HTTPHandler" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f6c32fde700 (LWP 21694)]
HashTable<unsigned long, HashTableCell<unsigned long, DefaultHash<unsigned long>, HashTableNoState>, DefaultHash<unsigned long>, HashTableGrower<4ul>, AllocatorWithStackMemory<Allocator<true, true>, 128ul, 1ul> >::emplaceNonZero<unsigned long const&> (this=0x7f6bdb127000, 
key_holder=@0x7f6c32fd40e0: 9359475650160526307, 
hash_value=1500153953813270643, it=<optimized out>, 
inserted=<optimized out>) at ./src/Common/HashTable/HashTable.h:981
981 ./src/Common/HashTable/HashTable.h: No such file or directory.
#0 HashTable<unsigned long, HashTableCell<unsigned long, DefaultHash<unsigned long>, HashTableNoState>, DefaultHash<unsigned long>, HashTableGrower<4ul>, AllocatorWithStackMemory<Allocator<true, true>, 128ul, 1ul> >::emplaceNonZero<unsigned long const&> (this=0x7f6bdb127000, 
key_holder=@0x7f6c32fd40e0: 9359475650160526307, 
hash_value=1500153953813270643, it=<optimized out>, 
inserted=<optimized out>) at ./src/Common/HashTable/HashTable.h:981
#1 HashTable<unsigned long, HashTableCell<unsigned long, DefaultHash<unsigned long>, HashTableNoState>, DefaultHash<unsigned long>, HashTableGrower<4ul>, AllocatorWithStackMemory<Allocator<true, true>, 128ul, 1ul> >::insert (
this=0x7f6bdb127000, x=@0x7f6c32fd40e0: 9359475650160526307)
at ./src/Common/HashTable/HashTable.h:1005
#2 HashTable<unsigned long, HashTableCell<unsigned long, DefaultHash<unsigned long>, HashTableNoState>, DefaultHash<unsigned long>, HashTableGrower<4ul>, AllocatorWithStackMemory<Allocator<true, true>, 128ul, 1ul> >::read (
this=0x7f6bdb127000, rb=...) at ./src/Common/HashTable/HashTable.h:1302
#3 0x00000000194cf021 in DB::deserializeFromString (function=..., column=..., 
s=..., version=0)
at ./src/DataTypes/Serializations/SerializationAggregateFunction.cpp:131
#4 0x00000000194cf2d8 in DB::SerializationAggregateFunction::deserializeTextQuoted (this=<optimized out>, column=..., istr=...)
at ./src/DataTypes/Serializations/SerializationAggregateFunction.cpp:172
#5 0x00000000195054a9 in DB::SerializationNullable::deserializeTextQuotedImpl<bool>(DB::IColumn&, DB::ReadBuffer&, DB::FormatSettings const&, std::__1::shared_ptr<DB::ISerialization const> const&)::{lambda(DB::IColumn&)#1}::operator()(DB::IColumn&) const (nested_column=..., this=<optimized out>)
at ./src/DataTypes/Serializations/SerializationNullable.cpp:406
#6 DB::safeDeserialize<bool, DB::SerializationNullable::deserializeTextQuotedImpl<bool>(DB::IColumn&, DB::ReadBuffer&, DB::FormatSettings const&, std::__1::shared_ptr<DB::ISerialization const> const&)::{lambda()#1}, DB::SerializationNullable::deserializeTextQuotedImpl<bool>(DB::IColumn&, DB::ReadBuffer&, DB::FormatSettings const&, std::__1::shared_ptr<DB::ISerialization const> const&)::{lambda(DB::IColumn&)#1}, (bool*)0>(DB::IColumn&, DB::ISerialization const&, DB::SerializationNullable::deserializeTextQuotedImpl<bool>(DB::IColumn&, DB::ReadBuffer&, DB::FormatSettings const&, std::__1::shared_ptr<DB::ISerialization const> const&)::{lambda()#1}&&, DB::SerializationNullable::deserializeTextQuotedImpl<bool>(DB::IColumn&, DB::ReadBuffer&, DB::FormatSettings const&, std::__1::shared_ptr<DB::ISerialization const> const&)::{lambda(DB::IColumn&)#1}&&) (column=..., 
nested=..., check_for_null=..., deserialize_nested=...)
at ./src/DataTypes/Serializations/SerializationNullable.cpp:233
#7 DB::SerializationNullable::deserializeTextQuotedImpl<bool> (column=..., 
istr=..., settings=..., nested=...)
at ./src/DataTypes/Serializations/SerializationNullable.cpp:404
#8 0x000000001bfcc6d3 in DB::ValuesBlockInputFormat::tryReadValue (
this=0x7f6bad978018, column=..., column_idx=1)
at ./src/Processors/Formats/Impl/ValuesBlockInputFormat.cpp:190
#9 DB::ValuesBlockInputFormat::readRow (this=this@entry=0x7f6bad978018, 
columns=..., row_num=row_num@entry=0)
at ./src/Processors/Formats/Impl/ValuesBlockInputFormat.cpp:126
#10 0x000000001bfcb001 in DB::ValuesBlockInputFormat::generate (
this=0x7f6bad978018)
at ./src/Processors/Formats/Impl/ValuesBlockInputFormat.cpp:72
#11 0x000000001bd5e7f6 in DB::ISource::tryGenerate (this=0x7fffffffffffffff)
at ./src/Processors/ISource.cpp:124
#12 0x000000001bd5e024 in DB::ISource::work (this=0x7f6bad978018)
at ./src/Processors/ISource.cpp:94
#13 0x000000001bd7c560 in DB::executeJob (node=0x7f6bad99d700, 
read_progress_callback=0x7f6bad94f280)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:47
#14 DB::ExecutionThreadContext::executeTask (this=0x7f6bad802480)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:92
#15 0x000000001bd72bbb in DB::PipelineExecutor::executeStepImpl (
this=this@entry=0x7f6c32fd4750, thread_num=thread_num@entry=0, 
yield_flag=yield_flag@entry=0x0)
at ./src/Processors/Executors/PipelineExecutor.cpp:229
#16 0x000000001bd724d9 in DB::PipelineExecutor::executeSingleThread (
this=0x7f6c32fd4750, thread_num=0)
at ./src/Processors/Executors/PipelineExecutor.cpp:195
#17 DB::PipelineExecutor::executeImpl (this=this@entry=0x7f6c32fd4750, 
num_threads=1) at ./src/Processors/Executors/PipelineExecutor.cpp:372
#18 0x000000001bd72378 in DB::PipelineExecutor::execute (this=0x7f6c32fd4750, 
num_threads=9223372036854775807)
at ./src/Processors/Executors/PipelineExecutor.cpp:90
#19 0x000000001bd70f37 in DB::CompletedPipelineExecutor::execute (
this=0x7f6c32fd4a70)
at ./src/Processors/Executors/CompletedPipelineExecutor.cpp:105
#20 0x000000001aa6a8ba in DB::executeQuery(DB::ReadBuffer&, DB::WriteBuffer&, bool, std::__1::shared_ptr<DB::Context>, std::__1::function<void (std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)>, std::__1::optional<DB::FormatSettings> const&) (istr=..., ostr=..., allow_into_outfile=false, context=..., 
set_result_details=..., output_format_settings=...)
at ./src/Interpreters/executeQuery.cpp:1228
#21 0x000000001bc87941 in DB::HTTPHandler::processQuery (
this=this@entry=0x7f6bad94f000, request=..., params=..., response=..., 
used_output=..., query_scope=...) at ./src/Server/HTTPHandler.cpp:800
#22 0x000000001bc8aded in DB::HTTPHandler::handleRequest (this=0x7f6bad94f000, 
request=..., response=...) at ./src/Server/HTTPHandler.cpp:975
#23 0x000000001bd17585 in DB::HTTPServerConnection::run (this=0x7f6bad800000)
at ./src/Server/HTTP/HTTPServerConnection.cpp:65
#24 0x000000001e51dda7 in Poco::Net::TCPServerConnection::start (
this=0x14d19e12af18df7a)
at ./contrib/poco/Net/src/TCPServerConnection.cpp:43
#25 0x000000001e51e28d in Poco::Net::TCPServerDispatcher::run (
this=0x7f6d3fd61c00) at ./contrib/poco/Net/src/TCPServerDispatcher.cpp:115
#26 0x000000001e68b807 in Poco::PooledThread::run (this=0x7f6d3fc30100)
at ./contrib/poco/Foundation/src/ThreadPool.cpp:199
#27 0x000000001e6893e3 in Poco::ThreadImpl::runnableEntry (
pThread=0x7f6d3fc30138)
at ./contrib/poco/Foundation/src/Thread_POSIX.cpp:345
#28 0x00007f6d40cad609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#29 0x00007f6d40bc2133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
