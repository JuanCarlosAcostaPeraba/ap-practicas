% --------------------
% Programa Transportistas
% --------------------
% Enunciado: Una empresa tiene que realizar n envios. Para ello dispone de k transportistas y t camiones. Cada transportista y cada camion se dedica en cada momento. Cada envio tarda un tiempo determinado en realizarse y requiere una cantidad prefijada de transportistas y de camiones. No pueden haber dos camiones comenzando un envio a la vez. Se trata de minimizar el tiempo total emplreado en realizar los envios.
% Salida:    Tiempo total: tiempo
%            array con los tiempos de inicio por camionero

% Codigo dado por el profesor -------------------------------------------------------|
include "globals.mzn";                                                             % |
int: n;                                                                            % |
int: k;                                                                            % |
int: t;                                                                            % |
int: max_tiempo;                                                                   % |
array [1..n] of int: tiempo;                                                       % |
array [1..n] of int: transportistas;                                               % |
array [1..n] of int: camiones;                                                     % |
output["Tiempo total: "++show(total)++"\n"]++[show(comienzo[i])++" " | i in 1..n]; % |
% -----------------------------------------------------------------------------------|

% Entradas
n = 6; % Numero de transportes
k = 5; % Numero total de tranportista
t = 3; % Numero total de camiones
max_tiempo = 100; % Tiempo maximo del que se dispone
tiempo = [2, 4, 6, 3, 1, 2]; % Tiempo de ejecucion de cada transporte
transportistas = [2, 3, 2, 4, 1, 1]; % Transportistas necesarios para cada transporte
camiones = [3, 2, 1, 2, 2, 3]; % Camiones necesarios para cada transporte

% Escriba su codigo a partir de aqui
include "cumulative.mzn"; % Importa el modelo de cumulative

var 0..max_tiempo: total; % Tiempo total empleado
array[1..n] of var 0..max_tiempo: comienzo; % Tiempo de comienzo de cada transporte

constraint cumulative(comienzo, tiempo, transportistas, k); % Restriccion de cumulative
constraint cumulative(comienzo, tiempo, camiones, t); % Restriccion de cumulative
constraint forall (i in 1..n)(comienzo[i] + tiempo[i] <= total); % Restriccion de forall

solve minimize total; % Restriccion de minimizacion