#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution sweep_circle_rand.cpp

# all the generators are introduced here
compile gen_random.py
compile gen_line.py
compile gen_circles.py
compile gen_many_peaks.cpp

samplegroup
sample 1
sample 2
sample 3

# t <= s
group group1 5
limits --s_geq_t

tc s-geq-t-sm-random-3 gen_random       --s 100 --t 10  --k  5  --n 50
tc s-geq-t-sm-random-4 gen_random       --s 100 --t 10  --k 10  --n 50
tc s-geq-t-sm-random-6 gen_random       --s 100 --t 100 --k 20  --n 50
tc s-geq-t-sm-line-x-axis gen_line      --s 10  --t 2   --k 10  --n 50 --px 0 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc s-geq-t-sm-line-y-axis gen_line      --s 20  --t 3   --k 10  --n 50 --px 0 --py 0 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc s-geq-t-sm-line-x-parallel gen_line  --s 40  --t 8   --k 10  --n 50 --px 12345 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc s-geq-t-sm-line-y-parallel gen_line  --s 80  --t 4   --k 10  --n 50 --px 0 --py 54321 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc s-geq-t-sm-line-1 gen_line           --s 50  --t 27  --k 10  --n 50 --px 100 --py 100 --qx 1 --qy -1 --min_c -10000000 --max_c 10000000
tc s-geq-t-sm-line-2 gen_line           --s 33  --t 27  --k 10  --n 50 --px 100 --py 100 --qx 1 --qy 1 --min_c -10000000 --max_c 10000000
tc s-geq-t-lg-random-3 gen_random       --s 100 --t 10  --k 50  --n 699
tc s-geq-t-lg-random-4 gen_random       --s 1   --t 1   --k 123 --n 700

# k = n <= 50 and s = 0
group group2 10
limits --k_eq_n --s_eq_0 --max_n 50
tc k-eq-n-sm-random-2 gen_random        --s 0   --t 100 --k 50 --n 50
tc k-eq-n-sm-random-3 gen_random        --s 0   --t  10 --k 50 --n 50
tc k-eq-n-sm-random-4 gen_random        --s 0   --t  10 --k 50 --n 50
tc k-eq-n-sm-random-5 gen_random        --s 0   --t 100 --k 50 --n 50
tc k-eq-n-sm-random-6 gen_random        --s 0   --t 100 --k 50 --n 50
tc k-eq-n-sm-line-x-axis gen_line       --s 0   --t 2   --k 50 --n 50 --px 0        --py 0      --qx 0 --qy 1   --min_c -100000000  --max_c 100000000
tc k-eq-n-sm-line-y-axis gen_line       --s 0   --t 3   --k 50 --n 50 --px 0        --py 0      --qx 1 --qy 0   --min_c -100000000  --max_c 100000000
tc k-eq-n-sm-line-x-parallel gen_line   --s 0   --t 8   --k 50 --n 50 --px 12345    --py 0      --qx 0 --qy 1   --min_c -100000000  --max_c 100000000
tc k-eq-n-sm-line-y-parallel gen_line   --s 0   --t 4   --k 50 --n 50 --px 0        --py 54321  --qx 1 --qy 0   --min_c -100000000  --max_c 100000000
tc k-eq-n-sm-line-1 gen_line            --s 0   --t 27  --k 50 --n 50 --px 100      --py 100    --qx 1 --qy -1  --min_c -10000000   --max_c 10000000
tc k-eq-n-sm-line-2 gen_line            --s 0   --t 1   --k 45 --n 45 --px 100      --py 100    --qx 1 --qy 1   --min_c -10000000   --max_c 10000000

# s = 0 and n <= 50
group group3 15
limits --s_eq_0 --max_n 50
include_group group2
tc s-eq-0-sm-random-2 gen_random        --s 0  --t 100 --k  10 --n 50
tc s-eq-0-sm-random-3 gen_random        --s 0 --t  10 --k  5 --n 50
tc s-eq-0-sm-random-4 gen_random        --s 0 --t  10 --k 25 --n 50
tc s-eq-0-sm-random-5 gen_random        --s 0  --t 100 --k 48 --n 50
tc s-eq-0-sm-random-6 gen_random        --s 0 --t 100 --k 31 --n 50
tc s-eq-0-sm-line-x-axis gen_line       --s 0 --t 2 --k 12 --n 50 --px 0 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc s-eq-0-sm-line-y-axis gen_line       --s 0 --t 3 --k 4 --n 50 --px 0 --py 0 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc s-eq-0-sm-line-x-parallel gen_line   --s 0 --t 8 --k 1 --n 50 --px 12345 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc s-eq-0-sm-line-y-parallel gen_line   --s 0 --t 4 --k 2 --n 50 --px 0 --py 54321 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc s-eq-0-sm-line-1 gen_line            --s 0 --t 27 --k 10 --n 50 --px 100 --py 100 --qx 1 --qy -1 --min_c -10000000 --max_c 10000000
tc s-eq-0-sm-line-2 gen_line            --s 0 --t 1 --k 10 --n 50 --px 100 --py 100 --qx 1 --qy 1 --min_c -10000000 --max_c 10000000
tc s-eq-0-sm-many-peaks-1 gen_many_peaks --s 0 --t 11 --k 4 --n 18 --seed 7702
tc s-eq-0-sm-many-peaks-2 gen_many_peaks --s 0 --t 11 --k 4 --n 18 --seed 1949

# O(n^3 lg n)
group group4 20
limits --max_n 50
include_group group2
include_group group3
tc 1
tc 2
tc 3
tc sm-random-2 gen_random --s 10  --t 100 --k  5 --n 50
tc sm-random-3 gen_random --s 100 --t  10 --k  5 --n 50
tc sm-random-4 gen_random --s 100 --t  10 --k 10 --n 50
tc sm-random-5 gen_random --s 10  --t 100 --k 10 --n 50
tc sm-random-6 gen_random --s 100 --t 100 --k 20 --n 50

tc sm-line-x-axis gen_line --s 1 --t 2 --k 10 --n 50 --px 0 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc sm-line-y-axis gen_line --s 1 --t 3 --k 10 --n 50 --px 0 --py 0 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc sm-line-x-parallel gen_line --s 1 --t 8 --k 10 --n 50 --px 12345 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc sm-line-y-parallel gen_line --s 1 --t 4 --k 10 --n 50 --px 0 --py 54321 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000

tc sm-line-1 gen_line --s 5 --t 27 --k 10 --n 50 --px 100 --py 100 --qx 1 --qy -1 --min_c -10000000 --max_c 10000000
tc sm-line-2 gen_line --s 5 --t 27 --k 10 --n 50 --px 100 --py 100 --qx 1 --qy 1 --min_c -10000000 --max_c 10000000

tc sm-many-peaks-1 gen_many_peaks --s 9 --t 11 --k 4 --n 18 --seed 2168
tc sm-many-peaks-2 gen_many_peaks --s 9 --t 11 --k 4 --n 18 --seed 1265


# O(n^2 lg eps^-2)
group group5 22
limits --max_n 500
output_validator_flags float_tolerance 1 
tc lp-sm-random-3 gen_random        --s 100 --t 10  --k  5  --n 50
tc lp-sm-random-4 gen_random        --s 100 --t 10  --k 10  --n 50
tc lp-sm-random-6 gen_random        --s 100 --t 100 --k 20  --n 50
tc lp-sm-line-x-axis gen_line       --s 10  --t 2   --k 10  --n 50 --px 0 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc lp-sm-line-y-axis gen_line       --s 20  --t 3   --k 10  --n 50 --px 0 --py 0 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc lp-sm-line-x-parallel gen_line   --s 40  --t 8   --k 10  --n 50 --px 12345 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc lp-sm-line-y-parallel gen_line   --s 80  --t 4   --k 10  --n 50 --px 0 --py 54321 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc lp-sm-line-1 gen_line            --s 50  --t 27  --k 10  --n 50 --px 100 --py 100 --qx 1 --qy -1 --min_c -10000000 --max_c 10000000
tc lp-sm-line-2 gen_line            --s 33  --t 27  --k 10  --n 50 --px 100 --py 100 --qx 1 --qy 1 --min_c -10000000 --max_c 10000000
tc lp-lg-random-3 gen_random        --s 100 --t 10  --k 50  --n 499
tc lp-lg-random-4 gen_random        --s 1   --t 1   --k 123 --n 500
tc md-random-2 gen_random           --s 10  --t 100 --k  5  --n 500
tc md-random-3 gen_random           --s 100 --t  10 --k  5  --n 500
tc md-random-4 gen_random           --s 100 --t  10 --k 10  --n 500
tc md-random-5 gen_random           --s 10  --t 100 --k 10  --n 500
tc md-random-6 gen_random           --s 100 --t 100 --k 20  --n 500
tc md-line-x-axis gen_line          --s 1   --t 2   --k 10  --n 500 --px 0 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc md-line-y-axis gen_line          --s 1   --t 3   --k 10  --n 500 --px 0 --py 0 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc md-line-x-parallel gen_line      --s 1   --t 8   --k 10  --n 500 --px 12345 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc md-line-y-parallel gen_line      --s 1   --t 4   --k 10  --n 500 --px 0 --py 54321 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc md-line-1 gen_line               --s 5   --t 27  --k 10  --n 500 --px 500 --py 100 --qx 1 --qy -1 --min_c -10000000 --max_c 10000000
tc md-line-2 gen_line               --s 5   --t 27  --k 10  --n 500 --px 500 --py 100 --qx 1 --qy 1 --min_c -10000000 --max_c 10000000


# O(n^2 lg eps^-1 + n lg eps^-2 lg n)
group group6 28
include_group group1
include_group group2
include_group group3
include_group group4
tc lg-random-3 gen_random       --s 100 --t  10 --k  5 --n 700
tc lg-random-4 gen_random       --s 100 --t  10 --k 10 --n 700
tc lg-random-6 gen_random       --s 100 --t 100 --k 20 --n 700
tc lg-random-7 gen_random       --s 100 --t  10 --k 40 --n 700
tc lg-line-x-axis gen_line      --s 1   --t 2   --k 10 --n 700 --px 0 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc lg-line-y-axis gen_line      --s 1   --t 3   --k 10 --n 700 --px 0 --py 0 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc lg-line-x-parallel gen_line  --s 1   --t 8   --k 10 --n 700 --px 12345 --py 0 --qx 0 --qy 1 --min_c -100000000 --max_c 100000000
tc lg-line-y-parallel gen_line  --s 1   --t 4   --k 10 --n 700 --px 0 --py 54321 --qx 1 --qy 0 --min_c -100000000 --max_c 100000000
tc lg-line-1 gen_line           --s 5   --t 27  --k 10 --n 700 --px 100 --py 100 --qx 1 --qy -1 --min_c -10000000 --max_c 10000000
tc lg-line-2 gen_line           --s 5   --t 27  --k 10 --n 700 --px 100 --py 100 --qx 1 --qy 1 --min_c -10000000 --max_c 10000000
tc lg-circle-1 gen_circles      --s 10  --t 100 --k 10 --n 700 --c 50 --d 10000000000 --min_dis 9000000000

