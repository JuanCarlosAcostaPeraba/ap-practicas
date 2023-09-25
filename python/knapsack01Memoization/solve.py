# Recurrencia
# -----------
#  t(n,w) = 0                                    : if n <= 0 or w = 0
#         = t(n-1,w)                             : if w(n) > w
#         = max (t(n-1,w), t(n-1,w-w(n)) + B(n))

def solve_memoization(items, capacity):
    mem = {}
    taken = []

    # Utilizaremos esta función para generar la clave de acceso al
    # diccionario que utilizamos para guardar los resultados (mem).

    # Recordatorio de la documentación de Python 3:
    #    "Keys can be any immutable type; strings and numbers can
    #     always be keys. Tuples can be used as keys if they contain
    #     only strings, numbers, or tuples"

    def getKey(n, w):
        return (n, w)  # Retornamos la clave

    def t(n, w):
        key = getKey(n, w)

        if key not in mem:
            if n < 0 or w == 0:
                mem[key] = 0
                return mem[key]
            elif items[n].weight > w:
                mem[key] = t(n - 1, w)
                return mem[key]

            mem[key] = max(t(n - 1, w), t(n - 1, w - items[n].weight) + items[n].value)

        # Retornamos el valor calculado por la recurrencia
        return mem[key]

    def fill_taken(n, w):
        while n > -1 and w > 0:
            if t(n, w) != t(n - 1, w):
                taken.append(items[n].index)
                w = w - items[n].weight
            n = n - 1
        return

    n = len(items) - 1

    max_value = t(n, capacity)  # Calculo el valor maximo
    fill_taken(n, capacity)  # Genero la lista de items elegidos

    taken.sort()
    
    return max_value, taken
