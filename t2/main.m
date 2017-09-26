format long

% Polynom
P = [1 -3.4 +2.35  4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441  0  0  0];

disp("Letra A: ")
XA = f_rootsA(P)

disp("Letra B: ")
XB = f_roots(P)

disp("Letra C: ")
disp("XF = x^3*(x+1)^2*(x-0.899999999999996)^6")

disp("Letra D: ")
Roots_octave = roots(P)
Roots_wolfram = [-1, 0, 0.898175-0.00105142i, 0.898175+0.00105142i, 0.899996-0.00210907i, 0.899996+0.00210907i, 0.901828-0.00105766i, 0.901828+0.00105766i]
                        