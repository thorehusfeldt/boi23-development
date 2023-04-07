#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution dacin21-memo_vector_hash.cpp

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py
compile gen_linear.py

# there are two *.in files in data/sample
samplegroup
sample 1

group group1 11
limits --max_n 10
tc 1
tc ty-longest   gen_explicit  1 1 300 1 300 300 300 1 1 1
tc ty-fibo      gen_explicit  2 3 5 8 11
tc ty-fibo-back gen_explicit  11 8 5 3 2
tc ty-random    gen_random    --avoid_short_solution -n 10
tc ty-random-10 gen_random    --avoid_short_solution -n 10 --max_w 10
tc ty-random-lg gen_random    --avoid_short_solution -n 10
tc ty-random-5  gen_random    --avoid_short_solution -n 10 --max_w 5
tc ty-ones-2    gen_random    -n 10 --max_w 1
tc ty-ones-3    gen_random    -n 9 --max_w 1
tc ty-linear    gen_linear    7

group group2 10
limits --max_w 1 --max_n 300
tc ty-one-one   gen_explicit  1
tc ty-five-ones   gen_explicit  1 1 1 1 1
tc sm-all-ones    gen_random -n 300 --max_w 1
tc ty-all-ones-2  gen_random -n 11 --max_w 1
tc sm-all-ones-1  gen_random -n 299 --max_w 1

group group3 10
limits --same_w --max_n 300
include_group group2
tc sm-all-twos  gen_random -n 300 --min_w 2 --max_w 2
tc sm-all-3s  gen_random   -n 300 --min_w 3 --max_w 3
tc sm-all-10s  gen_random   -n 300 --min_w 10 --max_w 10
tc sm-all-100s  gen_random   -n 300 --min_w 100 --max_w 100
tc sm-all-1_000_000s  gen_random   -n 300 --min_w 1_000_000 --max_w 1_000_000
tc sm-all-999_999s  gen_random   -n 300 --min_w 999_999 --max_w 999_999
tc sm-all-123_456  gen_random   -n 300 --min_w 123_456 --max_w 123_456
tc sm-all-392_845  gen_random   -n 300 --min_w 392_845 --max_w 392_845

group group4 9
limits --max_w 1 --max_n 1400
include_group group2
tc md-all-ones gen_random -n  301 --max_w 1
tc lg-all-ones-1 gen_random -n 1399 --max_w 1
tc lg-all-ones-2 gen_random -n 1400 --max_w 1

group group5 45
limits --max_n 5000
include_group group1
include_group group4
tc lg-random-1    gen_random --avoid_short_solution -n 5000 
tc md-linear    gen_linear   2047
tc lg-random-2    gen_random -n 5000 --min_w 900_000
tc lg-random-3    gen_random --avoid_short_solution -n 5000 --max_w 1000
tc lg-random-ty   gen_random --avoid_short_solution -n 5000 --max_w 10
tc lg-ones        gen_random -n 5000 --max_w 1
tc lg-random-sm   gen_random -n 5000 --min_w 100 --max_w 105
tc lg-random-md   gen_random -n 5000 --min_w 1000 --max_w 1050
tc lg-random-md-1 gen_random -n 4999 --min_w 1000 --max_w 1050

group group6 15
include_group group5
tc hg-linear      gen_linear 16383
tc hg-random-1    gen_random -n 30000
tc hg-random-2-d  gen_random -n 30000 --min_w 900_000
tc hg-random-3    gen_random -n 30000 --max_w 1000
tc hg-random-4    gen_random -n 30000 --max_w 100
tc hg-random-5    gen_random -n 30000 --min_w 100 --max_w 105
tc hg-ones        gen_random -n 30000 --max_w 1
tc hg-random-sm   gen_random -n 30000 --max_w 10
