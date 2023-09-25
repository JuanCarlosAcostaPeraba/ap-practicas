% --------------------
% Programa Knapsack 0/1
% --------------------
% Enunciado: Plantear un modelo del problema de la mochila. Crear un set of int de ITEMS y 2 arrays de peso (weight) y valor (value). La variable de decision (taken) indica si un item se mete en la mochila, con una repeticion maxima de una vez cada objeto.
% Salida:    taken = vector de elementos seleccionados
%            value = valor de la mochila

% Codigo dado por el profesor --|
int: n;                       % |
int: capacity;                % |
set of int: ITEMS = 1..n;     % |
array[ITEMS] of int: value;   % |
array[ITEMS] of int: weight;  % |
% ------------------------------|

% Entradas
n = 3; % Numero de elementos
capacity = 10; % Capacidad de la mochila
value = [45,48,35]; % Valor de cada elemento
weight = [5,8,3]; % Peso de cada elemento

% Escriba su codigo a partir de aqui
array[1..n] of var 0..1: taken; % Vector de elementos seleccionados

constraint sum(i in 1..n)(taken[i] * weight[i]) <= capacity; % Restriccion de peso

solve maximize sum(i in 1..n)(taken[i] * value[i]); % Maximizar el valor

output["taken = \(taken)\ntotal Value = \(sum(i in 1..n)(taken[i] * value[i]))"]; % Salida