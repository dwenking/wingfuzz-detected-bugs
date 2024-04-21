SET allow_experimental_analyzer = 1;
SET optimize_rewrite_sum_if_to_count_if = 1;
SELECT sum(if(number % 2 == 0 as cond_expr, 1 as one_expr, 0 as zero_expr) as if_expr), sum(cond_expr), sum(if_expr), one_expr, zero_expr FROM numbers(100);

/*
Thread 3 "HTTPHandler" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f604bbde700 (LWP 26664)]
DB::(anonymous namespace)::SumIfToCountIfVisitor::visitImpl (
this=<optimized out>, node=...)
at ./src/Analyzer/Passes/SumIfToCountIfPass.cpp:106
106 ./src/Analyzer/Passes/SumIfToCountIfPass.cpp: No such file or directory.
#0 DB::(anonymous namespace)::SumIfToCountIfVisitor::visitImpl (
this=<optimized out>, node=...)
at ./src/Analyzer/Passes/SumIfToCountIfPass.cpp:106
#1 DB::InDepthQueryTreeVisitor<DB::(anonymous namespace)::SumIfToCountIfVisitor, false>::visit (this=this@entry=0x7f604bbd2970, query_tree_node=...)
at ./src/Analyzer/InDepthQueryTreeVisitor.h:52
#2 0x0000000019f1d6c9 in DB::InDepthQueryTreeVisitor<DB::(anonymous namespace)::SumIfToCountIfVisitor, false>::visitChildren (this=0x7f604bbd2970, 
expression=...) at ./src/Analyzer/InDepthQueryTreeVisitor.h:79
#3 DB::InDepthQueryTreeVisitor<DB::(anonymous namespace)::SumIfToCountIfVisitor, false>::visit (this=this@entry=0x7f604bbd2970, query_tree_node=...)
at ./src/Analyzer/InDepthQueryTreeVisitor.h:55
#4 0x0000000019f1d6c9 in DB::InDepthQueryTreeVisitor<DB::(anonymous namespace)::SumIfToCountIfVisitor, false>::visitChildren (this=0x7f604bbd2970, 
expression=...) at ./src/Analyzer/InDepthQueryTreeVisitor.h:79
#5 DB::InDepthQueryTreeVisitor<DB::(anonymous namespace)::SumIfToCountIfVisitor, false>::visit (this=this@entry=0x7f604bbd2970, query_tree_node=...)
at ./src/Analyzer/InDepthQueryTreeVisitor.h:55
#6 0x0000000019f1d48f in DB::SumIfToCountIfPass::run (this=<optimized out>, 
query_tree_node=..., context=...)
at ./src/Analyzer/Passes/SumIfToCountIfPass.cpp:154
#7 0x0000000019e896e5 in DB::QueryTreePassManager::run (this=0x7f604bbd29f8, 
query_tree_node=...) at ./src/Analyzer/QueryTreePassManager.cpp:99
#8 0x000000001a572de7 in DB::(anonymous namespace)::buildQueryTreeAndRunPasses
(context=..., query=...)
at ./src/Interpreters/InterpreterSelectQueryAnalyzer.cpp:54
#9 DB::InterpreterSelectQueryAnalyzer::InterpreterSelectQueryAnalyzer (
this=0x7f5ff587d8c0, query_=..., select_query_options_=..., context_=...)
at ./src/Interpreters/InterpreterSelectQueryAnalyzer.cpp:66
#10 0x0000000019f41ce2 in std::__1::make_unique[abi:v15000]<DB::InterpreterSelectQueryAnalyzer, std::__1::shared_ptr<DB::IAST>&, DB::SelectQueryOptions const&, std::__1::shared_ptr<DB::Context>&>(std::__1::shared_ptr<DB::IAST>&, DB::SelectQueryOptions const&, std::__1::shared_ptr<DB::Context>&) (__args=..., 
__args=..., __args=...)
at ./contrib/llvm-project/libcxx/include/__memory/unique_ptr.h:714
#11 DB::InterpreterFactory::get (query=..., context=..., options=...)
at ./src/Interpreters/InterpreterFactory.cpp:140
#12 0x000000001aa6267e in DB::executeQueryImpl (
begin=begin@entry=0x7f5ff584ba00 "\nSELECT sum(if(number % 2 == 0 as cond_expr, 1 as one_expr, 0 as zero_expr) as if_expr), sum(cond_expr), sum(if_expr), one_expr, zero_expr FROM numbers(100);14169912092264998081, user_id: 94309d50-4f5"..., 
end=end@entry=0x7f5ff584ba9d "14169912092264998081, user_id: 94309d50-4f52-5250-31bd-74fecac179db", context=..., internal=false, 
stage=DB::QueryProcessingStage::Complete, istr=0x7f5ff5833830)
at ./src/Interpreters/executeQuery.cpp:640
#13 0x000000001aa69f6d in DB::executeQuery(DB::ReadBuffer&, DB::WriteBuffer&, bool, std::__1::shared_ptr<DB::Context>, std::__1::function<void (std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)>, std::__1::optional<DB::FormatSettings> const&) (istr=..., ostr=..., allow_into_outfile=<optimized out>, context=..., 
set_result_details=..., output_format_settings=...)
at ./src/Interpreters/executeQuery.cpp:1152
#14 0x000000001bc87941 in DB::HTTPHandler::processQuery (
this=this@entry=0x7f5ff585dd00, request=..., params=..., response=..., 
used_output=..., query_scope=...) at ./src/Server/HTTPHandler.cpp:800
#15 0x000000001bc8aded in DB::HTTPHandler::handleRequest (this=0x7f5ff585dd00, 
request=..., response=...) at ./src/Server/HTTPHandler.cpp:975
#16 0x000000001bd17585 in DB::HTTPServerConnection::run (this=0x7f5ff5846580)
at ./src/Server/HTTP/HTTPServerConnection.cpp:65
#17 0x000000001e51dda7 in Poco::Net::TCPServerConnection::start (this=0x0)
at ./contrib/poco/Net/src/TCPServerConnection.cpp:43
#18 0x000000001e51e28d in Poco::Net::TCPServerDispatcher::run (
this=0x7f6014897400) at ./contrib/poco/Net/src/TCPServerDispatcher.cpp:115
#19 0x000000001e68b807 in Poco::PooledThread::run (this=0x7f6158830100)
at ./contrib/poco/Foundation/src/ThreadPool.cpp:199
#20 0x000000001e6893e3 in Poco::ThreadImpl::runnableEntry (
pThread=0x7f6158830138)
at ./contrib/poco/Foundation/src/Thread_POSIX.cpp:345
#21 0x00007f61597d8609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#22 0x00007f61596ed133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
