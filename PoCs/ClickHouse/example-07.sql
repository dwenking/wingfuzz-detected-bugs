SET allow_experimental_analyzer = 1;
CREATE FUNCTION 02125_function_1 AS x -> 02125_function_2(x);
CREATE FUNCTION 02125_function_2 AS x -> 02125_function_1(x);
SELECT 02125_function_2(2);


/*
Thread 3 "HTTPHandler" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f3da51de700 (LWP 105325)]
0x000000000c649766 in void std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >::__emplace_back_slow_path<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >&&) ()
#0 0x000000000c649766 in void std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >::__emplace_back_slow_path<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >&&) ()
#1 0x000000001385fccd in std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >::emplace_back<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > (this=0x7f3da49df090, __args=...)
at ./contrib/llvm-project/libcxx/include/vector:1600
#2 std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >::vector<boost::iterators::transform_iterator<boost::algorithm::detail::copy_iterator_rangeF<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::__wrap_iter<char*> >, boost::algorithm::split_iterator<std::__1::__wrap_iter<char*> >, boost::use_default, boost::use_default> > (this=0x7f3da49df090, 
__first=..., __last=...)
at ./contrib/llvm-project/libcxx/include/vector:1125
#3 0x0000000019e40db5 in boost::algorithm::iter_split<std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >&, boost::algorithm::detail::token_finderF<DB::Identifier::Identifier(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)::{lambda(char)#1}> >(std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >&, boost::algorithm::detail::token_finderF<DB::Identifier::Identifier(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)::{lambda(char)#1}>) (Result=..., 
Input=..., Finder=Finder@entry=...)
at ./contrib/boost/boost/algorithm/string/iter_find.hpp:186
#4 0x0000000019e406e8 in boost::algorithm::split<std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >&, DB::Identifier::Identifier(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)::{lambda(char)#1}>(std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >&, DB::Identifier::Identifier(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)::{lambda(char)#1}, boost::algorithm::token_compress_mode_type) (Result=..., Input=..., 
eCompress=boost::algorithm::token_compress_off, Pred=...)
at ./contrib/boost/boost/algorithm/string/split.hpp:158
#5 DB::Identifier::Identifier (this=0x7f3da49df500, full_name_=...)
at ./src/Analyzer/Identifier.h:43
#6 0x0000000019ec9907 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3998
#7 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#9 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#10 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#11 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#12 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
........
#8930 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8931 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8932 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8933 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8934 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8935 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8936 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8937 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8938 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8939 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8940 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8941 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8942 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8943 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8944 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8945 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8946 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8947 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8948 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8949 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8950 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8951 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8952 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8953 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8954 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8955 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8956 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8957 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8958 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8959 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8960 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8961 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8962 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8963 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8964 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8965 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8966 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8967 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8968 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8969 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8970 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8971 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8972 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8973 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8974 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8975 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8976 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8977 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8978 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8979 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8980 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8981 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8982 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8983 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8984 0x0000000019ed9bfa in DB::(anonymous namespace)::QueryAnalyzer::resolveLambda (this=this@entry=0x7f3da51d2670, lambda_node=..., 
lambda_node_to_resolve=..., lambda_arguments=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:3930
#8985 0x0000000019ed0202 in DB::(anonymous namespace)::QueryAnalyzer::resolveFunction (this=this@entry=0x7f3da51d2670, node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4231
#8986 0x0000000019e9ec1e in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNode (this=this@entry=0x7f3da51d2670, node=..., scope=..., 
allow_lambda_expression=false, allow_table_expression=false)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4804
#8987 0x0000000019e9cf61 in DB::(anonymous namespace)::QueryAnalyzer::resolveExpressionNodeList (this=this@entry=0x7f3da51d2670, node_list=..., scope=..., 
allow_lambda_expression=<optimized out>, 
allow_table_expression=<optimized out>)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:4929
#8988 0x0000000019e901f7 in DB::(anonymous namespace)::QueryAnalyzer::resolveProjectionExpressionNodeList (this=0x7f3da51d2670, projection_node_list=..., 
scope=...) at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:5099
#8989 DB::(anonymous namespace)::QueryAnalyzer::resolveQuery (
this=this@entry=0x7f3da51d2670, query_node=..., scope=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:5928
#8990 0x0000000019e8baad in DB::(anonymous namespace)::QueryAnalyzer::resolve (
this=0x7f3da51d2670, node=..., table_expression=..., context=...)
at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:996
#8991 DB::QueryAnalysisPass::run (this=0x7f3d96662dc0, query_tree_node=..., 
context=...) at ./src/Analyzer/Passes/QueryAnalysisPass.cpp:6249
#8992 0x0000000019e896e5 in DB::QueryTreePassManager::run (
this=0x7f3da51d29f8, query_tree_node=...)
at ./src/Analyzer/QueryTreePassManager.cpp:99
#8993 0x000000001a572de7 in DB::(anonymous namespace)::buildQueryTreeAndRunPasses (context=..., query=...)
at ./src/Interpreters/InterpreterSelectQueryAnalyzer.cpp:54
#8994 DB::InterpreterSelectQueryAnalyzer::InterpreterSelectQueryAnalyzer (
this=0x7f3d967d6280, query_=..., select_query_options_=..., context_=...)
at ./src/Interpreters/InterpreterSelectQueryAnalyzer.cpp:66
#8995 0x0000000019f41ce2 in std::__1::make_unique[abi:v15000]<DB::InterpreterSelectQueryAnalyzer, std::__1::shared_ptr<DB::IAST>&, DB::SelectQueryOptions const&, std::__1::shared_ptr<DB::Context>&>(std::__1::shared_ptr<DB::IAST>&, DB::SelectQueryOptions const&, std::__1::shared_ptr<DB::Context>&) (__args=..., 
__args=..., __args=...)
at ./contrib/llvm-project/libcxx/include/__memory/unique_ptr.h:714
#8996 DB::InterpreterFactory::get (query=..., context=..., options=...)
at ./src/Interpreters/InterpreterFactory.cpp:140
#8997 0x000000001aa6267e in DB::executeQueryImpl (
begin=begin@entry=0x7f3d96662fe0 "\nSELECT 02125_function_2(2);", 
end=end@entry=0x7f3d96662ffc "", context=..., internal=false, 
stage=DB::QueryProcessingStage::Complete, istr=0x7f3d967ee150)
at ./src/Interpreters/executeQuery.cpp:640
#8998 0x000000001aa69f6d in DB::executeQuery(DB::ReadBuffer&, DB::WriteBuffer&, bool, std::__1::shared_ptr<DB::Context>, std::__1::function<void (std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&)>, std::__1::optional<DB::FormatSettings> const&) (istr=..., ostr=..., allow_into_outfile=<optimized out>, 
context=..., set_result_details=..., output_format_settings=...)
at ./src/Interpreters/executeQuery.cpp:1152
#8999 0x000000001bc87941 in DB::HTTPHandler::processQuery (
this=this@entry=0x7f3d967c05a0, request=..., params=..., response=..., 
used_output=..., query_scope=...) at ./src/Server/HTTPHandler.cpp:800
#9000 0x000000001bc8aded in DB::HTTPHandler::handleRequest (
this=0x7f3d967c05a0, request=..., response=...)
at ./src/Server/HTTPHandler.cpp:975
#9001 0x000000001bd17585 in DB::HTTPServerConnection::run (this=0x7f3d96672000)
at ./src/Server/HTTP/HTTPServerConnection.cpp:65
#9002 0x000000001e51dda7 in Poco::Net::TCPServerConnection::start (
this=0x7f3da49df090) at ./contrib/poco/Net/src/TCPServerConnection.cpp:43
#9003 0x000000001e51e28d in Poco::Net::TCPServerDispatcher::run (
this=0x7f3eb1f99100) at ./contrib/poco/Net/src/TCPServerDispatcher.cpp:115
#9004 0x000000001e68b807 in Poco::PooledThread::run (this=0x7f3eb1e30100)
at ./contrib/poco/Foundation/src/ThreadPool.cpp:199
#9005 0x000000001e6893e3 in Poco::ThreadImpl::runnableEntry (
pThread=0x7f3eb1e30138)
at ./contrib/poco/Foundation/src/Thread_POSIX.cpp:345
#9006 0x00007f3eb2ef8609 in start_thread (arg=<optimized out>)
at pthread_create.c:477
#9007 0x00007f3eb2e0d133 in clone ()
at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
*/
