SET allow_experimental_object_type = 1;
CREATE TABLE a1(a UInt64, t1_00816 JSON) ENGINE = MergeTree ORDER BY a;
INSERT INTO a1 format JSONEachRow {"a": 2, "t1_00816": {"foo": 1, "k2": 2}};
SELECT t1.t1_00816, t1.t1_00816, t2.t1_00816, t2.t1_00816, t3.t1_00816, t3.t1_00816 FROM a1 AS t1, a1 AS t2, a1 AS t3;


/*
Thread 3 "HTTPHandler" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fcf84dde700 (LWP 110091)]
DB::SerializationObject<DB::JSONDataParser<DB::SimdJSONParser> >::serializeTextFromSubcolumn (this=this@entry=0x7fcf5d2a0bf8, subcolumn=..., 
row_num=row_num@entry=0, ostr=..., settings=...)
at ./src/DataTypes/Serializations/SerializationObject.cpp:443
443 ./src/DataTypes/Serializations/SerializationObject.cpp: No such file or directory.
#0 DB::SerializationObject<DB::JSONDataParser<DB::SimdJSONParser> >::serializeTextFromSubcolumn (this=this@entry=0x7fcf5d2a0bf8, subcolumn=..., 
row_num=row_num@entry=0, ostr=..., settings=...)
at ./src/DataTypes/Serializations/SerializationObject.cpp:443
#1 0x00000000195239b8 in DB::SerializationObject<DB::JSONDataParser<DB::SimdJSONParser> >::serializeTextImpl (this=0x7fcf5d2a0bf8, column=..., row_num=0, 
ostr=..., settings=...)
at ./src/DataTypes/Serializations/SerializationObject.cpp:419
#2 0x000000001bee29c7 in DB::ODBCDriver2BlockOutputFormat::writeRow (
this=this@entry=0x7fcefd4fbc18, columns=..., row_idx=row_idx@entry=0, 
buffer=...)
at ./src/Processors/Formats/Impl/ODBCDriver2BlockOutputFormat.cpp:42
#3 0x000000001bee2d71 in DB::ODBCDriver2BlockOutputFormat::write (chunk=..., 
this=<optimized out>)
at ./src/Processors/Formats/Impl/ODBCDriver2BlockOutputFormat.cpp:56
#4 DB::ODBCDriver2BlockOutputFormat::consume (this=0x7fcefd4fbc18, chunk=...)
at ./src/Processors/Formats/Impl/ODBCDriver2BlockOutputFormat.cpp:61
#5 0x000000001bd8c235 in DB::IOutputFormat::work (this=0x7fcefd4fbc18)
at ./src/Processors/Formats/IOutputFormat.cpp:84
#6 0x000000001bd7c560 in DB::executeJob (node=0x7fcefd4eb800, 
read_progress_callback=0x7fcf5d2a0460)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:47
#7 DB::ExecutionThreadContext::executeTask (this=0x7fcf5d29e880)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:92
#8 0x000000001bd72bbb in DB::PipelineExecutor::executeStepImpl (
this=this@entry=0x7fcf84dd4750, thread_num=thread_num@entry=0, 
yield_flag=yield_flag@entry=0x0)
at ./src/Processors/Executors/PipelineExecutor.cpp:229
#9 0x000000001bd724d9 in DB::PipelineExecutor::executeSingleThread (
this=0x7fcf84dd4750, thread_num=0)
at ./src/Processors/Executors/PipelineExecutor.cpp:195
#10 DB::PipelineExecutor::executeImpl (this=this@entry=0x7fcf84dd4750, 
num_threads=1) at ./src/Processors/Executors/PipelineExecutor.cpp:372
#11 0x000000001bd72378 in DB::PipelineExecutor::execute (this=0x7fcf84dd4750, 
num_threads=3486403148903362659)
at ./src/Processors/Executors/PipelineExecutor.cpp:90
#12 0x000000001bd70f37 in DB::CompletedPipelineExecutor::execute (
this=0x7fcf84dd4a70)
at ./src/Processors/Executors/CompletedPipelineExecutor.cpp:105
#13 0x000000001aa6a8ba in DB::executeQuery(DB::ReadBuffer&, DB::WriteBuffer&, bool, std::__1::shared_ptr<DB::Context>, std::__1::function<void (std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)>, std::__1::optional<DB::FormatSettings> const&) (istr=..., ostr=..., allow_into_outfile=false, context=..., 
set_result_details=..., output_format_settings=...)
at ./src/Interpreters/executeQuery.cpp:1228
#14 0x000000001bc87941 in DB::HTTPHandler::processQuery (
this=this@entry=0x7fcf5d2a0000, request=..., params=..., response=..., 
used_output=..., query_scope=...) at ./src/Server/HTTPHandler.cpp:800
#15 0x000000001bc8aded in DB::HTTPHandler::handleRequest (this=0x7fcf5d2a0000, 
request=..., response=...) at ./src/Server/HTTPHandler.cpp:975
#16 0x000000001bd17585 in DB::HTTPServerConnection::run (this=0x7fcf5d29a000)
at ./src/Server/HTTP/HTTPServerConnection.cpp:65
#17 0x000000001e51dda7 in Poco::Net::TCPServerConnection::start (
this=0x7fcf5d2797c0) at ./contrib/poco/Net/src/TCPServerConnection.cpp:43
#18 0x000000001e51e28d in Poco::Net::TCPServerDispatcher::run (
this=0x7fcf6ae50100) at ./contrib/poco/Net/src/TCPServerDispatcher.cpp:115
#19 0x000000001e68b807 in Poco::PooledThread::run (this=0x7fd091a30100)
at ./contrib/poco/Foundation/src/ThreadPool.cpp:199
#20 0x000000001e6893e3 in Poco::ThreadImpl::runnableEntry (
pThread=0x7fd091a30138)
at ./contrib/poco/Foundation/src/Thread_POSIX.cpp:345
#21 0x00007fd092b08609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#22 0x00007fd092a1d133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
