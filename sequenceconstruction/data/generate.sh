#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution dacin21-memo_vector.cpp

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2
sample 3

group group1 11
limits --max_n 10
tc 1
tc 2
tc 3
tc ty-fibo      gen_explicit  2 3 5 8 11
tc ty-fibo-back gen_explicit  11 8 5 3 2
tc ty-random    gen_random    -n 10
tc ty-random-10 gen_random    -n 10 --max_w 10
tc ty-random-5  gen_random    -n 10 --max_w 5
tc ty-random-2  gen_random    -n 10 --max_w 1

group group2 20
limits --max_w 1 --max_n 300
tc ty-one-one   gen_explicit  1
tc ty-five-ones  gen_explicit  1 1 1 1 1
tc sm-all-ones  gen_random -n 300 --max_w 1

group group3 9
limits --max_w 1 --max_n 1400
include_group group2
tc md-all-ones gen_random -n  301 --max_w 1
tc lg-all-ones-1 gen_random -n 1399 --max_w 1
tc lg-all-ones-2 gen_random -n 1400 --max_w 1

group group4 45
limits --max_n 10000
include_group group1
include_group group3
tc lg-random gen_random -n 10000

group group5 15
include_group group4
tc lg-random-1 gen_random -n 30000
tc lg-random-2 gen_random -n 30000
tc lg-random-3 gen_random -n 30000
tc lg-random-ones gen_random -n 30000 --max_w 1
tc lg-random-sm gen_random -n 30000 --max_w 10
