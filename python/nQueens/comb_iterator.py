# Copia aqui el generador de combinaciones que has
# programado en el VPL anterior.
class Comb_Iterator:

    def __init__(self, num_counters, max_value=1):
        """
        Object constructor:
        * num_counters: number of counters of the combinations
            computed by the generator function comb_generator().
        * max_value: maximum value of each counter.
        """

        self.num_counters = num_counters
        self.max_value = max_value

        return

    def comb_generator(self):
        """
        Generator function. Return a list containing the next
        value of the counters.
        """

        lista, lista_max = [], []

        for i in range(self.num_counters):
            lista.append(0)
            lista_max.append(self.max_value)

        while lista != lista_max:
            yield lista

            for i in range(len(lista) - 1, -1, -1):
                if lista[i] < self.max_value:
                    lista[i] = lista[i] + 1
                    break
                elif lista[i] == self.max_value:
                    lista[i] = 0

        yield lista

        return
