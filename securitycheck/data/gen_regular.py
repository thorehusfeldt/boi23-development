#! /usr/bin/env python3

""" Generate regular d-tree of order n
    seed is typically provided behind the scenes by the generator script and ignored
"""
from argparse import ArgumentParser

parser = ArgumentParser("Random input")
parser.add_argument("seed", type=int, help="seed")
parser.add_argument("-n", type=int)
parser.add_argument("-d", type=int, default=3)
args = parser.parse_args()

print(args.n)
parent = 1
child = 2
children = 0
while child <= args.n:
    print(parent, child)
    child += 1
    children += 1
    if children == args.d:
        parent += 1
        children = 0
