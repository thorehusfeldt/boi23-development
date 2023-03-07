#! /usr/bin/env python3

# Broken recursive solution, interesting for N around 1000.
# (Wrongly increments time after recursive check, this was
# in fact an honest mistake.)
# Will crash for large N because it runs out of recursion stack.
# Maybe needs to be fixed (should WA or TLE on larger testgroups, not RTE);
# but only interesting for small N anyway.

# @EXPECTED_GRADES@ WA WA WA WA WA

n = int(input())
V = list(range(1, n + 1))
tunnels = {i:[] for i in V}
for _ in range(n - 1):
    u, v = map(int, input().split())
    tunnels[u].append(v)
    tunnels[v].append(u)

def check_halls(here, time, ignore=None) -> int:
    cost = time
    for hall in tunnels[here]:
        if hall == ignore:
            continue
        c, t = check_halls(hall, time + 1, ignore=here)
        time += t # Here's the mistake
        cost += c
    return cost, time + 1

print(min(check_halls(u, 0)[0] for u in V))
