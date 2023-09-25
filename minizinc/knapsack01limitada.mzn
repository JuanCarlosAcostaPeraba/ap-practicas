% --------------------
% Programa Knapsack 0/1 limitada
% --------------------
% Enunciado: Plantear un modelo de la mochila, donde los objetos pueden incluirse en la mochila una sola vez. Crear un set of int de ITEM y 2 arrays de int de peso (weight) y valor (value). La variable de decision (taken) indica si un item se mete en la mochila. Soolo puede haber m items de entre los que se encuentren en un set de limitacion (limitation).
% Salida:    taken = vector de elementos seleccionados
%            value = valor de la mochila

% Codigo dado por el profesor --|
int: n;                       % |
int: capacity;                % |
set of int: ITEMS = 1..n;     % |
array[ITEMS] of int: value;   % |
array[ITEMS] of int: weight;  % |
int: m;                       % |
set of ITEMS: limitation;     % |
% ------------------------------|

% Entradas
n = 3; % Numero de elementos
capacity = 10; % Capacidad de la mochila
value = [45,48,35]; % Valor de cada elemento
weight = [5,5,3]; % Peso de cada elemento
m = 1; % Numero de elementos a seleccionar del conjunto de limitacion
limitation = {1,2}; % Elementos que se pueden seleccionar

% Escriba su codigo a partir de aqui
var set of ITEMS: taken; % Elementos seleccionados

constraint card(taken intersect limitation) <= m; % Limite de elementos seleccionados
constraint sum(i in taken)(weight[i]) <= capacity; % Restriccion de peso

solve maximize sum(i in taken)(value[i]); % Maximizar el valor

output["taken = \(taken)\ntotal Value = \(sum(i in taken)(value[i]))"]; % Salida