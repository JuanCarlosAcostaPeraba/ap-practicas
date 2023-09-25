% --------------------
% Programa Dieta
% --------------------
% Enunciado: 
% Salida:    main = primer plato, side = acompanamiento, dessert = postre, cost = costo total

% Codigo dado por el profesor -----------------------------|
include "table.mzn";                                     % |
int: min_energy;                                         % |
int: min_protein;                                        % |
int: max_salt;                                           % |
int: max_fat;                                            % |
set of FOOD: desserts;                                   % |
set of FOOD: mains;                                      % |
set of FOOD: sides;                                      % |
enum FEATURE = { name, energy, protein, salt, fat, cost};% |
enum FOOD;                                               % |
array[FOOD, FEATURE] of int: dd;                         % |
set of FOOD: limitation;                                 % |
int: max_in_limitation;                                  % |
array[FEATURE] of var int: main;                         % |
array[FEATURE] of var int: side;                         % |
array[FEATURE] of var int: dessert;                      % |
var int: budget;                                         % |
% ---------------------------------------------------------|

% Entradas
min_energy = 3300;
min_protein = 500;
max_salt = 180;
max_fat = 320;
desserts = {icecream, banana, chocolatecake, cheesecake, strawberry, brownie, chocolatemousse, apple, tiramisu};
mains = { lasagna, steak, rice, tacos, spaghetti, croquette, sanjacobo, meatloaf, soup };
sides = { chips, brocolli, beans,potatoes, salad, mashedpotato,carrot, puree, gazpacho };
FOOD = {icecream, banana, chocolatecake, lasagna, steak, rice, chips, brocolli, beans,cheesecake, strawberry, brownie, tacos, spaghetti, croquette, potatoes, salad, mashedpotato, chocolatemousse, apple, tiramisu, sanjacobo, meatloaf, soup, carrot, puree, gazpacho};
dd = [| icecream, 1200, 50, 10, 120, 400 % icecream
| banana, 800, 120, 5, 20, 120 % banana
| chocolatecake, 2500, 400, 20, 100, 600 % chocolate cake
| lasagna, 3000, 200, 100, 250, 450 % lasagna
| steak, 1800, 800, 50, 100, 1200 % steak
| rice, 1200, 50, 5, 20, 100 % rice
| chips, 2000, 50, 200, 200, 250 % chips
| brocolli, 700, 100, 10, 10, 125 % brocolli
| beans, 1900, 250, 60, 90, 150 % beans
| cheesecake, 2200, 550, 30, 225, 800 % cheesecake
| strawberry, 896, 122, 10, 12, 200 % strawberry
| brownie, 3937, 574, 20, 264, 500 % brownie
| tacos, 2430, 160, 108, 250, 450 % tacos
| spaghetti, 1570, 150, 40, 50, 450 % spaghetti
| croquette, 1300, 125, 45, 70, 300 % croquette
| potatoes, 800, 50, 10, 23, 500 % potatoes
| salad, 1000, 100, 15, 10, 125 % salad
| mashedpotato, 950, 220, 60, 60, 270
|chocolatemousse, 1300, 60, 0, 160, 300
| apple, 500, 50, 12, 36, 100
| tiramisu, 1200, 200, 20, 300, 500
| sanjacobo, 3000, 300, 150, 100, 1000
| meatloaf, 2000, 500, 70, 200, 1200
| soup, 1100, 50, 20, 50, 400
| carrot, 500, 50, 50, 100, 150
| puree, 700, 300, 50, 100, 125
| gazpacho, 600, 250, 40, 80, 250 |];
limitation = {icecream, chocolatecake, spaghetti, mashedpotato, banana};
max_in_limitation = 2;

% Escriba su codigo a partir de aqui
constraint main[name] in mains;
constraint side[name] in sides;
constraint dessert[name] in desserts;
constraint table(main, dd);
constraint table(side, dd);
constraint table(dessert, dd);
constraint main[energy] + side[energy] + dessert[energy] >=min_energy;
constraint main[protein]+side[protein]+dessert[protein] >=min_protein;
constraint main[salt] + side[salt] + dessert[salt] <= max_salt;
constraint main[fat] + side[fat] + dessert[fat] <= max_fat;
constraint budget = main[cost] + side[cost] + dessert[cost];
constraint (main[name] in limitation) + (side[name] in limitation) + (dessert[name] in limitation) <= max_in_limitation;

solve minimize budget;

output ["main = \(to_enum(FOOD, main[name])), side = \(to_enum(FOOD, side[name])), dessert = \(to_enum(FOOD, dessert[name])), cost = \(budget)"]; % Salida