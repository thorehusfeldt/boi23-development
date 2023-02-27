#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution sweep_circle_rand.cpp

# all the generators are introduced here
compile gen_random.py

samplegroup
sample 1
sample 2
sample 3

group group1 30
limits --max_n 50
tc 1
tc 2
tc 3
tc sm-random-2 gen_random --s 10  --t 100 --k  5 --n 50
tc sm-random-3 gen_random --s 100 --t  10 --k  5 --n 50
tc sm-random-4 gen_random --s 100 --t  10 --k 10 --n 50
tc sm-random-5 gen_random --s 10  --t 100 --k 10 --n 50
tc sm-random-6 gen_random --s 100 --t 100 --k 20 --n 50

group group2 70
include_group group1
tc md-random-2 gen_random --s 10  --t 100 --k  5 --n 500
tc md-random-3 gen_random --s 100 --t  10 --k  5 --n 500
tc md-random-4 gen_random --s 100 --t  10 --k 10 --n 500
tc md-random-5 gen_random --s 10  --t 100 --k 10 --n 500
tc md-random-6 gen_random --s 100 --t 100 --k 20 --n 500
tc md-random-7 gen_random --s 100 --t  10 --k 40 --n 500
tc md-random-8 gen_random --s 10  --t 100 --k 40 --n 500
tc md-random-9 gen_random --s 10  --t 100 --k 70 --n 500
tc md-random-10 gen_random --s 10  --t 100 --k 100 --n 500
