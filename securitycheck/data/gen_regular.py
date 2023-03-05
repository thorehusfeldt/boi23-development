#! /usr/bin/env python3

""" Generate regular d-tree of order n
    seed is typically provided behind the scenes by the generator script
"""
from argparse import ArgumentParser
from util import write_edgelist

parser = ArgumentParser("Random input")
parser.add_argument("seed", type=int, help="seed")
parser.add_argument("-n", type=int)
parser.add_argument("-d", type=int, default=3)
args = parser.parse_args()

print(args.n)
parent = 1
child = 2
children = 0
edgelist = []
while child <= args.n:
    edgelist.append(f"{parent - 1} {child - 1}")
    child += 1
    children += 1
    if children == args.d:
        parent += 1
        children = 0
write_edgelist(edgelist, args.seed)
