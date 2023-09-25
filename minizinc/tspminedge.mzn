% --------------------
% Programa TSP trayecto parcial minimo
% --------------------
% Enunciado: Dado un problema de TSP (circuito hamiltoniano), a diferencia del problema clasico donde el objetivo es minimizar la distancia total del recorrido, queremos en este caso que el objetivo sea minimizar la distancia mayor entre cada par de ciudades, es decir, queremos minimizar la distancia del maximo trayecto parcial. Hay que tener en cuenta que maxAllowedEdge indica la distancia maxima que queremos que haya en el circuito hamiltoniano, numCities indica el numero de vertices de nuestro grafo, distance es la matriz de distancias entre ciudades. Cuando la distancia entre 2 ciudades es -1, no hay camino entre ambas.
% Salida:    succ = array de nodos visitados
%            maxEdge = peso del camino mas largo

% Codigo dado por el profesor -------|
include "globals.mzn";             % |
int: numCities;                    % |
set of int: City = 1..numCities;   % |
int: maxAllowedEdge;               % |
array[City,City] of int: distance; % |
% -----------------------------------|

% Entradas
numCities = 15; % Numero de ciudades
maxAllowedEdge = 600; % Distancia maxima permitida
distance = [|0,-1,250,-1,-1,473,-1,172,-1,372,360,414,-1,-1,243
|-1,0,-1,-1,99,161,284,-1,-1,-1,446,431,478,262,457
|250,-1,0,-1,-1,-1,573,408,697,159,281,332,-1,-1,219
|-1,-1,-1,0,-1,-1,296,-1,400,481,392,338,172,449,-1
|-1,99,-1,-1,0,247,196,-1,-1,-1,410,384,380,181,446
|473,161,-1,-1,247,0,391,519,-1,-1,448,453,-1,422,416
|-1,284,573,296,196,391,0,-1,670,480,293,247,224,233,375
|172,-1,408,-1,-1,519,-1,0,-1,542,524,576,-1,-1,407
|-1,-1,697,400,-1,-1,670,-1,0,545,605,577,567,-1,-1
|372,-1,159,481,-1,-1,480,542,545,0,201,234,-1,-1,216
|360,446,281,392,410,448,293,524,605,201,0,56,445,-1,118
|414,431,332,338,384,453,247,576,577,234,56,0,390,478,171
|-1,478,-1,172,380,-1,224,-1,567,-1,445,390,0,295,-1
|-1,262,-1,449,181,422,233,-1,-1,-1,-1,478,295,0,-1
|243,457,219,-1,446,416,375,407,-1,216,118,171,-1,-1,0|]; % Matriz de distancias

% Escriba su codigo a partir de aqui
array [1..numCities] of var 1..maxAllowedEdge :succ; % Array de nodos visitados
var 1..maxAllowedEdge: maxEdge; % Peso del camino mas largo

constraint maxEdge = max(i in 1..numCities) (distance[i, succ[i]]); % Constraint de peso del camino mas largo
constraint circuit(succ); % Constraint de circuito hamiltoniano
constraint forall (x in City, y in City where distance[x, y] == -1)(succ[x] != y); % Constraint de no existencia de camino entre 2 ciudades

solve minimize maxEdge; % Minimizar el peso del camino mas largo

output ["succ = \(succ)\nmaxEdge = \(maxEdge)"]; % Salida