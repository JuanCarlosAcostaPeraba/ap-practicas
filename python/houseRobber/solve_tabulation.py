# Recurrencia del problema del ladrón
# -----------------------------------
#    t(n) = max (t(n-2) + v[n], t(n-1))
#    t(n) = 0		               : si n<0

def solve_tabulation(items):
    table = []
    taken = []

    def fill_table():
        # Primera fase: Rellenamos la tabla 'table' con las
        # soluciones de todos los subproblemas (o sea, los
        # beneficios que puede conseguir el ladrón).
        # ...
        n = len(items)
        temp0 = temp1 = 0
        for i in range(0, len(items)):
            temp3 = temp0
            temp0 = max(temp1 + items[i], temp0)
            temp1 = temp3
            table.append(temp0)
        return table[n - 1]

    def fill_taken():
        # Segunda fase: Rellenamos la lista 'taken' con el
        # indice de las casas elegidas por el ladrón para
        # obtener el máximo beneficio. En el ejemplo de las
        # transparencias el contenido de esta lista es: [2,5]
        # (la segunda casa y la quinta casa).
        # ...
        maximo = table[-1]
        n = len(items)
        for i in range(n - 1, -1, -1):
            if (table[i] != table[i - 1]) and (table[i] <= maximo):
                maximo = maximo - items[i]
                taken.append(i + 1)
        return taken[::-1]

    return fill_table(), fill_taken()
