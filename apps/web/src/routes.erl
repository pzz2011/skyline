-module (routes).
-author('Maxim Sokhatsky').
-behaviour (route_handler).
-include_lib("n2o/include/wf.hrl").
-export([init/2, finish/2]).

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, Ctx) -> 
    Path = wf:path(Ctx#context.req),
    %error_logger:info_msg("Routes path: ~p", [Path]),
    {Module, PathInfo} = route(Path),
    {ok, State, Ctx#context{path=PathInfo,module=Module}}.

route(<<"/">>) -> {login, []};
route(<<"/index">>) -> {index, []};
route(<<"/hello">>) -> {hello, []};
route(<<"/login">>) -> {login, []};
route(<<"/account">>) -> {account, []};
route(<<"/containers">>) -> {containers, []};
route(<<"/tblist">>) -> {tblist, []};
route(<<"/products">>) -> {products, []};
route(<<"/product">>) -> {product, []};
route(<<"/product", Rest/binary>>) -> {product, [Rest]};
route(<<"/feed">>) -> {feed, []};
route(<<"/chat">>) -> {chat, []};
route(<<"/ws/">>) -> {login, []};
route(<<"/ws/index">>) -> {index, []};
route(<<"/ws/login">>) -> {login, []};
route(<<"/ws/account">>) -> {account, []};
route(<<"/ws/containers">>) -> {containers, []};
route(<<"/ws/hello">>) -> {hello, []};
route(<<"/ws/tblist">>) -> {tblist, []};
route(<<"/ws/products">>) -> {products, []};
route(<<"/ws/product">>) -> {product, []};
route(<<"/ws/product",_Rest/binary>>) -> {product, []};
route(<<"/ws/feed">>) -> {feed, []};
route(<<"/ws/chat">>) -> {chat, []};
route(<<"/favicon.ico">>) -> {static_file, []};
route(_) -> {index, []}.

