from comb_iterator import *

def solve(num_queens):
    """
    Using your brute force iterator compute all the
    solutions to place the given number of queens in
    a square board.

    Return a list of lists. For example, if num_queens = 4
    we have two solutions, and we return:
       solutions_list = [ [2, 4, 1, 3], [3, 1, 4, 2] ]
    """

    solutions_list = []

    # solve it here!
    def comprobacion(vector1, vector2): # vector1 = [i, j] # vector2 = [k, l]
        if ((vector1[0] - vector1[1]) == (vector2[0] - vector2[1])) \
                or ((vector1[0] + vector1[1]) == (vector2[0] + vector2[1])):
            return False
        elif ((vector1[1] - vector2[1]) == (vector1[0] - vector2[0])) \
                or ((vector1[1] - vector2[1]) == (vector2[0] - vector1[0])):
            return False
        else:
            return True

    def copia(lista):
        return lista.copy()

    temp0 = True
    obj = Comb_Iterator(num_queens, num_queens)
    for c in obj.comb_generator():
        if (0 not in c) and (len(c) == len(set(c))): # quitamos todas las listas que tienen 0 y que repiten numero
            for i in range(len(c)):
                for j in range(len(c)):
                    if i != j:
                        temp0 = comprobacion([c[i], i + 1], [c[j], j + 1])
                        if temp0 == False:
                            break
                if temp0 == False:
                    break

            if temp0 == True:
                solutions_list.append(copia(c))

    return solutions_list