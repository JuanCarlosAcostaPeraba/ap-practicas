# Copia aquí la definición del nodo que resuelve
# el VPL anterior!

from collections import namedtuple

Item = namedtuple("Item", ['index', 'value', 'weight'])

class Node:
    def __init__(self, index, taken, value, room):
        self.index = index
        self.taken = taken
        self.value = value
        self.room = room

    def estimate(self, items):
        bound = 0

        for i in items[self.index:]:
            bound = bound + i.value

        bound = bound + self.value

        return bound
