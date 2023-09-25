% --------------------
% Programa House Robber
% --------------------
% Enunciado: Problema del ladron, el cual debe elegir que casas debe robar para conseguir el maximo beneficio. Para que no se activen las alarmas, si roba en una casa no puede robar en la casa siguiente.
% Salida:    taken = array de casas robadas
%            value = beneficio obtenido

% Codigo dado por el profesor --|
int: n;                       % |
array [1..n] of int: value;   % |
% ------------------------------|

% Entradas
n = 5; % Numero de casas
value = [3,10,3,1,2]; % Casas robadas y beneficio obtenido

% Escriba su codigo a partir de aqui
array[1..n] of var 0..1: taken; % Array de casas robadas

constraint forall (i in 1..n - 1)(taken[i] + taken[i + 1] <= 1); % No se puede robar dos casas a la vez

solve maximize sum(i in 1..n)(taken[i] * value[i]); % Maximizar beneficio

output ["taken = \(taken)\nvalue = \(sum(i in 1..n)(taken[i] * value[i]))"]; % Salida