#! /usr/bin/env python3

# @EXPECTED_GRADES@ WA WA WA WA WA WA

""" Wrong solution that stoically drives home,
    taking whatever damage the pulsar throws at you.
"""

z, m, c, n = map(int, input().split())
shelters = set(map(int, (input() for _ in range(n))))

damage = pos = time = 0
while pos != z:
    if time > 0 and time % m == 0 and pos not in shelters:
        damage += c
    time += 1
    pos += 1
    damage += 1
print(damage)
