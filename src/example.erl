-module(example).

-compile(export_all).
-include_lib("eqc/include/eqc.hrl").

delete_element_try1(_, []) ->
    [];
delete_element_try1(Element, [Element|List]) ->
    List;
delete_element_try1(Element, [Other|List]) ->
    [Other|delete_element_try1(Element, List)].

prop_delete_0_try1() ->
    ?FORALL({X, Xs}, {int(), list(int())},
            lists:delete(X, Xs) == delete_element_try1(X, Xs)).