% --------------------
% Programa X optima
% --------------------
% Enunciado: Construir un modelo con una variable de decision (x) en el rango 0..10, con la restriccion de que x debe ser divisible por 4, la salida (obj) debe ser aquella que minimice el valor (x - 7)^2.
% Salida:    x = valor de x
%            obj = valor de obj

% Escriba su codigo a partir de aqui
var 0..10: x; % Variable de decision x que va entre 0 y 10
var int: obj = pow(x - 7, 2); % Variable para la salida

constraint x mod 4 == 0; % Restriccion de que x debe ser divisible por 4

solve minimize obj; % Optimizacion de la salida

output ["x = \(x)\nobj = \(obj)"]; % Salida