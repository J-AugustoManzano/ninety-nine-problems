% 2.11 (*) Compare the two methods of calculating Euler's totient function. 
% Use the solutions of problems 2.09 and 2.10 to compare the algorithms. 
% Take the number of logical inferences as a measure for efficiency.

:- ensure_loaded(p2_09).
:- ensure_loaded(p2_10).

totient_test(N) :-
   write('totient_phi (p2_09):'),
   time(totient_phi(N,Phi1)),
   write('result = '), write(Phi1), nl,
   write('totient_phi_2 (p2_10):'),
   time(totient_phi_2(N,Phi2)),
   write('result = '), write(Phi2), nl.

