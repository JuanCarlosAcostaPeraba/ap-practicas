% --------------------
% Programa Array
% --------------------
% Enunciado: Construir un modelo con un parametro n = 5, que define la longitud del array. El array contiene variables de decision con valores entre 1..9. La suma de los valores del array es igual al producto de los valores del array. La salida debe ser el array resultante. Anadir la restriccion de que el orden de los valores del array es creciente (x[1] <= x[2] ... <= x[n]). El objetivo es maximizar la suma de los valores.
% Salida:    x = [valores de x];

% Entradas
int: length = 5; % longitud del array

% Escriba su codigo a partir de aqui
array[1..length] of var 1..9: arr; % Array de decisiones con valores entre 1..9

constraint sum(arr) == product(arr); % Suma de los valores del array es igual al producto de los valores del array
constraint forall (i in 1..length - 1)(arr[i] <= arr[i + 1]); % El orden de los valores del array es creciente

solve maximize sum(arr); % Maximizar la suma de los valores

output ["x = \(arr)"]; % Salida