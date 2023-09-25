% --------------------
% Programa Sudoku
% --------------------
% Enunciado: Sudoku
% Salida:    Sudoku resuelto

% Codigo dado por el profesor --|
include "globals.mzn";        % |
set of int: R = 1..9;         % |
array[R,R] of var R: s;       % |
% ------------------------------|

% Entradas
s=[|
_, _, _, _, _, _, _, _, _|
_, 6, 8, 4, _, 1, _, 7, _|
_, _, _, _, 8, 5, _, 3, _|
_, 2, 6, 8, _, 9, _, 4, _|
_, _, 7, _, _, _, 9, _, _|
_, 5, _, 1, _, 6, 3, 2, _|
_, 4, _, 6, 1, _, _, _, _|
_, 3, _, 2, _, 7, 6, 9, _|
_, _, _, _, _, _, _, _, _|
|]; % Sudoku inicial

% Escriba su codigo a partir de aqui
array[R] of R: first_i = [((k-1) div 3) * 3 + 1| k in R]; % Primer numero de la fila
array[R] of R: first_j = [((k-1) mod 3) * 3 + 1| k in R]; % Primer numero de la columna

constraint forall (i in R)(alldifferent([s[i, j] | j in R])); % Restriccion de que todos los numeros de una fila sean distintos
constraint forall (j in R)(alldifferent([s[i, j] | i in R])); % Restriccion de que todos los numeros de una columna sean distintos
constraint forall (k in R)(alldifferent([s[i, j] | i in first_i[k]..first_i[k] + 2, j in first_j[k]..first_j[k] + 2])); % Restriccion de que todos los numeros de una region sean distintos

solve satisfy; % Resolver cumpliendo las restricciones

output [show([s[i,j]| j in R]) ++ "\n"| i in R]; % Salida