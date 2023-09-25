# Recurrencia
# -----------
#  t(n,w) = 0                                    : if n <= 0 or w = 0
#         = t(n-1,w)                             : if w(n) > w
#         = max (t(n-1,w), t(n-1,w-w(n)) + B(n))

import numpy as np


def solve_tabulation(items, capacity):
    taken = []
    table = np.zeros((len(items) + 1, capacity + 1), dtype=int)

    def fill_table():
        for i in range(n):
            for j in range(w + 1):
                if items[i].weight <= j:
                    if items[i].value + table[i - 1, j - items[i].weight] > table[i - 1, j]:
                        table[i, j] = items[i].value + table[i - 1, j - items[i].weight]
                    else:
                        table[i, j] = table[i - 1, j]
                else:
                    table[i, j] = table[i - 1, j]
        return table[n - 1, w]

    def fill_taken(n, w):
        i = n
        k = w
        while i > 0 and k > 0:
            if table[i - 2, k] != table[i - 1, k]:
                taken.append(i)
                i = i - 1
                k = k - items[i].weight
            else:
                i = i - 1
        return taken[::-1]

    n = len(items)
    w = capacity

    return fill_table(), fill_taken(n, w)
