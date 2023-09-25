from collections import namedtuple
import networkx as nx
import math
import os
import matplotlib.pyplot as plt

Point = namedtuple("Point", ['x', 'y'])

graph = nx.Graph()


def length(point1, point2):
    return math.sqrt((point1.x - point2.x) ** 2 + (point1.y - point2.y) ** 2)


def complete_graph(points):
    """ Creates a complete graph """

    for i in range(len(points)):
        for j in range(i + 1, len(points)):
            graph.add_edge(i, j, weight=length(points[i], points[j]))

    """
    Pintar el grafo con los pesos
    layout = nx.spring_layout(graph)
    nx.draw(graph, layout, with_labels=True)
    nx.draw_networkx_edge_labels(graph, pos=layout)
    plt.show()
    """

    return graph


def solve_2_approx(points):
    """ implements the Tree 2-approximate algorithm for TSP """

    final_result = []

    g = complete_graph(points)

    tree = nx.minimum_spanning_tree(g, weight='weight', algorithm='kruskal', ignore_nan=False)

    multigraph = nx.MultiGraph(tree)
    multigraph.add_edges_from(tree.edges)

    chain = nx.eulerian_circuit(multigraph)

    for e in list(chain):
        if e[0] not in final_result:
            final_result.append(e[0])

    return final_result
