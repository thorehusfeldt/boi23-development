#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution always_dig.py 

# all the generators are introduced here
compile gen_random.py

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2

# First test group, and the number of points for it
group group1 100
tc 1
tc 2
tc ty-no-holes     gen_random -z   10 -m 2 -c 10 -n 0
tc ty-all-holes    gen_random -z   10 -m 2 -c 10 -n 10 --max_a 9
tc ty-some-holes   gen_random -z   10 -m 2 -c 10 -n 3
tc sm-some-holes   gen_random -z  100 -m 2 -c 10 -n 33
tc md-some-holes   gen_random -z 1000 -m 2 -c 10 -n 333
tc md-early-holes  gen_random -z 1000 -m 2 -c 10 -n 333 --max_a 500
