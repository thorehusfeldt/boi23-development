#! /usr/bin/env python3

""" Wrong solution that stoically walks right,
    digging a fresh hole whenever necessary.
"""

z, m, c, n = map(int, input().split())
holes = set(map(int, (input() for _ in range(n))))

time = pos = 0
while pos != z:
    if time > 0 and time % m == 0 and pos not in holes:
        time += c
    pos += 1
    time += 1
print(time)
