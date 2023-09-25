from solve import *

first_line = input().split()
num_counters = int(first_line[0])
max_value = int(first_line[1])

obj = Comb_Iterator(num_counters, max_value)
for c in obj.comb_generator():
     print(c)