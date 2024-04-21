SET allow_experimental_object_type = 1;
CREATE TABLE test(t UInt64, flag Object(Nullable('JSON')))
ENGINE = MergeTree ORDER BY tuple();
INSERT INTO test FORMAT JSONEachRow {"t": 1, "flag": {"k1": 1, "k2" : 2}} {"t": 2, "flag": {"k2": 3, "k3" : 4}};
select * from test as t1 join test as t2 on t1.t = t2.t join test as t3 on t2.t = t3.t ORDER BY t1.t FORMAT PrettyCompactNoEscapes;

/*
Thread 219 "Formatter" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fb69747f700 (LWP 4547)]
DB::ColumnObject::Subcolumn::getFinalizedColumn (this=0x7fb69afe7370)
at ./src/Columns/ColumnObject.cpp:589
589 ./src/Columns/ColumnObject.cpp: No such file or directory.
#0 DB::ColumnObject::Subcolumn::getFinalizedColumn (this=0x7fb69afe7370)
at ./src/Columns/ColumnObject.cpp:589
#1 0x0000000019523bb8 in DB::SerializationObject<DB::JSONDataParser<DB::SimdJSONParser> >::serializeTextFromSubcolumn (this=this@entry=0x7fb6951673d8, 
subcolumn=..., row_num=row_num@entry=0, ostr=..., settings=...)
at ./src/DataTypes/Serializations/SerializationObject.cpp:432
#2 0x00000000195239b8 in DB::SerializationObject<DB::JSONDataParser<DB::SimdJSONParser> >::serializeTextImpl (this=0x7fb6951673d8, column=..., row_num=0, 
ostr=..., settings=...)
at ./src/DataTypes/Serializations/SerializationObject.cpp:419
#3 0x000000001bf02fa9 in DB::PrettyBlockOutputFormat::calculateWidths (
this=0x7fb695158018, header=..., chunk=..., widths=..., 
max_padded_widths=..., name_widths=...)
at ./src/Processors/Formats/Impl/PrettyBlockOutputFormat.cpp:65
#4 0x000000001bf0ae90 in DB::PrettyCompactBlockOutputFormat::writeChunk (
this=0x7fb695158018, chunk=..., port_kind=<optimized out>)
at ./src/Processors/Formats/Impl/PrettyCompactBlockOutputFormat.cpp:188
#5 0x000000001bf07c5e in DB::PrettyBlockOutputFormat::write (
this=0x7fb695158018, chunk=..., port_kind=DB::IOutputFormat::Main)
at ./src/Processors/Formats/Impl/PrettyBlockOutputFormat.cpp:166
#6 DB::PrettyBlockOutputFormat::consume (this=0x7fb695158018, chunk=...)
at ./src/Processors/Formats/Impl/PrettyBlockOutputFormat.cpp:385
#7 0x000000001beef059 in DB::ParallelFormattingOutputFormat::formatterThreadFunction (this=0x7fb69afea918, current_unit_number=<optimized out>, 
first_row_num=<optimized out>, thread_group=...)
at ./src/Processors/Formats/Impl/ParallelFormattingOutputFormat.cpp:197
#8 0x00000000137592b9 in std::__1::__function::__policy_func<void ()>::operator()[abi:v15000]() const (this=0x7fb697476980)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:848
#9 std::__1::function<void ()>::operator()() const (this=0x7fb697476980)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:1187
#10 ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::worker (
this=this@entry=0x7fb69afeaae0, thread_it=thread_it@entry=...)
at ./src/Common/ThreadPool.cpp:294
#11 0x000000001375b7fc in ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}::operator()() const (this=<optimized out>)
at ./src/Common/ThreadPool.cpp:144
#12 std::__1::__invoke[abi:v15000]<ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}&> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#13 std::__1::__apply_tuple_impl[abi:v15000]<ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}&, std::__1::tuple<>&>(ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}&, std::__1::tuple<>&, std::__1::__tuple_indices<>) (__f=..., __t=...)
at ./contrib/llvm-project/libcxx/include/tuple:1789
#14 std::__1::apply[abi:v15000]<ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}&, std::__1::tuple<>&>(ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}&, std::__1::tuple<>&) (
__f=..., __t=...) at ./contrib/llvm-project/libcxx/include/tuple:1798
#15 ThreadFromGlobalPoolImpl<false>::ThreadFromGlobalPoolImpl<ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>(ThreadPoolImpl<ThreadFromGlobalPoolImpl<false> >::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}&&)::{lambda()#1}::operator()() (this=0x7fb69afe6ef0) at ./src/Common/ThreadPool.h:196
#16 0x0000000013757419 in std::__1::__function::__policy_func<void ()>::operator()[abi:v15000]() const (this=0x7fb697476d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:848
#17 std::__1::function<void ()>::operator()() const (this=0x7fb697476d50)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:1187
#18 ThreadPoolImpl<std::__1::thread>::worker (this=0x7fb82143fb00, 
thread_it=...) at ./src/Common/ThreadPool.cpp:294
#19 0x000000001375a26e in ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}::operator()() const (this=0x7fb69ae64e08)
at ./src/Common/ThreadPool.cpp:144
#20 std::__1::__invoke[abi:v15000]<ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> (__f=...)
at ./contrib/llvm-project/libcxx/include/__functional/invoke.h:394
#21 std::__1::__thread_execute[abi:v15000]<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>&, std::__1::__tuple_indices<>) (__t=...)
at ./contrib/llvm-project/libcxx/include/thread:284
#22 std::__1::__thread_proxy[abi:v15000]<std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}> >(std::__1::tuple<std::__1::unique_ptr<std::__1::__thread_struct, std::__1::default_delete<std::__1::__thread_struct> >, ThreadPoolImpl<std::__1::thread>::scheduleImpl<void>(std::__1::function<void ()>, long, std::__1::optional<unsigned long>, bool)::{lambda()#2}>) (__vp=0x7fb69ae64e00)
at ./contrib/llvm-project/libcxx/include/thread:295
#23 0x00007fb822524609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#24 0x00007fb822439133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
