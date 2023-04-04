#! /usr/bin/env python3

""" Works for k = 1 (i.e., a single hidden point) """

n, m, k, Q = map(int,input().split())
assert k == 1
print(f"? 0 0 {n} 0", flush=True)
da, db = map(int, input().split())
print("? 0 0", flush=True)
d = int(input())
if d == db:
    da, db = db, da
x = (n + da - db) // 2
y = da - x
print(f"! {x} {y}", flush=True)
