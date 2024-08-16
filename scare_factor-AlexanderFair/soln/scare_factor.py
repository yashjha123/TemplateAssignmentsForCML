
from queue import PriorityQueue

n, m, k = map(int, input().split(' '))
ins = []
for _ in range(n):
    ins.append([int(x) for x in input().split(' ')])

# print(ins)
minOfEachMovie = PriorityQueue()
for i in range(m):
    minOfEachMovie._put(min([x[i] for x in ins]))



total = 0
count = 0
while total < k and minOfEachMovie._qsize() > 0:
    t = minOfEachMovie._get()
    if total + t > k:
        break
    
    total += t
    count += 1

print(count)

"""
n, m, k = map(int, input().split(' '))
ins = []
for _ in range(n):
    ins.append([int(x) for x in input().split(' ')])

# print(ins)
minOfEachMovie = []
for i in range(m):
    minOfEachMovie.append(min([x[i] for x in ins]))

minOfEachMovie = sorted(minOfEachMovie)

total = 0
count = 0
for movie in minOfEachMovie:
    if total + movie > k:
        break 
    total += movie
    count += 1

print(count)
"""