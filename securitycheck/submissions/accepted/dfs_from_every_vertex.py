#! /usr/bin/env python3

# Very preliminary recursive solution, interesting for N around 1000.
# Will crash for large N because it runs out of recursion stack.
# Can be fixed (should TLE, not RTE); only interesting for small N anyway.

from collections import defaultdict

n, m = map(int, input().split())
tunnels = defaultdict(list)
for _ in range(m):
    u, v = map(int, input().split())
    tunnels[u].append(v)
    tunnels[v].append(u)

def check_halls(here, time, ignore=None) -> int:
    cost = time
    for hall in tunnels[here]:
        if hall == ignore:
            continue
        c, t = check_halls(here, time + 1, ignore=here)
        time += t
        cost += c
    return cost, time + 1

print(min(check_halls(u, 0)[0] for u in range(1, n + 1)))
