import networkx as nx

graph = nx.Graph()

def build_graph():
    # Añade aqui la rutina que has creado en el ejercicio anterior
    # para crear el grafo.
    first_line = input().split()
    num_nodes = int(first_line[0])
    num_edges = int(first_line[1])

    for i in range(1, num_nodes + 1):
        graph.add_node(i)

    for j in range(1, num_edges + 1):
        aristas = input().split()
        temp0 = int(aristas[0])
        temp1 = int(aristas[1])
        graph.add_edge(temp0, temp1)

    return graph