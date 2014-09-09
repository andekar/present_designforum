-module(example).

-compile(export_all).

delete_element_try1(_, []) ->
    [];
delete_element_try1(Element, [Element|List]) ->
    List;
delete_element_try1(Element, [_Other|List]) ->
    delete_element_try1(Element, List).

prop_delete_0_try1() ->
    ?FORALL({X, Xs}, {int(), list(int())},
            not lists:member(X, delete_element_try1(X, Xs))).