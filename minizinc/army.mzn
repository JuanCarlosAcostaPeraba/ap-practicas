% --------------------
% Programa Army
% --------------------
% Enunciado: Reclutar en ejercito. Presupuesto maximo de 10000$. Soldados de 4 pueblos distintos (F, L, Z, J).
%            [F]: Fuerza: 6. Coste: 13$. Maximo 1000 soldados.
%            [L]: Fuerza: 10. Coste: 21$. Maximo 400 soldados.
%            [Z]: Fuerza: 8. Coste: 17$. Maximo 500 soldados.
%            [J]: Fuerza: 40. Coste: 100$. Maximo 150 soldados.
%            Maximizar la fuerza del ejercito.
% Salida:    F = valor
%            L = valor
%            Z = valor
%            J = valor

% Entradas
int: presupuesto_maximo = 1000; % presupuesto maximo

% Escriba su codigo a partir de aqui
var 0..1000: F; % numero de soldados de F
var 0..400: L; % numero de soldados de L
var 0..500: Z; % numero de soldados de Z
var 0..150: J; % numero de soldados de J

constraint (F * 13 + L * 21 + Z * 17 + J * 100) <= presupuesto_maximo; % Coste total no puede superar el presupuesto maximo

solve maximize (F * 6 + L * 10 + Z * 8 + J * 40); % Maximizar la fuerza del ejercito

output ["F = \(F)\nL = \(L)\nZ = \(Z)\nJ = \(J)"]; % Salida