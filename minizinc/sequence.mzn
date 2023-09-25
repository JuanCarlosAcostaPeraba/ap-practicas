% --------------------
% Programa Sequence
% --------------------
% Enunciado: El parametro n define la longitud del array. El array contiene variables de decision con valores entre 0..3. El primer valor en 0, el ultimo vale 3, y la suma de 2 numeros adyacentes en el array es como mucho 3. El valor en posiciones divisibles por 3 tiene que ser mayor o igual a 2. Maximizar la suma de los valores en el array.
% Salida:    suma = array

% Codigo dado por el profesor --|
int: n = 5;                   % |
% ------------------------------|

% Escriba su codigo a partir de aqui
array[1..n] of var 0..3: x; % Declaracion de array

constraint x[1] = 0; % Poner el primer valor en 0
constraint x[n] = 3; % Poner el ultimo valor en 3
constraint forall (i in 1..n - 1)(x[i] + x[i + 1] <= 3); % Restriccion de suma
constraint forall (i in 1..n-1 where i mod 3 == 0)(x[i] >= 2); % Restriccion de valor en posiciones divisibles por 3

solve maximize sum(x); % Raximizar la suma de los valores en el array

output ["\(sum(x)) = \(x)"]; % Salida