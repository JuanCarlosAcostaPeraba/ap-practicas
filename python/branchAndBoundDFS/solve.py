from node import *


def solve_branch_and_bound_DFS(capacity, items, record_visiting_order=False):
    """"
    :param capacity: capacidad de la mochila
    :param items: items de la mochila
    :param record_visiting_order: activa/desactiva el registro de nodos visitados
    :return: Por ahora sólo devuelve la lista de nodos visitados
    """

    # Completa este código para realizar el recorrido DFS; tienes
    # indicados los sitios que debes completar con tres puntos
    # suspensivos ("...")

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
    # ...

    node_root = Node(0, [], 0, capacity)

    # Lo añadimos a la lista de nodos vivos (alive)
    # ...
    alive.append(node_root)

    # Mientras haya nodos en la lista de nodos vivos
    # ...

    best_value = 0

    best_taken = []

    while len(alive) != 0:
        # Avanzamos al siguiente nodo de nuestro recorrido DFS (hacemos un pop
        # de la lista) y lo registramos en nuestro recorrido DFS.

        current = alive.pop()
        if record_visiting_order:
            visiting_order.append(current.index)

        # Si no hemos llegado al final del árbol
        #    1) Ramificamos (branch) por la derecha (append)
        #    2) Ramificamos (branch) por la izquierda (append)
        # ...

        if current.room < 0:    # Comprobamos si hay espacio en la mochila
            continue

        if current.estimate(items) < best_value:  # Comprobamos si la estimacion puede mejorar
            continue  # la solucion que ya tenemos

        if current.index >= len(items):  # Si llega al final del arbol no crea mas nodos
            continue

        # right node -> index aumenta, taken es igual, value es igual, room es igual
        right_index = current.index + 1         # index
        right_taken = current.taken.copy()      # taken
        right_value = current.value             # value
        right_room = current.room               # room
        right_node = Node(right_index, right_taken, right_value, right_room)
        alive.append(right_node)

        # left node -> index aumenta, taken aumenta, value aumenta, room disminuye
        left_index = current.index + 1                              # index
        left_taken = current.taken.copy()
        left_taken.append(current.index + 1)                        # taken
        left_value = current.value + items[current.index].value     # value
        left_room = current.room - items[current.index].weight      # room
        left_node = Node(left_index, left_taken, left_value, left_room)
        alive.append(left_node)

        if current.value + items[current.index].value > best_value \
                and current.room - items[current.index].weight > 0:  # Si el valor obtenido es mejor que el guardado
            best_value = current.value + items[current.index].value  # y hay espacio en la mochila, actualizamos los
            best_taken = left_taken                                  # valores de los mejores resultados

    return best_value, best_taken, visiting_order
