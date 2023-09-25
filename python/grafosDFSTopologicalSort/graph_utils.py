import networkx as nx

graph = nx.DiGraph()

def build_digraph_with_weights():
    # Añade aqui la rutina que has creado en el ejercicio anterior
    # para crear el grafo dirigido con pesos.

    first_line = input().split()
    num_nodes = int(first_line[0])
    num_edges = int(first_line[1])

    for i in range(1, num_nodes + 1):
        graph.add_node(i)

    for i in range(1, num_edges + 1):
        aristas = input().split()
        temp0 = int(aristas[0])  # out
        temp1 = int(aristas[1])  # in
        temp2 = int(aristas[2])  # weight
        graph.add_weighted_edges_from([(temp0, temp1, temp2)])

    return graph