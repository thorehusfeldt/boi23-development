#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution drl_sweep_circle.cpp

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
tc sm-random-1 gen_random --s 100 --t 100 --k 30 --n 100
tc sm-random-2 gen_random --s 10 --t 100 --k 30 --n 100
tc sm-random-3 gen_random --s 100 --t 10 --k 30 --n 100
tc sm-random-4 gen_random --s 100 --t 100 --k 70 --n 100
