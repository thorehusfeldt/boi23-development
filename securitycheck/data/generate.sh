#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution dacin21-full-two_dfs.py

# all the generators are introduced here
compile gen_random.py
compile gen_star.py

# there are two *.in files in data/sample
samplegroup
sample 1

# First test group, and the number of points for it
group group1 25
limits -n 10
tc 1
tc ty-random gen_random -n 10
tc ty-star gen_star -n 10
tc ty-starlike gen_star -n 10 --degree 3

group group2 24
limits -n 10000 --structure "star"
tc sm-star gen_star   -n 100
tc md-star gen_star   -n 1000
tc sm-starlike gen_star   -n 100   --degree 10
tc md-starlike gen_star   -n 1000  --degree 100

group group3 51
tc 1
tc lg-random gen_random -n 10000
tc lg-star gen_star -n 10000
tc lg-starlike gen_star -n 10000 --degree 3
