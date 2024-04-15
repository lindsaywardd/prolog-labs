% Michael Washington, Lindsay Ward
% 4/12/24

% Constraint Problems 1-4

:- lib(lists).
:- lib(fd).
:- lib(fd_search).

% 1.

% digits(X)
% Predicate to find valid arrangements of digits
digits(X) :-
    X = [A, B, C, D],     % X represents the list of four numbers [A, B, C, D]

    % Represent digits using lists for easy manipulation 
    Digits = [D1, D2, D3, D4, D5, D6, D7, D8, D9],
    Digits :: [1..9],                % Digits must be between 1 and 9
    alldifferent(Digits),          % All digits must be unique

    % Construct numbers from digits
    A #= D1*100 + D2*10 + D3,
    B #= D4*10 + D5,
    C #= D6*10 + D7,   
    D #= D8*10 + D9,
 
    % Constraint: Product equality
    A * B #= C * D,

    % Labeling to find specific solutions 
    labeling([A, B, C, D]). 

% maxdigits(X)
% Predicate to find arrangement with the largest product
maxdigits(X) :-
    digits(X),         % Find a valid arrangement of digits
    A * B #= P,        % Calculate the product
    NegP #= -P,      % Negate the product to maximize it
    minimize(labeling(X), NegP).   % Labeling to maximize the product P



% 2.

hay(X) :-
    X = [A,B,C,D,E],
    X :: [1..121],
    Y = [_1,_2,_3,_4,_5,_6,_7,_8,_9,_10],
    Y :: [110,112,113,114,115,116,117,118,120,121],
    alldifferent(Y),
    A+B #= _1,
    A+C #= _2,
    A+D #= _3,
    A+E #= _4,
    B+C #= _5,
    B+D #= _6,
    B+E #= _7,
    C+D #= _8,
    C+E #= _9,
    D+E #= _10,
    labeling(Y),
    labeling(X).



% 3.

beer(B) :-
    Barrels = [15, 20, 31, 19, 16, 18],
    member(B, Barrels),
    _q + 2*_q + B #= sum(Barrels). 



% 4. 
% may take a while 
% optimize w order of things in list and order of constraints

% planets(X) should find all sol.s for PLANETS value
% planets2(X) should just be planets(X) with constraints for finding single solution (assumption)

planets(X) :- 
        Vals = [P, L, A, N, E, T, S, U, R, O, V, J, M, C, Y, H, I],    % vars for each letter 
        Vals :: [1..26],   % diff val per letter
        alldifferent(Vals),


        % Print initial values 
        write("Initial values of Vals: "), write(Vals), nl,


        P + L + U + T + O #= 40,
        U + R + A + N + U + S #= 36,
        N + E + P + T + U + N + E #= 29,
        S + A + T + U + R + N #= 33,
        J + U + P + I + T + E + R #= 50,
         M + A + R + S #= 32,
        E + A + R + T + H #= 31,
        M + O + O + N #= 36,
         V + E + N + U + S #= 39,
        M + E + R + C + U + R + Y #= 33,
        S + U + N #= 18,      


        % Now for PLANETS
        P + L + A + N + E + T + S #= X,


        % Print the values after constraints have been applied
        write("Values of Vals after constraints: "), write(Vals), nl,

        labeling(Vals),         % find the values

        % Print the solution
        write("Solution: "), write(Vals), nl.

planets2(X) :- planets(X),
        X #= 52.         % constraint to narrow down PLANETS value, random int picked for now but modify for 1 sol (once planets(X) works)
