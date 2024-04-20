SET allow_experimental_analyzer = 1;
CREATE TABLE default_join1(b DateTime, default_join2 DateTime default b - toIntervalHour(8), a Int64) Engine=MergeTree PARTITION BY (toYYYYMM(toDateTime(b)), ignore(default_join2)) ORDER BY a;
INSERT INTO default_join1(b, a) SELECT toDateTime('2023-01-31 22:30:00') AS b, number FROM numbers(1000);
explain estimate select DISTINCT _partition_id from default_join1 where default_join2 >= '2021-12-31 00:00:00' and default_join2 < '2022-01-01 00:00:00';


/*
std::__1::__hash_table<std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData>, std::__1::__unordered_map_hasher<std::__1::shared_ptr<DB::IQueryTreeNode>, std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData>, std::__1::hash<std::__1::shared_ptr<DB::IQueryTreeNode> >, std::__1::equal_to<std::__1::shared_ptr<DB::IQueryTreeNode> >, true>, std::__1::__unordered_map_equal<std::__1::shared_ptr<DB::IQueryTreeNode>, std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData>, std::__1::equal_to<std::__1::shared_ptr<DB::IQueryTreeNode> >, std::__1::hash<std::__1::shared_ptr<DB::IQueryTreeNode> >, true>, std::__1::allocator<std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData> > >::find<std::__1::shared_ptr<DB::IQueryTreeNode> > (this=0x48, __k=...) at ./contrib/llvm-project/libcxx/include/__hash_table:2307
2307 ./contrib/llvm-project/libcxx/include/__hash_table: No such file or directory.
(gdb) bt
#0 std::__1::__hash_table<std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData>, std::__1::__unordered_map_hasher<std::__1::shared_ptr<DB::IQueryTreeNode>, std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData>, std::__1::hash<std::__1::shared_ptr<DB::IQueryTreeNode> >, std::__1::equal_to<std::__1::shared_ptr<DB::IQueryTreeNode> >, true>, std::__1::__unordered_map_equal<std::__1::shared_ptr<DB::IQueryTreeNode>, std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData>, std::__1::equal_to<std::__1::shared_ptr<DB::IQueryTreeNode> >, std::__1::hash<std::__1::shared_ptr<DB::IQueryTreeNode> >, true>, std::__1::allocator<std::__1::__hash_value_type<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData> > >::find<std::__1::shared_ptr<DB::IQueryTreeNode> > (this=0x48, __k=...) at ./contrib/llvm-project/libcxx/include/__hash_table:2307
#1 0x0000000015aeef74 in std::__1::unordered_map<std::__1::shared_ptr<DB::IQueryTreeNode>, DB::TableExpressionData, std::__1::hash<std::__1::shared_ptr<DB::IQueryTreeNode> >, std::__1::equal_to<std::__1::shared_ptr<DB::IQueryTreeNode> >, std::__1::allocator<std::__1::pair<std::__1::shared_ptr<DB::IQueryTreeNode> const, DB::TableExpressionData> > >::find[abi:v15000](std::__1::shared_ptr<DB::IQueryTreeNode> const&) (this=0x48, __k=...) at ./contrib/llvm-project/libcxx/include/unordered_map:1443
#2 DB::PlannerContext::getTableExpressionDataOrThrow (this=<optimized out>, table_expression_node=...) at ./src/Planner/PlannerContext.cpp:72
#3 0x0000000016c59508 in DB::ReadFromMergeTree::selectRangesToRead (parts=..., prewhere_info=..., added_filter_nodes=..., metadata_snapshot_base=..., metadata_snapshot=..., query_info=..., 
context=..., num_streams=10, max_block_numbers_to_read=..., data=..., real_column_names=..., sample_factor_column_queried=<optimized out>, log=0x7fa8ea5f0400)
at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:958
#4 0x0000000016c58e26 in DB::ReadFromMergeTree::selectRangesToRead (this=this@entry=0x7fa8ea4ae000, parts=...) at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:901
#5 0x0000000016c5c293 in DB::ReadFromMergeTree::getAnalysisResult (this=this@entry=0x7fa8ea4ae000) at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:1206
#6 0x0000000016c5c407 in DB::ReadFromMergeTree::initializePipeline (this=0x7fa8ea4ae000, pipeline=...) at ./src/Processors/QueryPlan/ReadFromMergeTree.cpp:1215
#7 0x0000000016c302f1 in DB::ISourceStep::updatePipeline (this=0x7fa8ea4ae000, settings=...) at ./src/Processors/QueryPlan/ISourceStep.cpp:16
#8 0x0000000016c48b07 in DB::QueryPlan::buildQueryPipeline (this=0x7fa8ef205e60, optimization_settings=..., build_pipeline_settings=...) at ./src/Processors/QueryPlan/QueryPlan.cpp:187
#9 0x00000000157185f3 in DB::InterpreterExplainQuery::executeImpl (this=this@entry=0x7fa866aecae0) at ./src/Interpreters/InterpreterExplainQuery.cpp:527
#10 0x0000000015716e04 in DB::InterpreterExplainQuery::execute (this=0x7fa866aecae0) at ./src/Interpreters/InterpreterExplainQuery.cpp:87
#11 0x0000000015dad24e in DB::executeQueryImpl (
begin=begin@entry=0x7fa8ea5fb000 "\nexplain estimate select DISTINCT _partition_id from default_join1 where default_join2 >= '2021-12-31 00:00:00' and default_join2 < '2022-01-01 00:00:00';e47542d70 Authenticated with global context a"..., end=end@entry=0x7fa8ea5fb09b "e47542d70 Authenticated with global context as user 94309d50-4f52-5250-31bd-74fecac179db", context=..., internal=false, 
stage=DB::QueryProcessingStage::Complete, istr=0x7fa8ea5cd2d0) at ./src/Interpreters/executeQuery.cpp:686
#12 0x0000000015db0aba in DB::executeQuery(DB::ReadBuffer&, DB::WriteBuffer&, bool, std::__1::shared_ptr<DB::Context>, std::__1::function<void (std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)>, std::__1::optional<DB::FormatSettings> const&) (istr=..., ostr=..., 
allow_into_outfile=<optimized out>, context=..., set_result_details=..., output_format_settings=...) at ./src/Interpreters/executeQuery.cpp:1152
#13 0x00000000168bf641 in DB::HTTPHandler::processQuery (this=this@entry=0x7fa8ea478e80, request=..., params=..., response=..., used_output=..., query_scope=...) at ./src/Server/HTTPHandler.cpp:800
#14 0x00000000168c2aed in DB::HTTPHandler::handleRequest (this=0x7fa8ea478e80, request=..., response=...) at ./src/Server/HTTPHandler.cpp:975
#15 0x000000001691cd31 in DB::HTTPServerConnection::run (this=0x7fa8ea47a000) at ./src/Server/HTTP/HTTPServerConnection.cpp:65
#16 0x0000000018d2da07 in Poco::Net::TCPServerConnection::start (this=0x48) at ./contrib/poco/Net/src/TCPServerConnection.cpp:43
#17 0x0000000018d2deed in Poco::Net::TCPServerDispatcher::run (this=0x7fa899a83400) at ./contrib/poco/Net/src/TCPServerDispatcher.cpp:115
#18 0x0000000018e9e827 in Poco::PooledThread::run (this=0x7fa997e2f100) at ./contrib/poco/Foundation/src/ThreadPool.cpp:199
#19 0x0000000018e9c403 in Poco::ThreadImpl::runnableEntry (pThread=0x7fa997e2f138) at ./contrib/poco/Foundation/src/Thread_POSIX.cpp:345
#20 0x00007fa998eb9609 in start_thread (arg=<optimized out>) at pthread_create.c:477
#21 0x00007fa998dce133 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
