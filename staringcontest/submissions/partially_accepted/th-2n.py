#! /usr/bin/env python3

# q = 2 * n - 3 rounds

n = int(input())
j, k = 0, 1
res = [0] * n
jk = int(input("? 1 2\n"))
for i in range(2, n):
    # invariant:  sorted([a[j], a[k]) == sorted(a[:i])[-2:]
    ij = int(input(f"? {i+1} {j+1}\n"))
    ik = int(input(f"? {i+1} {k+1}\n"))
    if ij == ik: # a[i] < a[j] and a[i] < a[k]
        assert res[i] == 0
        res[i] = ij
    elif ij == jk: # a[j] < a[i] and a[j] < a[k]
        assert res[j] == 0
        res[j] = ij
        j = i
        jk = ik
    elif ik == jk: # a[k] < a[i] and a[k] < a[j]
        assert res[k] == 0
        res[k] = ik
        k = i
        jk = ij
assert len(set(res)) == n - 1 and sorted(res)[:2] == [0,0]
print("!", *res, flush=True)
