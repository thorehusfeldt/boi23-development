#! /usr/bin/env python3

from argparse import ArgumentParser

parser = ArgumentParser(
    """
Generate permutations with a lot of structure

    -n the number of elements 1..n
    --reversed same structure backwards
    --structure, can be
        'ascending': 1,2,...,n
        'updown': 1,3,5,.. n,..6, 4, 2
        'downup': n, n-2, .. 0 ,.. n-3, n-1
        'zigzag': mid, mid + 1, mid - 1, mid + 2, mid - 2, ...
        'staircase': 1, 3, 2, 5, 4,...

"""
)
parser.add_argument("-n", type=int)
parser.add_argument("--structure", choices=['updown', 'downup', 'ascending', 'zigzag', 'staircase'])
parser.add_argument("--reversed", action="store_true")
parser.add_argument("seed", type=int, help="Ignored")
args = parser.parse_args()
n = args.n

if args.structure == 'ascending':
    a = list(range(1, n + 1))
elif args.structure == 'updown':
    a = list(range(1, n + (n % 2), 2)) + list(reversed(range(2, n + ((n + 1) % 2), 2)))
elif args.structure == 'downup':
    a = list(reversed(range(2, n + ((n + 1) % 2), 2))) + list(range(1, n + (n % 2), 2))
elif args.structure == 'zigzag':
    hi = lo = (n + 1) // 2
    a = [lo]
    while len(a) < n:
        hi += 1
        a.append(hi)
        if len(a) < n:
            lo -= 1
            a.append(lo)
elif args.structure == 'staircase':
    if n == 1:
        a = [1]
    else:
        a = [1, 3, 2]
        while len(a) < n:
            a.append(a[-1] + 3)
            a.append(a[-1] - 1)
        if len(a) > n:
            a = a[:-2] + [n]
if args.reversed:
    a = reversed(a)
print(*a)
