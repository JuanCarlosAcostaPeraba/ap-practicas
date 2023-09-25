% --------------------
% Programa Encuentra incognitas
% --------------------
% Enunciado: Genera un modelo, sabiendo que la suma de los palillos de las incognitas es 12, y que los valores de las incognitas son diferentes. Operacion: 23?3 + ?98? = ?3?1
% Salida:    Array con los numeros encontrados

% Codigo dado por el profesor ---|
include "alldifferent.mzn";    % |
set of int: DIGIT;             % |
array[DIGIT] of int: palillos; % |
array[1..5] of var DIGIT: x;   % |
% -------------------------------|

% Entradas
DIGIT = 1..9; % Digitos del modelo
palillos = [1, 2, 3, 4, 5, 2, 3, 4, 5]; % Palillos del modelo

% Escriba su codigo a partir de aqui
constraint sum(i in x)(palillos[i]) = 12; % Suma de los palillos de las incognitas
constraint alldifferent(x); % Todos los valores de las incognitas son diferentes
constraint (2303 + x[1] * 10) + (0980 + x[2] * 1000 + x[3]) = (0301 + x[4] * 1000 + x[5] * 10); % Operacion

solve satisfy; % Resuelve el modelo

output ["result = \(x)"]; % Salida