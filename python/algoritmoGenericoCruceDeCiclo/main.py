from solve_tsp import *

string1 = input()
parent1 = [int(k) for k in string1.split(',')]

string2 = input()
parent2 = [int(k) for k in string2.split(',')]

solution = cycle_crossover(parent1, parent2)

print(solution)
