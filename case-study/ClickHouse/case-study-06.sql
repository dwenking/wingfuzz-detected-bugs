SET allow_experimental_analyzer = 1;
CREATE TABLE tztest (`timela` UInt64, `timeberlin` String, INDEX tok_bf (timeberlin, lower(timeberlin)) TYPE tokenbf_v1(512, 3, 0) GRANULARITY 1) ENGINE = MergeTree ORDER BY timela SETTINGS index_granularity = 8;
insert into tztest values (1, 'a') (2, 'b') (3, 'c') (4, 'd');
SELECT * FROM tztest WHERE timeberlin in (1,1000,1005,50000) order by timeberlin;


/*
Thread 4 "HTTPHandler" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f1b38bc9700 (LWP 25787)]
DB::MergeTreeConditionFullText::tryPrepareSetBloomFilter (
this=this@entry=0x7f1aa4c12d38, left_argument=..., right_argument=..., 
out=...) at ./src/Storages/MergeTree/MergeTreeIndexFullText.cpp:658
658 ./src/Storages/MergeTree/MergeTreeIndexFullText.cpp: No such file or directory.
#0 DB::MergeTreeConditionFullText::tryPrepareSetBloomFilter (
this=this@entry=0x7f1aa4c12d38, left_argument=..., right_argument=..., 
out=...) at ./src/Storages/MergeTree/MergeTreeIndexFullText.cpp:658
#1 0x000000001b896b2b in DB::MergeTreeConditionFullText::extractAtomFromTree (
this=0x7f1aa4c12d38, node=..., out=...)
at ./src/Storages/MergeTree/MergeTreeIndexFullText.cpp:372
#2 0x000000001b89ad69 in std::__1::__function::__policy_func<bool (DB::RPNBuilderTreeNode const&, DB::MergeTreeConditionFullText::RPNElement&)>::operator()[abi:v15000](DB::RPNBuilderTreeNode const&, DB::MergeTreeConditionFullText::RPNElement&) const (this=0x0, this@entry=0x7f1b38bbc098, __args=..., __args=...)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:848
#3 std::__1::function<bool (DB::RPNBuilderTreeNode const&, DB::MergeTreeConditionFullText::RPNElement&)>::operator()(DB::RPNBuilderTreeNode const&, DB::MergeTreeConditionFullText::RPNElement&) const (this=0x0, this@entry=0x7f1b38bbc098, 
__arg=..., __arg=...)
at ./contrib/llvm-project/libcxx/include/__functional/function.h:1187
#4 DB::RPNBuilder<DB::MergeTreeConditionFullText::RPNElement>::traverseTree (
this=this@entry=0x7f1b38bbc148, node=...)
at ./src/Storages/MergeTree/RPNBuilder.h:238
#5 0x000000001b894e69 in DB::RPNBuilder<DB::MergeTreeConditionFullText::RPNElement>::RPNBuilder(DB::ActionsDAG::Node const*, std::__1::shared_ptr<DB::Context const>, std::__1::function<bool (DB::RPNBuilderTreeNode const&, DB::MergeTreeConditionFullText::RPNElement&)> const&) (this=0x7f1b38bbc148, 
filter_actions_dag_node=0x7f1aa4c150d0, query_context_=..., 
extract_atom_from_tree_function_=...)
at ./src/Storages/MergeTree/RPNBuilder.h:193
#6 DB::MergeTreeConditionFullText::MergeTreeConditionFullText (
this=this@entry=0x7f1aa4c12d38, query_info=..., context=..., 
index_sample_block=..., params_=..., token_extactor_=0x7f1aa4da1240)
at ./src/Storages/MergeTree/MergeTreeIndexFullText.cpp:160
#7 0x000000001b8989ed in std::__1::construct_at[abi:v15000]<DB::MergeTreeConditionFullText, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*, DB::MergeTreeConditionFullText*>(DB::MergeTreeConditionFullText*, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*&&) (__args=<optimized out>, 
__args=<optimized out>, __args=<optimized out>, __args=<optimized out>, 
__location=<optimized out>, __args=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__memory/construct_at.h:35
#8 std::__1::allocator_traits<std::__1::allocator<DB::MergeTreeConditionFullText> >::construct[abi:v15000]<DB::MergeTreeConditionFullText, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*, void, void>(std::__1::allocator<DB::MergeTreeConditionFullText>&, DB::MergeTreeConditionFullText*, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*&&) (__args=<optimized out>, 
__args=<optimized out>, __args=<optimized out>, __args=<optimized out>, 
__p=<optimized out>, __args=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__memory/allocator_traits.h:298
#9 std::__1::__shared_ptr_emplace<DB::MergeTreeConditionFullText, std::__1::allocator<DB::MergeTreeConditionFullText> >::__shared_ptr_emplace[abi:v15000]<DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*>(DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*&&) (this=0x7f1aa4c12d20, 
__args=<optimized out>, __args=<optimized out>, __args=<optimized out>, 
__args=<optimized out>, __a=..., __args=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__memory/shared_ptr.h:292
#10 std::__1::allocate_shared[abi:v15000]<DB::MergeTreeConditionFullText, std::__1::allocator<DB::MergeTreeConditionFullText>, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*, void>(std::__1::allocator<DB::MergeTreeConditionFullText> const&, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*&&) (__args=<optimized out>, __args=<optimized out>, __args=<optimized out>, 
__a=..., __args=<optimized out>, __args=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__memory/shared_ptr.h:953
#11 std::__1::make_shared[abi:v15000]<DB::MergeTreeConditionFullText, DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*, void>(DB::SelectQueryInfo const&, std::__1::shared_ptr<DB::Context const>&, DB::Block const&, DB::BloomFilterParameters const&, DB::ITokenExtractor*&&) (__args=<optimized out>, 
__args=<optimized out>, __args=<optimized out>, __args=<optimized out>, 
__args=<optimized out>)
at ./contrib/llvm-project/libcxx/include/__memory/shared_ptr.h:962
#12 DB::MergeTreeIndexFullText::createIndexCondition (this=<optimized out>, 
query=..., context=...)
at ./src/Storages/MergeTree/MergeTreeIndexFullText.cpp:682
#13 0x000000001b8566fb in DB::MergeTreeDataSelectExecutor::filterPartsByPrimaryKeyAndSkipIndexes (parts=..., metadata_snapshot=..., query_info=..., 
context=..., key_condition=..., reader_settings=..., log=0x7f1aa4c531c0, 
num_streams=10, index_stats=..., use_skip_indexes=<optimized out>)
at ./src/Storages/MergeTree/MergeTreeDataSelectExecutor.cpp:935
#14 0x000000001c271457 in DB::ReadFromMergeTree::selectRangesToReadImpl (
parts=..., metadata_snapshot_base=..., metadata_snapshot=..., 
query_info=..., context=..., num_streams=<optimized out>, 
max_block_numbers_to_read=..., data=..., real_column_names=..., 
sample_factor_column_queried=<optimized out>, log=<optimized out>)
at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:1113
#15 0x000000001c26e9ea in DB::ReadFromMergeTree::selectRangesToRead (
parts=..., prewhere_info=..., added_filter_nodes=..., 
metadata_snapshot_base=..., metadata_snapshot=..., query_info=..., 
context=..., num_streams=10, max_block_numbers_to_read=..., data=..., 
real_column_names=..., sample_factor_column_queried=<optimized out>, 
log=0x7f1aa4c531c0) at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:969
#16 0x000000001c26d890 in DB::ReadFromMergeTree::selectRangesToRead (
this=this@entry=0x7f1aa4d11000, parts=...)
at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:901
#17 0x000000001c273dbd in DB::ReadFromMergeTree::getAnalysisResult (
this=this@entry=0x7f1aa4d11000)
at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:1206
#18 0x000000001c2742e6 in DB::ReadFromMergeTree::initializePipeline (
this=0x7f1aa4d11000, pipeline=...)
at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:1215
#19 0x000000001c2247d2 in DB::ISourceStep::updatePipeline (
this=0x7f1aa4d11000, settings=...)
at ./src/Processors/QueryPlan/ISourceStep.cpp:16
#20 0x000000001c24f9bf in DB::QueryPlan::buildQueryPipeline (
this=0x7f1aa4d6c7f8, optimization_settings=..., 
build_pipeline_settings=...)
at ./src/Processors/QueryPlan/QueryPlan.cpp:187
#21 0x000000001a57355a in DB::InterpreterSelectQueryAnalyzer::execute (
this=0x7f1aa4d6c780)
at ./src/Interpreters/InterpreterSelectQueryAnalyzer.cpp:98
#22 0x000000001aa635d2 in DB::executeQueryImpl (
begin=begin@entry=0x7f1aa4c0a880 "\nSELECT * FROM tztest WHERE timeberlin in (1,1000,1005,50000) order by timeberlin;09d50-4f52-5250-31bd-74fecac179db", 
end=end@entry=0x7f1aa4c0a8d2 "09d50-4f52-5250-31bd-74fecac179db", 
context=..., internal=false, stage=DB::QueryProcessingStage::Complete, 
istr=0x7f1aa4d81460) at ./src/Interpreters/executeQuery.cpp:686
#23 0x000000001aa69f6d in DB::executeQuery(DB::ReadBuffer&, DB::WriteBuffer&, bool, std::__1::shared_ptr<DB::Context>, std::__1::function<void (std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)>, std::__1::optional<DB::FormatSettings> const&) (istr=..., ostr=..., allow_into_outfile=<optimized out>, context=..., 
set_result_details=..., output_format_settings=...)
at ./src/Interpreters/executeQuery.cpp:1152
#24 0x000000001bc87941 in DB::HTTPHandler::processQuery (
this=this@entry=0x7f1aa4c12000, request=..., params=..., response=..., 
used_output=..., query_scope=...) at ./src/Server/HTTPHandler.cpp:800
#25 0x000000001bc8aded in DB::HTTPHandler::handleRequest (this=0x7f1aa4c12000, 
request=..., response=...) at ./src/Server/HTTPHandler.cpp:975
#26 0x000000001bd17585 in DB::HTTPServerConnection::run (this=0x7f1aa4c0a000)
at ./src/Server/HTTP/HTTPServerConnection.cpp:65
#27 0x000000001e51dda7 in Poco::Net::TCPServerConnection::start (this=0x0)
at ./contrib/poco/Net/src/TCPServerConnection.cpp:43
#28 0x000000001e51e28d in Poco::Net::TCPServerDispatcher::run (
this=0x7f1b1fe64800) at ./contrib/poco/Net/src/TCPServerDispatcher.cpp:115
#29 0x000000001e68b807 in Poco::PooledThread::run (this=0x7f1c46030600)
at ./contrib/poco/Foundation/src/ThreadPool.cpp:199
#30 0x000000001e6893e3 in Poco::ThreadImpl::runnableEntry (
pThread=0x7f1c46030638)
at ./contrib/poco/Foundation/src/Thread_POSIX.cpp:345
#31 0x00007f1c46f76609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#32 0x00007f1c46e8b133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
