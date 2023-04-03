#! /usr/bin/env/python3

# Usage examples:

# python3 unique.py --terse < foo.in
#
# for f in $(find . -name '*.in'); do python3 unique.py < $f; done


import math
from argparse import ArgumentParser


parser = ArgumentParser("Determine if an instance has a unique answer")
parser.add_argument("-n", type=int, default=100, help="Bail out if instance larger than n")
parser.add_argument("--silent", action="store_true")
parser.add_argument("--terse", action="store_true")

args = parser.parse_args()

def solve(a, b, m, d, n):
    def f(x):
        return (d + m) * math.ceil(x / m) - d
    def g(x):
        return x + d * (math.ceil(x/m) - 1)
    damage = [0]
    prevs = [None]
    counts = [1]
    for i in range(1, n + 1):
        best = float('inf')
        ct = None
        for j in range(i):
            damage_from_j = damage[j] + f(a[i] - a[j])
            if damage_from_j == best:
                ct += counts[j]
                if ct > 2:
                    ct = 2
            if damage_from_j < best:
                best = damage_from_j
                best_j = j
                ct = counts[j]
        damage.append(best)
        prevs.append(best_j)
        counts.append(ct)

    best = float('inf')
    best_i = None
    ct = None
    for i in range(n + 1):
        damage_from_i = damage[i] + g(b - a[i])
        if damage_from_i == best:
            ct += counts[j]
            if ct > 2:
                ct = 2
        if damage_from_i < best:
            best = damage_from_i
            best_i = i
            ct = counts[i]
    hideouts = [best_i]
    h = best_i
    while h is not None:
        h = prevs[h]
        hideouts.append(h)
    return reversed(hideouts[:-1]), ct


def main():
    b, m, d, n = map(int, input().split())
    A = [0] + list(int(input()) for _ in range(n))

    if n > args.n:
        print("Instance too large, consider specifying -n. Aborting...")
        return

    answer, ct = solve(A, b, m, d, n)
    print("\033[32munique\033[0m" if ct==1 else "\033[31mduplic\033[0m", end=' ')
    if args.silent:
        return

    hideout = list(answer) + [n + 1]
    A += [b]
    time = pos = waiting = 0
    used    = set(A[i] for i in hideout)
    shelters = set(A)
    radiationdamage = 0
    while pos < b:
        if time % m == 0:
            if pos > 0:
                if pos not in shelters:
                    if not args.terse:
                        print(f"*{pos}*", end=' ')
                    radiationdamage += d
                else:
                    if not args.terse:
                        print(f"[{pos}:{waiting}]", end=' ')
                    else:
                        print(1, end='')
                    waiting = 0
            pos += 1
        else:
            if pos in used:
                waiting += 1
            else:
                if pos in shelters:
                    if not args.terse:
                        print(f"({pos})", end=' ')
                    else:
                        print(0, end='')
                pos += 1
        time += 1
    print(f" -- rdamage: {radiationdamage}, time: {time}")

main()
