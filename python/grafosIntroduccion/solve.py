import networkx as nx

graph = nx.Graph()

def build_graph():
    """
    Read data from the standard input and build the corresponding
    nondirected graph without weights. Nodes numbering starts with
    number 1 (that is, nodes are 1,2,3,...)
    """
    first_line = input().split()
    num_nodes = int(first_line[0])
    num_edges = int(first_line[1])
    #print(num_nodes)
    #print(num_edges)

    # Paso 1: Crear un grafo unidirecional con num_nodes
    for i in range(1, num_nodes + 1):
        graph.add_node(i)

    # Paso 2: Añadirle las aristas
    for j in range(1, num_edges + 1):
        aristas = input().split()
        temp0 = int(aristas[0])
        temp1 = int(aristas[1])
        graph.add_edge(temp0, temp1)


    return graph