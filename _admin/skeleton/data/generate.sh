#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution th.py # Use submissions/accepted/th.py to generate answers

# all the generators are introduced here
compile gen_random.py
compile gen_explicit.py


# there are two *.in files in data/sample
samplegroup
sample 1
sample 2

# First test group, and the number of points for it
group group1 40
limits --same # the 'same' argument is passed to input_validators/validate.py
tc 1 # includes test case 1 from samplegroup, i.e., data/sample/1.in
tc zeroes          gen_explicit 0 0 
tc neg-ones        gen_explicit -1 -1
tc neg-extremes-s  gen_explicit -1000 -1000
tc pos-extremes-s  gen_explicit 1000 1000
tc smallpos-s      gen_random --lo 1 --hi 9 --same
tc smallneg-s      gen_random --lo -9 --hi -1 --same
tc small-s         gen_random --lo -9 --hi 9 --same
tc random-pos-s    gen_random --lo 1 --same
tc random-neg-s    gen_random --hi -1 --same
tc random-1-s      gen_random --same
tc random-2-s      gen_random --same
tc random-3-s      gen_random --same

# Second test group, and the number of points for it
group group2 60
tc 2 # data/sample/2.in belongs here
include_group group1 # group2 includes group1
tc extremes-mp   gen_explicit -1000 1000
tc extremes-pm   gen_explicit 1000 -1000
tc smallpos      gen_random --lo 1 --hi 9 
tc smallneg      gen_random --lo -9 --hi 1
tc small         gen_random --lo -9 --hi 9
tc random-pos-1  gen_random --lo 1 
tc random-neg-1  gen_random --hi -1
tc random-1      gen_random 
tc random-2      gen_random 
tc random-3      gen_random 
