#! /usr/bin/env python3

# Pythonified version of Wojciech's solution,
# mostly a curiosity using sorted tuples instead
# or frozensets

# Should be retired sooner or later

import bisect

n = int(input())
w = [int(input()) for _ in range(n)]

memo = {}

def insert(sortedtuple, a):
    if len(sortedtuple) == 0:
        return (a,)
    if a > sortedtuple[-1]:
        return sortedtuple + (a,)
    if a in sortedtuple:
        return sortedtuple
    idx = bisect.bisect(sortedtuple, a)
    return sortedtuple[:idx] + (a,) + sortedtuple[idx:]


def F(A):
    if A in memo:
        return memo[A]
    a = A[-1]
    if a == 1:
        memo[A] = w[0]
    else:
        B = A[:-1]
        best = F(insert(B, a - 1))
        for d in divisors[a]:
            best = min(best, F(insert(insert(B, d), a//d)))
        memo[A] = best + w[a - 1]
    return memo[A]

divisors = { i + 1: [] for i in range(n) }
for i in range(2, n + 1):
    for j in range(i, n + 1):
        if i * j > n:
            break
        divisors[i * j].append(i)

for i in range(1, n+1):
    print(F((i,)))
