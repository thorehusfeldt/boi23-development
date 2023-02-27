#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution wojciech-hashing.cpp

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2

group group1 23
limits --max_n 16
tc 1
tc 2
tc ty-fibo      gen_explicit  2 3 5 8 11
tc ty-fibo-back gen_explicit  11 8 5 3 2
tc ty-random    gen_random    -n 16

group group2 21
limits --max_w 1 --max_n 300
tc ty-one-one   gen_explicit  1
tc ty-all-ones  gen_explicit  1 1 1 1 1
tc sm-all-ones  gen_random -n 300 --max_w 1

group group3 22
limits --max_w 1 --max_n 1400
include_group group2
tc md-all-ones gen_random -n  301 --max_w 1
tc lg-all-ones-1 gen_random -n 1399 --max_w 1
tc lg-all-ones-2 gen_random -n 1400 --max_w 1

group group4 34
limits --max_n 10000
include_group group1
include_group group3
tc lg-random gen_random -n 10000
