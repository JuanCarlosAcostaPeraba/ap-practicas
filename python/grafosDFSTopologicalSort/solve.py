import networkx as nx

def dfs_topological_sort(graph):
    """
    Compute one topological sort of the given directed graph.
    """

    # La solucion que retorna esta función es un diccionario de Python.
    #   * La clave del diccionario es el número del nodo
    #   * El valor es el orden topologico asignado a ese nodo
    #
    # Por ejemplo, si tenemos el siguiente grafo dirigido con 3 vertices:
    #                    3 ---> 2 ---> 1
    # ... el orden topologico es:
    #                El vértice 3 va en la primera posición
    #                El vértice 2 en la segunda posición
    #                El vértice 1 en la tercera posición
    # Con lo que debemos devolver un diccionario con este contenido:
    #     {1: 3, 2: 2, 3: 1}

    solution = dict()

    # solve it here! -------------------------------------------------
    n = len(graph.nodes())
    visitados = []

    def dfs(graph, v, visitados, solution):
        visitados.append(v)
        aristas = graph.out_edges(v)
        for arista in aristas:
            if arista[1] not in visitados:
                dfs(graph, arista[1], visitados, solution)
        nonlocal n
        solution[v] = n
        n = n - 1
        return

    for v in graph:
        if v not in visitados:
            dfs(graph, v, visitados, solution)

    return solution