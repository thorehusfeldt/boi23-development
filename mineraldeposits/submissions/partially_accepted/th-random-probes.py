#!/usr/bin/env python3

import random

b, k, _ = map(int, input().split())

distances_sw = list(map(int, input(f"? -{b} -{b}\n").split()))
distances_se = list(map(int, input(f"? {b} -{b}\n").split()))
candidates = set()
for d_se in distances_se:
    for d_sw in distances_sw:
        y = (d_sw + d_se - 4 * b) // 2
        x = y + 2 * b - d_se
        if -b <= x <= b and -b <= y <= b:
            candidates.add((x,y))

candidates = list(candidates)
deposits = []
while len(candidates) > 0:
    r = random.choice(candidates)
    distances = set(map(int, input(f"? {r[0]} {r[1]}\n").split()))
    if 0 in distances:
        deposits.append(r)
        candidates.remove(r)
    candidates = [p for p in candidates if abs(p[0] - r[0]) + abs(p[1] - r[1]) in distances]

print("!", " ".join(f"{d[0]} {d[1]}" for d in deposits), flush=True)
