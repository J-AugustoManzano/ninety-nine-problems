% 5.06a (**)  Lisp-like tree representation

% This is a simple solution for the conversion of trees
% into "lispy token lists"  (i,o)

% tree_ltl(T,L) :- L is the "lispy token list" of the multiway tree T
% (i,o)

tree_ltl(t(X,[]),[X]).
tree_ltl(t(X,[T|Ts]),L) :-
   tree_ltl(T,L1),
   append(['(',X],L1,L2),
   rest_ltl(Ts,L3),
   append(L2,L3,L).

rest_ltl([],[')']).
rest_ltl([T|Ts],L) :-
   tree_ltl(T,L1),
   rest_ltl(Ts,L2),
   append(L1,L2,L).


% some auxiliary predicates

write_ltl([]) :- nl.
write_ltl([X|Xs]) :- write(X), write(' '), write_ltl(Xs).

dotest(T) :- write(T), nl, tree_ltl(T,L), write_ltl(L).

test(1) :- T = t(a,[t(b,[]),t(c,[])]), dotest(T).

test(2) :- T = t(a,[t(b,[t(c,[])])]), dotest(T).
test(3) :- T = t(a,[t(f,[t(g,[])]),t(c,[]),t(b,[t(d,[]),t(e,[])])]), dotest(T).
