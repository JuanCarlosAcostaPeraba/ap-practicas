% --------------------
% Programa Planificacion temporal
% --------------------
% Enunciado: Una empresa tiene que desarrollar n aplicaciones. Para ello dispone de k programadores, y suponemos que cada programador se dedica a una sola aplicacion en cada momento. Cada aplicacion tarda un tiempo determinado en realizarse y requiere una cantidad prefijada de programadores. Se trata de minimizar el tiempo que se requiere para acabar los n programas.
% Salida:    Total: tiempo total de ejecucion de todas las aplicaciones

% Codigo dado por el profesor ------------------------------------------------|
include "cumulative.mzn";                                                   % |
int:n;                                                                      % |
int:k;                                                                      % |
int:max_tiempo;                                                             % |
array [1..n] of int: tiempo;                                                % |
array [1..n] of int: prog;                                                  % |
output["Total: "++show(total)++"\n"]++[show(comienzo[i])++" " | i in 1..n]; % |
% ----------------------------------------------------------------------------|

% Entradas
n = 4; % Numero de aplicaciones
k = 5; % Numero de programadores
max_tiempo = 100; % Maximo tiempo de ejecucion
tiempo = [2, 4, 6, 3]; % Tiempo de ejecucion de cada aplicacion
prog = [3, 2, 4, 2]; % Programadores necesarios para cada aplicacion

% Escriba su codigo a partir de aqui
array [1..n] of var 0..max_tiempo: comienzo; % Comienzo de cada aplicacion
var 0..max_tiempo: total; % Tiempo total de ejecucion

constraint cumulative(comienzo, tiempo, prog, k); % Restricciones de planificacion
constraint forall (i in 1..n)(comienzo[i] + tiempo[i] <= total); % Restricciones de planificacion

solve minimize total; % Minimizar el tiempo total de ejecucion