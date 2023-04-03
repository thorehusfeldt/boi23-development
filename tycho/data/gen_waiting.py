""" These instances force Tycho to wait at
 - the 1st shelter for 1 time step
 - the 2nd shelter for 2 time steps
 - the 3rd shelter for 3 time steps
and so on, until half the pulse period (and then the
enforced wait time shrinks again, then grows, etc.

This requires d to be large enough (around the pulse period)
for it to make sense to wait at all.
"""

from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("-p", type=int)
parser.add_argument("-n", type=int)
parser.add_argument("-d", type=int, default=1)
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()

a = []

waittime = 1
increase = True
pos = 0
while len(a) < args.n + 1:
    pos += args.p - waittime
    a.append(pos)
    waittime += (1 if increase else -1)
    if waittime in [args.p//2, 0]:
        increase = not increase
b = a.pop()
print(b, args.p, args.d, len(a))
print(*a, sep='\n')
