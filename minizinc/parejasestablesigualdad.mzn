% --------------------
% Programa Parejas estables (maxima igualdad)
% --------------------
% Enunciado: Resolver el problema de parejas estables, minimizando las diferencias entre hombres y mujeres.
% Salida:    wife: array de mujeres
%            husband: array de hombres
%            obj_men: numero de hombres que obtienen como esposa a la primera escogida
%            obj_women: numero de mujeres que obtienen como marido al primero escogido

% Codigo dado por el profesor -----|
include "globals.mzn";           % |
enum Women;                      % |
enum Men;                        % |
array[Women, Men] of int: wrank; % |
array[Men, Women] of int: mrank; % |
% ---------------------------------|

% Entradas
Women = {Ana, Marta, Patricia};
Men = {Carlos, Marco, Juan};
wrank = [|1, 2, 3, |3, 2, 1, |3, 1, 2 |];
mrank = [|2, 1, 3, |1, 2, 3, |1, 3, 2 |];

% Escriba su codigo a partir de aqui
array[Men] of var Women: wife;
array[Women] of var Men: husband;
var int: obj_men;
var int: obj_women;

constraint (obj_women == sum(w in Women)(wrank[w, husband[w]] == 1));
constraint (obj_men = sum(m in Men)(mrank[m, wife[m]] == 1));
constraint forall(m in Men, w in Women)(wrank[w, m] < wrank[w, husband[w]] -> mrank[m, wife[m]] < mrank[m, w]) /\ forall(w in Women, m in Men)(mrank[m, w] < mrank[m, wife[m]] -> wrank[w, husband[w]] < wrank[w, m]) /\  inverse(wife, husband);

solve minimize (abs(obj_men - obj_women));

output["wife : \(wife)\nhusband : \(husband)\nobj_men: \(obj_men)\nobj_women: \(obj_women)"]; % Salida