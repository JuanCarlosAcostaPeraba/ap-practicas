% --------------------
% Programa Flujo maximo
% --------------------
% Enunciado: Dado un grafo dirigido donde existen dos nodos especiales, uno llamado fuente (s),  y otro llamado sumidero (t). A cada arista se le asocia cierta capacidad positiva. Se plantean como restricciones que para cada nodo del grafo, excepto el nodo fuente y el nodo sumidero, la suma de flujos entrantes a un nodo debe ser igual a la suma de flujos que salen de el; y que el flujo tanto de entrada como de salida no puede superar la capacidad de la arista correspondiente. El flujo va a ser siempre positivo o cero (>= 0) y con unidades enteras. El flujo que entra en un vertice es igual al que sale. El flujo que atraviesa una arista  nunca sera mayor que la capacidad, solo puede ser menor o igual que ella.
% Salida:    max flow = flujo maximo

% Codigo dado por el profesor -------------|
int: num_nodes;                          % |
int: num_edges;                          % |
1..num_nodes:source;                     % |
1..num_nodes:sink;                       % |
array[1..num_edges, 1..2] of int: edges; % |
array[1..num_edges] of int: capacity;    % |
var int: max_flow;                       % |
array[1..num_edges] of var int: flow;    % |
output ["max flow =" ++ show(max_flow)]; % |
% -----------------------------------------|

% Entradas
num_nodes = 9; % Numero de nodos
source= 1; % Nodo fuente
sink = 9; % Nodo sumidero
num_edges = 14; % Numero de aristas
edges = array2d(1..num_edges, 1..2, [
    1, 2,
    1, 4,
    2, 3,
    2, 4,
    3, 5,
    3, 8,
    4, 5,
    5, 2,
    5, 6,
    5, 7,
    6, 7,
    6, 8,
    7, 9,
    8, 9]); % Matriz de aristas
capacity = [14,23,10, 9,12,18,26,11,25, 4, 7, 8,15,20]; % Capacidad de cada arista

% Escriba su codigo a partir de aqui
constraint forall (i in 1..num_edges)(flow[i] <= capacity[i]); % El flujo tiene que ser menor a la capacidad de la tuberia
constraint forall (i in 1..num_edges)(flow[i] >= 0); % El flujo tiene que ser positivo
constraint forall (i in 1..num_nodes where i != source /\ i != sink)(sum(j in 1..num_edges where edges[j, 1] == i)(flow[j]) == sum(k in 1..num_edges where edges[k, 2] == i)(flow[k])); % El flujo de entrada y salida de cada nodo tiene que ser igual
constraint max_flow = sum(i in 1..num_edges where edges[i, 2] == sink)(flow[i]); % El flujo maximo tiene que ser igual al flujo que sale del sumidero

solve maximize max_flow; % Se busca el flujo maximo