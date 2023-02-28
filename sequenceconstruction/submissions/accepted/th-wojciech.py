#! /usr/bin/env python3

# Pythonified version of Wojciech's solution,
# uses frozenset(A) as hashable for memoisation.

n = int(input())
w = [int(input()) for _ in range(n)]

memo = {}

def F(A):
    A_ = frozenset(A)
    if A_ in memo:
        return memo[A_]
    a = max(A)
    if a == 1:
        memo[A_] = w[0]
    else:
        B = A - set([a])
        best = F(B | set([a - 1]))
        for d in divisors[a]:
            best = min(best, F(B | set([d, a//d])))
        memo[A_] = best + w[a - 1]
    return memo[A_]

divisors = { i: [] for i in range(1, n + 1) }
for i in range(2, n + 1):
    for j in range(i, n + 1):
        if i * j > n:
            break
        divisors[i * j].append(i)

for i in range(1, n+1):
    print(F(set([i])))
