#! /usr/bin/env python3

# Solution in time O(n* min(n, m)) using dynamic programming,
# using Lucas's formulas and notation from the original analysis,
# and observing that s[k] has at most min(n, m) elements.

b, m, d, n = map(int, input().split())
a = [0] + list(int(input()) for _ in range(n))

f = lambda x: -(d + m) * (-x // m) - d
g = lambda x: x + d * (-(-x // m) - 1)

s = {0: 0} # want s[k] = max (j : j < i and a[j] % m == k)
damage = [0]
for i in range(1, n + 1):
    damage.append(min(damage[j] + f(a[i] - a[j]) for j in s.values()))
    s[a[i] % m] = i

print(min(damage[i] + g(b - a[i]) for i in range(n + 1)))
