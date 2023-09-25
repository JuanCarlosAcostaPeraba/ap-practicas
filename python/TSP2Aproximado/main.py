from solve_tsp import *

item_count = int(input())
points = []
for i in range(1, item_count+1):
    parts = input().split() # CSV
    points.append(Point(float(parts[0]), float(parts[1])))

# solve_2_approx(points)

"""
Dibujar el grafo
complete_graph(points)
"""

solution = solve_2_approx(points)
print(solution)
