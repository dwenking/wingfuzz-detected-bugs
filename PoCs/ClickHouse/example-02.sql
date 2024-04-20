CREATE TABLE prewhere_alias (a UInt64, c Int64) ENGINE = MergeTree ORDER BY tuple() SETTINGS ratio_of_defaults_for_sparse_serialization = 0;
insert into prewhere_alias select number, number from numbers(1000);
INSERT INTO prewhere_alias SELECT * from prewhere_alias;
INSERT INTO prewhere_alias SELECT * from prewhere_alias;
ALTER TABLE prewhere_alias CLEAR COLUMN c;
insert into prewhere_alias select number, 'yyy,uuu' from numbers(1024);
SELECT * FROM prewhere_alias ORDER BY c, a LIMIT 5;
select distinct * from prewhere_alias except select * from prewhere_alias;
select distinct * from prewhere_alias except select * from prewhere_alias;
DROP TABLE prewhere_alias;


/*
Thread 253 "QueryPipelineEx" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f829cb6f700 (LWP 50456)]
0x000000001319643e in DB::fillFixedBatch<unsigned long, 2ul> (
num_rows=<optimized out>, source=0x7f833360d000, dest=0x7f8333738300)
at ./src/Interpreters/AggregationCommon.h:67
#0 0x000000001319643e in DB::fillFixedBatch<unsigned long, 2ul> (
num_rows=<optimized out>, source=0x7f833360d000, dest=0x7f8333738300)
at ./src/Interpreters/AggregationCommon.h:67
#1 DB::fillFixedBatch<unsigned long, wide::integer<128ul, unsigned int> > (
keys_size=<optimized out>, key_columns=..., key_sizes=..., out=..., 
offset=<optimized out>) at ./src/Interpreters/AggregationCommon.h:94
#2 DB::packFixedBatch<wide::integer<128ul, unsigned int> > (keys_size=2, 
key_columns=..., key_sizes=..., out=...)
at ./src/Interpreters/AggregationCommon.h:107
#3 0x000000001a796716 in DB::ColumnsHashing::HashMethodKeysFixed<wide::integer<128ul, unsigned int>, wide::integer<128ul, unsigned int>, void, false, false, true, false>::HashMethodKeysFixed (this=0x7f829cb66768, key_columns=..., 
key_sizes_=...) at ./src/Common/ColumnsHashing.h:539
#4 0x000000001c23121c in DB::IntersectOrExceptTransform::addToSet<DB::SetMethodKeysFixed<HashSetTable<wide::integer<128ul, unsigned int>, HashTableCell<wide::integer<128ul, unsigned int>, UInt128HashCRC32, HashTableNoState>, UInt128HashCRC32, HashTableGrowerWithPrecalculation<8ul>, Allocator<true, true> >, false> > (
this=this@entry=0x7f82bc8af018, method=..., columns=..., 
rows=rows@entry=2000, variants=...)
at ./src/Processors/Transforms/IntersectOrExceptTransform.cpp:97
#5 0x000000001c22c858 in DB::IntersectOrExceptTransform::accumulate (
this=this@entry=0x7f82bc8af018, chunk=...)
at ./src/Processors/Transforms/IntersectOrExceptTransform.cpp:155
#6 0x000000001c22be6f in DB::IntersectOrExceptTransform::work (
this=0x7f82bc8af018)
at ./src/Processors/Transforms/IntersectOrExceptTransform.cpp:82
#7 0x000000001bd7c560 in DB::executeJob (node=0x7f82bb829700, 
read_progress_callback=0x7f832a03e820)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:47
#8 DB::ExecutionThreadContext::executeTask (this=0x7f8298ce13c0)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:92
#9 0x000000001bd72bbb in DB::PipelineExecutor::executeStepImpl (
this=this@entry=0x7f83a7dd4750, thread_num=<optimized out>, 
yield_flag=yield_flag@entry=0x0)
at ./src/Processors/Executors/PipelineExecutor.cpp:229
#10 0x000000001bd73f49 in DB::PipelineExecutor::executeSingleThread (
this=0x7f83a7dd4750, thread_num=0)
at ./src/Processors/Executors/PipelineExecutor.cpp:195
#11 DB::PipelineExecutor::spawnThreads()::$_0::operator()() const (
this=0x7f829cb66a90) at ./src/Processors/Executors/PipelineExecutor.cpp:320
#12 std::__1::__invoke[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&>
(__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#13 std::__1::__apply_tuple_impl[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&>(DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&, std::__1::__tuple_indices<>) (__f=..., __t=...)
at ./contrib/llvm-project/libcxx/include/tuple:1789
#14 std::__1::apply[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&>(DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&)
(__f=..., __t=...) at ./contrib/llvm-project/libcxx/include/tuple:1798
#15 ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}::operator()() (this=0x7f8298bd9300) at ./src/Common/ThreadPool.h:196
#16 std::__1::__invoke[abi:v15000]<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#17 std::__1::__invoke_void_return_wrapper<void, true>::__call<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&>(ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&) (__args=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:479
#18 std::__1::__function::__default_alloc_func<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}, void ()>::operator()[abi:v15000]() (this=0x7f8298bd9300)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:235
#19 std::__1::__function::__policy_invoker<void ()>::__call_impl<std::__1::__function::__default_alloc_func<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}, void ()> >(std::__1::__function::__policy_storage const*) (__buf=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:716
#20 0x0000000013757419 in std::__1::__function::__policy_func<void ()>::operator()[abi:v15000]() const (this=0x7f829cb66d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:848
#21 std::__1::function<void ()>::operator()() const (this=0x7f829cb66d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:1187
#22 ThreadPoolImpl<std::__1::thread>::worker (this=0x7f84b4c3fb00, 
thread_it=...) at ./src/Common/ThreadPool.cpp:294
#23 0x000000001375a26e in ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}::operator()() const (this=0x7f83094000e8)
at ./src/Common/ThreadPool.cpp:144
#24 std::__1::__invoke[abi:v15000]<ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#25 std::__1::__thread_execute[abi:v15000]<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>&, std::__1::__tuple_indices<>) (__t=...)
at ./contrib/llvm-project/libcxx/include/thread:284
#26 std::__1::__thread_proxy[abi:v15000]<std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> >(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>) (__vp=0x7f83094000e0)
at ./contrib/llvm-project/libcxx/include/thread:295
#27 0x00007f84b5b68609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#28 0x00007f84b5a7d133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
