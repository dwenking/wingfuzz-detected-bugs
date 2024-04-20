SET output_format_json_named_tuples_as_objects = 1;
SET allow_experimental_object_type = 1;
SET allow_experimental_analyzer = 1;
SET max_rows_to_read = 20;
CREATE TABLE t_max_rows_to_read (a JSON) ENGINE = Memory;
INSERT INTO t_max_rows_to_read VALUES ('{"id": 2, "obj": {"k2": {"k3": "str", "k4": [{"k6": 55}]}, "some": 42}, "s": "bar"}');
SELECT a, any(a) FROM t_max_rows_to_read GROUP BY a ORDER BY a;


/*
Thread 203 "QueryPipelineEx" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7efdccdfc700 (LWP 122235)]
std::__1::__tree_min[abi:v15000]<std::__1::__tree_node_base<void*>*>(std::__1::__tree_node_base<void*>*) (__x=0x39343a3430203431)
at ./contrib/llvm-project/libcxx/include/__tree:153
153 ./contrib/llvm-project/libcxx/include/__tree: No such file or directory.
#0 std::__1::__tree_min[abi:v15000]<std::__1::__tree_node_base<void*>*>(std::__1::__tree_node_base<void*>*) (__x=0x39343a3430203431)
at ./contrib/llvm-project/libcxx/include/__tree:153
#1 std::__1::__tree_next_iter[abi:v15000]<std::__1::__tree_end_node<std::__1::__tree_node_base<void*>*>*, std::__1::__tree_node_base<void*>*>(std::__1::__tree_node_base<void*>*) (__x=0x7efdce655540)
at ./contrib/llvm-project/libcxx/include/__tree:190
#2 std::__1::__tree_const_iterator<std::__1::__value_type<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, DB::Field>, std::__1::__tree_node<std::__1::__value_type<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, DB::Field>, void*>*, long>::operator++[abi:v15000]() (this=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__tree:932
#3 std::__1::__map_const_iterator<std::__1::__tree_const_iterator<std::__1::__value_type<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, DB::Field>, std::__1::__tree_node<std::__1::__value_type<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, DB::Field>, void*>*, long> >::operator++[abi:v15000]() (this=<optimized out>)
at ./contrib/llvm-project/libcxx/include/map:938
#4 DB::ColumnObject::insert (this=0x7efdce625740, field=...)
at ./src/Columns/ColumnObject.cpp:692
#5 0x0000000014ee8dae in DB::SingleValueDataGeneric::insertResultInto (
this=0x7efde5cb1be8, to=...)
at ./src/AggregateFunctions/AggregateFunctionMinMaxAny.h:788
#6 DB::AggregateFunctionsSingleValue<DB::AggregateFunctionAnyData<DB::SingleValueDataGeneric> >::insertResultInto (this=0x7efde5776540, 
place=0x7efde5cb1be8 "", to=...)
at ./src/AggregateFunctions/AggregateFunctionMinMaxAny.h:1358
#7 DB::IAggregateFunctionHelper<DB::AggregateFunctionsSingleValue<DB::AggregateFunctionAnyData<DB::SingleValueDataGeneric> > >::insertResultIntoBatch (
this=0x7efde5776540, row_begin=<optimized out>, row_end=1, 
places=0x7efdb2983c00, place_offset=0, to=..., arena=0x7efde5767bd8)
at ./src/AggregateFunctions/IAggregateFunction.h:655
#8 0x000000001a3ba1a0 in DB::Aggregator::insertResultsIntoColumns<false> (
this=this@entry=0x7efde57afa10, places=..., out_cols=..., 
arena=0x7efde5767bd8) at ./src/Interpreters/Aggregator.cpp:1930
#9 0x000000001a538a28 in DB::Aggregator::convertToBlockImplFinal<DB::AggregationMethodSerialized<HashMapTable<StringRef, HashMapCellWithSavedHash<StringRef, char*, DefaultHash<StringRef>, HashTableNoState>, DefaultHash<StringRef>, HashTableGrowerWithPrecalculation<8ul>, Allocator<true, true> > >, false, false, HashMapTable<StringRef, HashMapCellWithSavedHash<StringRef, char*, DefaultHash<StringRef>, HashTableNoState>, DefaultHash<StringRef>, HashTableGrowerWithPrecalculation<8ul>, Allocator<true, true> > > (this=0x7efde57afa10, method=..., data=..., 
arena=0xffffffffffff8010, aggregates_pools=...)
at ./src/Interpreters/Aggregator.cpp:2024
#10 0x000000001a0b3f90 in DB::Aggregator::convertToBlockImpl<false, DB::AggregationMethodSerialized<HashMapTable<StringRef, HashMapCellWithSavedHash<StringRef, char*, DefaultHash<StringRef>, HashTableNoState>, DefaultHash<StringRef>, HashTableGrowerWithPrecalculation<8ul>, Allocator<true, true> > >, HashMapTable<StringRef, HashMapCellWithSavedHash<StringRef, char*, DefaultHash<StringRef>, HashTableNoState>, DefaultHash<StringRef>, HashTableGrowerWithPrecalculation<8ul>, Allocator<true, true> > > (this=0x7efde5cb1be8, this@entry=0x7efde57afa10, 
method=..., data=..., arena=0xffffffffffff8010, aggregates_pools=..., 
final=true, rows=1) at ./src/Interpreters/Aggregator.cpp:1793
#11 0x000000001a0a4899 in DB::Aggregator::prepareBlockAndFillSingleLevel<false>
(this=0x7efde57afa10, data_variants=..., final=true)
at ./src/Interpreters/Aggregator.cpp:2219
#12 0x000000001bffb08b in DB::ConvertingAggregatedToChunksTransform::mergeSingleLevel (this=0x7efdb9965018)
at ./src/Processors/Transforms/AggregatingTransform.cpp:361
#13 0x000000001bd7c560 in DB::executeJob (node=0x7efdce626c00, 
read_progress_callback=0x7efde57632c0)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:47
#14 DB::ExecutionThreadContext::executeTask (this=0x7efde5619d80)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:92
#15 0x000000001bd72bbb in DB::PipelineExecutor::executeStepImpl (
this=this@entry=0x7efe49dc0750, thread_num=<optimized out>, 
yield_flag=yield_flag@entry=0x0)
at ./src/Processors/Executors/PipelineExecutor.cpp:229
#16 0x000000001bd73f49 in DB::PipelineExecutor::executeSingleThread (
this=0x7efe49dc0750, thread_num=139628947119080)
at ./src/Processors/Executors/PipelineExecutor.cpp:195
#17 DB::PipelineExecutor::spawnThreads()::$_0::operator()() const (
this=0x7efdccdf3a90) at ./src/Processors/Executors/PipelineExecutor.cpp:320
#18 std::__1::__invoke[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&>
(__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#19 std::__1::__apply_tuple_impl[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&>(DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&, std::__1::__tuple_indices<>) (__f=..., __t=...)
at ./contrib/llvm-project/libcxx/include/tuple:1789
#20 std::__1::apply[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&>(DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&)
(__f=..., __t=...) at ./contrib/llvm-project/libcxx/include/tuple:1798
#21 ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}::operator()() (this=0x7efde5760570) at ./src/Common/ThreadPool.h:196
#22 std::__1::__invoke[abi:v15000]<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#23 std::__1::__invoke_void_return_wrapper<void, true>::__call<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&>(ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&) (__args=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:479
#24 std::__1::__function::__default_alloc_func<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}, void ()>::operator()[abi:v15000]() (this=0x7efde5760570)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:235
#25 std::__1::__function::__policy_invoker<void ()>::__call_impl<std::__1::__function::__default_alloc_func<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}, void ()> >(std::__1::__function::__policy_storage const*) (__buf=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:716
#26 0x0000000013757419 in std::__1::__function::__policy_func<void ()>::operator()[abi:v15000]() const (this=0x7efdccdf3d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:848
#27 std::__1::function<void ()>::operator()() const (this=0x7efdccdf3d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:1187
#28 ThreadPoolImpl<std::__1::thread>::worker (this=0x7eff56a3fb00, 
thread_it=...) at ./src/Common/ThreadPool.cpp:294
#29 0x000000001375a26e in ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}::operator()() const (this=0x7efe24678e68)
at ./src/Common/ThreadPool.cpp:144
#30 std::__1::__invoke[abi:v15000]<ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#31 std::__1::__thread_execute[abi:v15000]<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>&, std::__1::__tuple_indices<>) (__t=...)
at ./contrib/llvm-project/libcxx/include/thread:284
#32 std::__1::__thread_proxy[abi:v15000]<std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> >(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>) (__vp=0x7efe24678e60)
at ./contrib/llvm-project/libcxx/include/thread:295
#33 0x00007eff5796b609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#34 0x00007eff57880133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
