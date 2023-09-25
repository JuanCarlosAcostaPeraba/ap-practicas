from node import *

def solve_branch_and_bound_DFS(capacity, items, record_visiting_order=False):
    """"
    :param capacity: capacidad de la mochila
    :param items: items de la mochila
    :param record_visiting_order: activa/desactiva el registro de nodos visitados
    :return: Por ahora sólo devuelve la lista de nodos visitados
    """

    # Utilizamos la lista 'alive' como nuestra pila de nodos vivos
    # (pendientes de visitar) para programar nuestro recorrido DFS.

    alive = []

    # Utilizamos la lista Visiting_Order como el registro de nodos
    # visitados (el contenido final de esta lista lo utiliza el VPL
    # para comprobar que nuestro recorrido DFS es correcto).

    visiting_order = []

    # 1) Creamos el nodo raiz (en este VPL todavía no utilizamos los
    #    parámetros taken, value, room, con lo que se inicializan con
    #    lista vacía y 0). El único valor necesario en el nodo es el
    #    indice al primer elemento de la lista (index = 0).

    node_root = Node(0, [], 0, capacity)

    # Lo añadimos a la lista de nodos vivos (alive)

    alive.append(node_root)

    # Mientras haya nodos en la lista de nodos vivos

    while len(alive) != 0:

        # Avanzamos al siguiente nodo de nuestro recorrido DFS (hacemos un pop
        # de la lista) y lo registramos en nuestro recorrido DFS.

        current = alive.pop()

        if record_visiting_order:
            visiting_order.append(current.index)

        # Si no hemos llegado al final del árbol
        #    1) Ramificamos (branch) por la derecha (append)
        #    2) Ramificamos (branch) por la izquierda (append)

        if current.index < len(items):      # si el indice del nodo con el que estamos trabajando
                                            # es mayor o igual que la lista de items,
                                            # implica que estamos en el último nodo del árbol

            # right node -> index aumenta, taken es igual, value es igual, room es igual
            right_node = Node(current.index + 1, current.taken, current.value, current.room)
            alive.append(right_node)

            # left node -> index aumenta, taken aumenta, value aumenta, room disminuye
            left_taken = current.taken.copy()
            left_taken.append(current.index)
            left_room = current.room - items[0].weight
            left_node = Node(current.index + 1, left_taken, items[0].value, left_room)
            alive.append(left_node)

    return 0, [], visiting_order
