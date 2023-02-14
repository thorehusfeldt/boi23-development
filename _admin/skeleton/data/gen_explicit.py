#! /usr/bin/env python3

""" Generate input with the given numbers

    seed is typically provided behind the scenes by the generator script and ignored

    Example from the command line, note that 0 is the (ignored) seed:
    > python gen_explicit 17 -23 0
    17 -23
"""

from argparse import ArgumentParser

parser = ArgumentParser("Explicit input to skeleton")
parser.add_argument("x", type=int, default=1000, help="first mandatory argument, x")
parser.add_argument("y", type=int, default=1000, help="second mandatory argument, y")
parser.add_argument("seed", type=int, help="seed (ignored)")
args = parser.parse_args()

_ = args.seed

print(args.x, args.y)
