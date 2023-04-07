#! /usr/bin/env python3

"""
    Utilities for checking various properties of a weight sequence.

    Run from command line as 

        > python3 utilities.py 1 1 10 1 1 1
        n=6
        w=[1, 1, 10, 1, 1, 1]
        opt=5
        min length g.s.=4
        opt among shortest g.s.=13

    Call from the outside as utilities.check(w)
"""

import functools
import sys
from typing import Tuple, List, FrozenSet, Dict

sys.setrecursionlimit(10**5)


@functools.lru_cache(maxsize=None)
def _good_sequences(A: FrozenSet[int]) -> List[Tuple[int]]:
    """ Return good sequences containing A.  """
    a = max(A)
    if a == 1:
        return [(1,)]
    B = A - set([a])
    prefixes = set(_good_sequences(frozenset(B | set([a - 1]))))
    for ij in divisors[a]:
        prefixes.update(_good_sequences(frozenset(B | set(ij))))
    return [seq + (a,) for seq in prefixes]

def good_sequences(m: int) -> List[Tuple[int]]:
    return _good_sequences(frozenset([m]))

@functools.lru_cache(maxsize=None)
def _solve(A: FrozenSet[int], w: Tuple[int], k: int) -> int:
    """ Return the weight of a minimum-weigth good sequence containing A.
        If k is not None, restrict attention to sequences of length at most k.
        """
    a = max(A)
    if k is not None and k == 0:
        return 10**18
    if a == 1:
        return w[0]
    B = A - set([a])
    best = _solve(frozenset(B | set([a - 1])), w, k-1 if k is not None else None)
    for ij in divisors[a]:
        best = min(best, _solve(frozenset(B | set(ij)), w, k-1 if k is not None else None))
    return  best + w[a - 1]

def solve(w: List[int], k=None) -> List[Tuple[int]]:
    """ Return the weight of a minimum-weight good sequence containing len(w)
        If k is not None, restrict attention to sequences of length at most k.
        (Careful: for large k this becomes very time consuming.)
        """
    m = len(w)
    A = frozenset([m])
    return _solve(A, w, k)

divisors = None
def compute_divisors(m: int) -> Dict[int, Tuple[int]]:
    """ divisors[a] = list of integers i, j with i * j = a
        for all 1 <= a <= m
    """
    global divisors
    divisors = { i + 1: [] for i in range(m) }
    for i in range(2, m):
        for j in range(i, m):
            if i * j > m:
                break
            divisors[i * j].append((i, j))

def check(w):
    """ Check the weight sequence w.
    Return
     - the weight of the optimum solution for w
     - the minimum length of a good sequence containing len(w)
     - the optimum weigth attained by minimal-length good sequences containing len(w)

     In particular, the first and last return value *differ* if w cannot
     be solved by an algorithm that just inspects shortest good sequences.
     """


    w = tuple(w)
    compute_divisors(len(w))
    unitweights = tuple([1] * len(w))
    shortest_good_sequence = solve(unitweights)
    return (solve(w), shortest_good_sequence, solve(w, k=shortest_good_sequence))


if __name__ == "__main__":
    weights = [int(input()) for _ in range(int(input()))]
    ans = check(weights)
    print(f"n={len(weights)}")
    print(f"w={weights}")
    print(f"opt={ans[0]}")
    print(f"min length g.s.={ans[1]}")
    print(f"opt among shortest g.s.={ans[2]}")
