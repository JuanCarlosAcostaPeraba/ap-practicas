% --------------------
% Programa Emparejamiento perfecto de coste minimo
% --------------------
% Enunciado: Dado un grafo, con un numero par de vertices diseñar un modelo que nos permita obtener el emparejamiento perfecto de coste minimo. El coste entre un par de vertices (coste de la arista) viene determinado en una tabla.
% Salida:    coste minimo -> array con los nodos

% Codigo dado por el profesor -----------|
include "globals.mzn";                 % |
int: n;                                % |
set of int: VERTEX = 1..n;             % |
array[VERTEX, VERTEX] of int: weights; % |
array[VERTEX] of var VERTEX: edge;     % |
% ---------------------------------------|

% Entradas
n = 6; % Numero de vertices
weights = [|
10000,   5,     3,     10000,  2,     10000|
5,       10000, 10000, 3,      10000, 2|
3,       10000, 10000, 4,      3,     10000|
10000,   3,     4,     10000,  10000, 2|
2,       10000, 3,     10000,  10000, 5|
10000,   2,     10000, 2,      5,     10000|
|]; % Pesos de las aristas

% Escriba su codigo a partir de aqui
var int: result; % Resultado del emparejamiento

constraint alldifferent(edge); % Todos los vertices deben ser emparejados
constraint forall(i in VERTEX)(edge[i] != i); % No se puede emparejar con el mismo vertice
constraint inverse(edge, edge); % No se puede emparejar dos vertices con el mismo vertice
constraint result = sum(i in VERTEX where i < edge[i])(weights[edge[i], i]); % Coste de los emparejamientos

solve minimize result; % Minimizamos el coste

output["\(result) -> \(edge)"]; % Salida