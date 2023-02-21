#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution sweep_circle.cpp

# all the generators are introduced here
compile gen_random.py

samplegroup
sample 1
sample 2
sample 3

# so far only have one test group, this will change
group group1 100
tc 1
tc 2
tc 3
tc sm-random-2 gen_random --s 10  --t 100 --k  5 --n 50
tc sm-random-3 gen_random --s 100 --t  10 --k  5 --n 50
tc sm-random-4 gen_random --s 100 --t  10 --k 10 --n 50
tc sm-random-5 gen_random --s 10  --t 100 --k 10 --n 50
tc sm-random-6 gen_random --s 100 --t 100 --k 20 --n 50
tc sm-random-7 gen_random --s 100 --t  10 --k 40 --n 50
tc sm-random-8 gen_random --s 10  --t 100 --k 40 --n 50
