def cycle_crossover(parent1, parent2):
    output = []

    cycle_crossover_list = []
    cycle = 1

    for i in range(len(parent1)):
        cycle_crossover_list.append(-1)

    for i in parent1:
        x = i  # elemento en padre
        next_item = parent2[parent1.index(x)]  # elemento en madre
        while True:
            x = next_item # elemento padre nuevo
            if cycle_crossover_list[parent2.index(x)] != -1:  # se termina el ciclo
                break
            cycle_crossover_list[parent2.index(x)] = cycle  # ciclo nuevo
            next_item = parent2[parent1.index(x)]  # elemento madre nuevo
        cycle += 1

    for i in range(len(parent1)):
        if cycle_crossover_list[i] % 2 == 0:  # par -> madre
            output.append(parent2[i])
        else:  # impar -> padre
            output.append(parent1[i])

    return output
