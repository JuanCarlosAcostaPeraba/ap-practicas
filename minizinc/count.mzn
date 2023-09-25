% --------------------
% Programa Count
% --------------------
% Enunciado: Cuantos soldados tiene mi ejercito? Se sabe que el numero esta entre 100 y 500. Se ordenan en columnas de 5 soldados y sobran 2. Se ordenan en columnas de 7 soldados y sobran 2. Se ordenan en columnas de 12 soldados y sobra 1.
% Salida:    army = valor

% Entradas
var 100..500: army; % Numero de soldados en el ejercito

% Escriba su codigo a partir de aqui
constraint army mod 5 = 2; % Numero de soldados en cada columna
constraint army mod 7 = 2; % Numero de soldados en cada columna
constraint army mod 12 = 1; % Numero de soldados en cada columna

solve satisfy; % Resuelve el problema

output ["army = \(army)"]; % Salida