#! /usr/bin/env python3

import re
import sys

from argparse import ArgumentParser

parser = ArgumentParser("Validate input to hide")
parser.add_argument("--max_b", type=int, default=10**12)
parser.add_argument("--max_p", type=int, default=10**12)
parser.add_argument("--max_d", type=int, default=10**6)
parser.add_argument("--max_n", type=int, default=10**5)
parser.add_argument("--no_wait", action="store_true")
args = parser.parse_args()


line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* (0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
b, p, d, n  = map(int, line.split())

assert b <= args.max_b
assert p <= args.max_p
assert d <= args.max_d
assert n <= args.max_n

assert n < b # constraint:sheltersfit
assert p < b # constraint:pulsehappens

assert 1 <= b <= 10**12 # constraint:b
assert 0 <= d <= 10**6  # constraint:d
assert 0 <= n <= 10**5  # constraint:n

a = []
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"[1-9][0-9]*\n", line), line
    a_i = int(line)
    assert 0 < a_i < b, "hideout out of bounds" # constraint:shelterbounds
    a.append(a_i)

if a:
    assert a == sorted(a), "Unsorted hideouts" # constraint:sortedshelters
    assert len(set(a)) == n, "Duplicate hideouts"

assert sys.stdin.readline() == ""

# Full solution.
INF = 2 * 10**18

class RMQ:
    def __init__(self, size):
        self.block_size = 1 + int(size ** (1 / 2))
        num_blocks = 1 + size // self.block_size
        self.values = [INF] * size
        self.minima = [INF] * num_blocks

    def update(self, idx, v):
        assert 0 <= idx < len(self.values), (idx, self.values)
        self.values[idx] = v
        B = self.block_size
        j = idx // B
        assert j * B <= idx < (j + 1) * B
        self.minima[j] = min(self.values[j * B : (j + 1) * B])

    def query(self, lo, hi):
        B = self.block_size
        j_lo = lo // B
        j_hi = hi // B
        return min(
                min(self.values[lo : (j_lo + 1) * B], default=INF),
                min(self.minima[j_lo + 1 : j_hi], default=INF),
                min(self.values[j_hi * B : hi + 1], default=INF),
            ) if j_lo < j_hi else min(self.values[lo : hi + 1], default=INF)

def solve_full():
    shelters = [0] + a
    dp = [0] * len(shelters)
    ranks = {v: i for i, v in enumerate(sorted(set(a % p for a in shelters)))}
    rmq = RMQ(n + 1)

    rmq.update(0, 0)

    for i in range(1, n + 1):
        pos = ranks[shelters[i] % p]
        x = (shelters[i] // p) * (d + p)
        dp[i] = x + min(rmq.query(0, pos - 1) + d + p, rmq.query(pos, n)) - d
        rmq.update(pos, dp[i] - x)

    return min(dp[i] + b - a + d * ((b - a + p - 1) // p - 1) for i, a in enumerate(shelters))

# No Wait solution
def solve_no_wait():
    shelter_cnt = [0]*p
    for i in a:
        shelter_cnt[i % p] += 1
    best = INF
    for start in range(0, p):
        damage = b + start
        first_shelter = p - start
        pulse_cnt = (b - first_shelter + p - 1) // p
        damage += d * (pulse_cnt - shelter_cnt[first_shelter % p])
        best = min(best, damage)
    return best

if args.no_wait:
    assert solve_full() == solve_no_wait() # constraint:nowait

sys.exit(42)
