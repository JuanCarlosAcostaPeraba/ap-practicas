import networkx as nx
from sys import maxsize as infinite
from simple_queue import *

graph = nx.Graph()

def bfs_path_length(graph, first_node):
    """
    Compute the shortest path length of the non-directed graph G
    starting from node first_node. Return a dictionary with the
    distance (in steps) from first_node to all the nodes.
    """

    distance = {}                 # distance from firstNode to all the nodes
    for node in graph.nodes():
        distance[node] = infinite

    # solve it here!
    q = Queue()
    visitados = []
    visitados.append(first_node)
    q.enqueue(first_node)
    distance[first_node] = 0

    while not q.isEmpty():
        v = q.dequeue()
        aristas = graph.edges(v)
        for arista in aristas:
            w = arista[1]
            if w not in visitados:
                visitados.append(w)
                distance[w] = distance[v] + 1
                q.enqueue(w)

    return distance
