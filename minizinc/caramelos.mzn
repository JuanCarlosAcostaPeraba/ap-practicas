% --------------------
% Programa Caramelos
% --------------------
% Enunciado: Rosa es maestra de jardin y quiere premiar con caramelos a los ninos en su clase. Todos los ninos se sientan en fila y cada uno de ellos tiene ha tenido una calificacion acorde con las tareas que ha hecho durante el curso. Rosa quiere regalar al menos 1 caramelo a cada nino, pero debe tener cuidado porque los ninos se ponen celosos si ven que Rosa da muchos caramelos a sus vecinos inmediatos; para evitarlo:
%          - cuando dos ninos estan sentados uno al lado del otro, y los dos han tenido la misma calificacion, los dos reciben el mismo número de caramelos
%          - si dos ninos se sientan al lado y tienen calificaciones diferentes entonces Rosa da mas caramelos al nino que tiene la calificacion mas alta
%          - ademas, para evitar un desagravio comparativo demasiado notable, Rosa no debe dar a ningun nino el doble o mas que a ningun otro
%            Ademas, como Rosa quiere ahorrar dinero, quiere minimizar el numero total de caramelos que debe comprar para repartir a sus alumnos.
% Salida:    n caramelos --> array con caramelos dados

% Codigo dado por el profesor ------------|
int: n;                                 % |
array[1..n] of int: nota;               % |
int: max_caramelos = 100000;            % |
array[1..n] of var 1..max_caramelos: x; % |
var int: total_caramelos;               % |
output [ show(total_caramelos) ];       % |
% ----------------------------------------|

% Entradas
n = 3;
nota = [2, 4, 3];

% Escriba su codigo a partir de aqui
constraint total_caramelos <= max_caramelos;
constraint forall (i in 1..n)(x[i] >= 1); % Al menos 1 caramelo a cada nino
constraint forall (i in 1..n - 1 where nota[i] = nota[i + 1])(x[i] = x[i + 1]); % Dos ninos vecinos con nota igual, reciben mismos caramelos
constraint forall (i in 1..n - 1 where nota[i] < nota[i + 1])(x[i] < x[i + 1]); % Si el nino vecino tiene mas nota, recibe mas caramelos
constraint forall (i in 1..n, j in 1..n where i != j)(x[i] < (x[j] * 2)); % Ningun nino puede tener mas del doble que otro nino
constraint total_caramelos = sum(x); % Total de caramelos es la suma de los repartidos

solve minimize total_caramelos; % Minimizamos el numero de caramelos dados

output ["\n\(total_caramelos) --> \(x)"]; % Salida propia
