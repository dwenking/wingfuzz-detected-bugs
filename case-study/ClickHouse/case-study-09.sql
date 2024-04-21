SET allow_experimental_analyzer = 1;
set max_threads =2;
SET join_algorithm = 'grace_hash';
CREATE TABLE test_table (id UInt8, value UInt8, test_00818 UInt16 ALIAS id + value) ENGINE = MergeTree ORDER BY id;
INSERT INTO test_table SELECT number, number % 5 FROM numbers(100000);
select f.test_00818 from test_table as f left join test_table as d on f.test_00818=d.test_00818 limit 10;
select 1;


/*
Thread 201 "QueryPipelineEx" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f47c49fd700 (LWP 121377)]
DB::ColumnVector<char8_t>::insertFrom (this=0x7f47fc64e230, src=..., n=19398)
at ./src/Columns/ColumnVector.h:154
154 ./src/Columns/ColumnVector.h: No such file or directory.
#0 DB::ColumnVector<char8_t>::insertFrom (this=0x7f47fc64e230, src=..., 
n=19398) at ./src/Columns/ColumnVector.h:154
#1 0x0000000019a8042d in DB::(anonymous namespace)::AddedColumns::appendFromBlock<false> (this=this@entry=0x7f47c49f42f0, block=..., row_num=19398)
at ./src/Interpreters/HashJoin.cpp:948
#2 0x0000000019a86525 in DB::(anonymous namespace)::addFoundRowAll<FixedHashMap<unsigned short, DB::RowRefList, FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState>, FixedHashTableStoredSize<FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState> >, Allocator<true, true> >, true, false> (
mapped=..., added=..., current_offset=<optimized out>, known_rows=..., 
used_flags=<optimized out>) at ./src/Interpreters/HashJoin.cpp:1137
#3 DB::(anonymous namespace)::joinRightColumns<(DB::JoinKind)1, (DB::JoinStrictness)3, DB::ColumnsHashing::HashMethodOneNumber<PairNoInit<unsigned short, DB::RowRefList>, DB::RowRefList const, unsigned short, false, true>, FixedHashMap<unsigned short, DB::RowRefList, FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState>, FixedHashTableStoredSize<FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState> >, Allocator<true, true> >, false, false, false> (
key_getter_vector=..., mapv=..., added_columns=..., used_flags=...)
at ./src/Interpreters/HashJoin.cpp:1233
#4 0x0000000019cb5226 in DB::(anonymous namespace)::joinRightColumnsSwitchMultipleDisjuncts<(DB::JoinKind)1, (DB::JoinStrictness)3, DB::ColumnsHashing::HashMethodOneNumber<PairNoInit<unsigned short, DB::RowRefList>, DB::RowRefList const, unsigned short, false, true>, FixedHashMap<unsigned short, DB::RowRefList, FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState>, FixedHashTableStoredSize<FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState> >, Allocator<true, true> >, false, false> (key_getter_vector=..., mapv=..., 
added_columns=..., used_flags=...) at ./src/Interpreters/HashJoin.cpp:1322
#5 DB::(anonymous namespace)::joinRightColumnsSwitchNullability<(DB::JoinKind)1, (DB::JoinStrictness)3, DB::ColumnsHashing::HashMethodOneNumber<PairNoInit<unsigned short, DB::RowRefList>, DB::RowRefList const, unsigned short, false, true>, FixedHashMap<unsigned short, DB::RowRefList, FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState>, FixedHashTableStoredSize<FixedHashMapCell<unsigned short, DB::RowRefList, HashTableNoState> >, Allocator<true, true> > > (
key_getter_vector=..., mapv=..., added_columns=..., used_flags=...)
at ./src/Interpreters/HashJoin.cpp:1346
#6 DB::(anonymous namespace)::switchJoinRightColumns<(DB::JoinKind)1, (DB::JoinStrictness)3, DB::HashJoin::MapsTemplate<DB::RowRefList> > (mapv=..., 
added_columns=..., type=<optimized out>, used_flags=...)
at ./src/Interpreters/HashJoin.cpp:1392
#7 DB::HashJoin::joinBlockImpl<(DB::JoinKind)1, (DB::JoinStrictness)3, DB::HashJoin::MapsTemplate<DB::RowRefList> > (this=this@entry=0x7f47a4f7f280, 
block=..., block_with_columns_to_add=..., maps_=..., 
is_join_get=<optimized out>) at ./src/Interpreters/HashJoin.cpp:1446
#8 0x0000000019a19a8d in DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4::operator()<std::__1::integral_constant<DB::JoinKind, (DB::JoinKind)1>, std::__1::integral_constant<DB::JoinStrictness, (DB::JoinStrictness)3>, std::__1::vector<DB::HashJoin::MapsTemplate<DB::RowRefList> const*, std::__1::allocator<DB::HashJoin::MapsTemplate<DB::RowRefList> const*> > >(std::__1::integral_constant<DB::JoinKind, (DB::JoinKind)1>, std::__1::integral_constant<DB::JoinStrictness, (DB::JoinStrictness)3>, std::__1::vector<DB::HashJoin::MapsTemplate<DB::RowRefList> const*, std::__1::allocator<DB::HashJoin::MapsTemplate<DB::RowRefList> const*> >&) const (maps_vector_=..., this=<optimized out>, 
kind_=..., strictness_=...) at ./src/Interpreters/HashJoin.cpp:1712
#9 DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}::operator()<std::__1::integral_constant<int, 2> >(std::__1::integral_constant<int, 2>) const (
this=<optimized out>, ij=...) at ./src/Interpreters/joinDispatch.h:121
#10 func_wrapper<DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}, std::__1::integral_constant<int, 2> >(DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}&&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&) (
func=..., arg=...) at ./base/base/../base/constexpr_helpers.h:18
#11 static_for_impl<int, 0, DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23>(DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}&&, std::__1::integer_sequence<int, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23>) (f=...) at ./base/base/../base/constexpr_helpers.h:24
#12 static_for<0, 24, DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}>(DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&)::{lambda(auto:1)#1}&&) (f=...)
at ./base/base/../base/constexpr_helpers.h:31
#13 DB::joinDispatch<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > >, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4>(DB::JoinKind, DB::JoinStrictness, std::__1::vector<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*, std::__1::allocator<std::__1::variant<DB::HashJoin::MapsTemplate<DB::RowRef>, DB::HashJoin::MapsTemplate<DB::RowRefList>, DB::HashJoin::MapsTemplate<std::__1::unique_ptr<DB::SortedLookupVectorBase, std::__1::default_delete<DB::SortedLookupVectorBase> > > > const*> >&, DB::HashJoin::joinBlock(DB::Block&, std::__1::shared_ptr<DB::ExtraBlock>&)::$_4&&) (strictness=<optimized out>, mapsv=..., 
kind=<optimized out>, func=...) at ./src/Interpreters/joinDispatch.h:106
#14 DB::HashJoin::joinBlock (this=0x7f47a4f7f280, block=..., not_processed=...)
at ./src/Interpreters/HashJoin.cpp:1710
#15 0x0000000019a0291d in DB::GraceHashJoin::joinBlock (this=0x7f47a4f69018, 
block=..., not_processed=...) at ./src/Interpreters/GraceHashJoin.cpp:391
#16 0x000000001c036f20 in DB::JoiningTransform::readExecute (
this=this@entry=0x7f47a4e07158, chunk=...)
at ./contrib/llvm-project/libcxx/include/__memory/shared_ptr.h:701
#17 0x000000001c034468 in DB::JoiningTransform::transform (
this=this@entry=0x7f47a4e07158, chunk=...)
at ./src/Processors/Transforms/JoiningTransform.cpp:191
#18 0x000000001c0339e2 in DB::JoiningTransform::work (this=0x7f47a4e07158)
at ./src/Processors/Transforms/JoiningTransform.cpp:125
#19 0x000000001bd7c560 in DB::executeJob (node=0x7f47a4f84400, 
read_progress_callback=0x7f47a4f51260)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:47
#20 DB::ExecutionThreadContext::executeTask (this=0x7f47a4e04dc0)
at ./src/Processors/Executors/ExecutionThreadContext.cpp:92
#21 0x000000001bd72bbb in DB::PipelineExecutor::executeStepImpl (
this=this@entry=0x7f483e9d3750, thread_num=<optimized out>, 
yield_flag=yield_flag@entry=0x0)
at ./src/Processors/Executors/PipelineExecutor.cpp:229
#22 0x000000001bd73f49 in DB::PipelineExecutor::executeSingleThread (
this=0x7f483e9d3750, thread_num=0)
at ./src/Processors/Executors/PipelineExecutor.cpp:195
#23 DB::PipelineExecutor::spawnThreads()::$_0::operator()() const (
this=0x7f47c49f4a90) at ./src/Processors/Executors/PipelineExecutor.cpp:320
#24 std::__1::__invoke[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&>
(__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#25 std::__1::__apply_tuple_impl[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&>(DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&, std::__1::__tuple_indices<>) (__f=..., __t=...)
at ./contrib/llvm-project/libcxx/include/tuple:1789
#26 std::__1::apply[abi:v15000]<DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&>(DB::PipelineExecutor::spawnThreads()::$_0&, std::__1::tuple<>&)
(__f=..., __t=...) at ./contrib/llvm-project/libcxx/include/tuple:1798
#27 ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}::operator()() (this=0x7f47a4f4cc10) at ./src/Common/ThreadPool.h:196
#28 std::__1::__invoke[abi:v15000]<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#29 std::__1::__invoke_void_return_wrapper<void, true>::__call<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&>(ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}&) (__args=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:479
#30 std::__1::__function::__default_alloc_func<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}, void ()>::operator()[abi:v15000]() (this=0x7f47a4f4cc10)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:235
#31 std::__1::__function::__policy_invoker<void ()>::__call_impl<std::__1::__function::__default_alloc_func<ThreadFromGlobalPoolImpl<true>::ThreadFromGlobalPoolImpl<DB::PipelineExecutor::spawnThreads()::$_0>(DB::PipelineExecutor::spawnThreads()::$_0&&)::{lambda()#1}, void ()> >(std::__1::__function::__policy_storage const*) (__buf=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:716
#32 0x0000000013757419 in std::__1::__function::__policy_func<void ()>::operator()[abi:v15000]() const (this=0x7f47c49f4d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:848
#33 std::__1::function<void ()>::operator()() const (this=0x7f47c49f4d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:1187
#34 ThreadPoolImpl<std::__1::thread>::worker (this=0x7f494be3fb00, 
thread_it=...) at ./src/Common/ThreadPool.cpp:294
#35 0x000000001375a26e in ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}::operator()() const (this=0x7f482203c8a8)
at ./src/Common/ThreadPool.cpp:144
#36 std::__1::__invoke[abi:v15000]<ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#37 std::__1::__thread_execute[abi:v15000]<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>&, std::__1::__tuple_indices<>) (__t=...)
at ./contrib/llvm-project/libcxx/include/thread:284
#38 std::__1::__thread_proxy[abi:v15000]<std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> >(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>) (__vp=0x7f482203c8a0)
at ./contrib/llvm-project/libcxx/include/thread:295
#39 0x00007f494cf30609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#40 0x00007f494ce45133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
