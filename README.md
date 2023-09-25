# Algoritmos y Programación

Prácticas de la asignatura de Algoritmos y Programación, enfocadas en el estudio de algoritmos y problemas de optimización.

**Desarrollado en Python y Minizinc**

## Python

1. [Presentación](./python/presentacion/)
2. [Grafos: Introducción](./python/grafosIntroduccion/)
3. [Grafos: BFS - Shortest Path Length](./python/grafosBFSShortestPathLength/)
4. [Grafo dirigido](./python/grafoDirigido/)
5. [Grafos: DFS - Topological Sort](./python/grafosDFSTopologicalSort/)
6. [Funciones generadoras](./python/funcionesGeneradoras/)
7. [N-Queens](./python/nQueens/)
8. [Branch and Bound: Node class](./python/branchAndBoundNodeClass/)
9. [Branch and Bound: DFS (recorrido)](./python/branchAndBoundDFSRecorrido/)
10. [Branch and Bound: DFS](./python/branchAndBoundDFS/)
11. [House Robber](./python/houseRobber/)
12. [Knapsack 0/1 (MEMOIZATION)](./python/knapsack01Memoization/)
13. [Knapsack 0/1 (TABULATION)](./python/knapsack01Tabulation/)
14. [TSP 2 - Aproximado](./python/TSP2Aproximado/)
15. [TSP 3/2 - Aproximado Christofides](./python/TSP32AproximadoChristofides/)
16. [Algoritmo genérico: Cruce de ciclo](./python/algoritmoGenericoCruceDeCiclo/)

## Minizinc

1. [Hello World](./minizinc/helloworld.mzn)
2. [Input and Output](./minizinc/inout.mzn)
3. [Variable de decisión](./minizinc/xvar.mzn)
4. [X óptima](./minizinc/xoptima.mzn)
5. [Array](./minizinc/array.mzn)
6. [Count](./minizinc/count.mzn)
7. [Army](./minizinc/army.mzn)
8. [Sequence](./minizinc/sequence.mzn)
9. [House Robber](./minizinc/houserobber.mzn)
10. [Knapsack 0/1](./minizinc/knapsack01.mzn)
11. [Knapsack con repetición](./minizinc/knapsack.mzn)
12. [Parejas estables (beneficio hombres)](./minizinc/parejasestableshombres.mzn)
13. [Parejas estables (beneficio mujeres)](./minizinc/parejasestablesmujeres.mzn)
14. [Parejas estables (maxima igualdad)](./minizinc/parejasestablesigualdad.mzn)
15. [Knapsack 0/1 limitada](./minizinc/knapsack01limitada.mzn)
16. [Dieta](./minizinc/dieta.mzn)
17. [Dieta 2](./minizinc/dieta2.mzn)
18. [Planificación temporal](./minizinc/planning.mzn)
19. [Flujo máximo](./minizinc/maxflow.mzn)
20. [TSP trayecto parcial mínimo](./minizinc/tspminedge.mzn)
21. [Emparejamiento perfecto de coste mínimo](./minizinc/perfectmatching.mzn)
22. [Sudoku](./minizinc/sudoku.mzn)
23. [Incógnitas](./minizinc/incognitas.mzn)
24. [Caramelos](./minizinc/caramelos.mzn)
25. [Palillos](./minizinc/incognitas.mzn)
26. [Transportistas](./minizinc/transportistas.mzn)

Ejecutar programas de Minizinc por consola:

```shell
minizinc <nombre_archivo.mzn>
```

* Para mostrar todos los resultados añadimos el parámetro `-a`:
`minizinc <nombre_archivo.mzn> -a`

* Para establecer valores de entrada usamos el parámetro `-D`:
`minizinc <nombre_archivo.mzn> -D <nombre_variable> = <valor_variable> (-D <nombre_variable_siguiente> = <valor_variable_siguiente>...)`