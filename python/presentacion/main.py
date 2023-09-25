import networkx as nx

cuenta = 0

graph = nx.Graph()

first_line = input()
print(first_line)

def suma(i):
    return cuenta + i

for i in range(3):
    cuenta = suma(i)

print(cuenta)
