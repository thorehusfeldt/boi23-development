#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution lucas_impl_seg.cpp

# all the generators are introduced here
compile gen_random.py
compile gen_critc.py
compile GenSmallComplete.java

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2
sample 3
sample 4
sample 5

group group1 5
# Loop over binary strings of length 5
for i in {0,1}{0,1}{0,1}{0,1}{0,1}; do
    tc small-$i GenSmallComplete $i
done


group group2 12
limits --max_n 10 --max_z 100 --max_m 100
tc 1
tc 2
tc 3
tc 4
tc 5
tc sm-two-holes gen_random -z  10 -m  2 -c 10 -n 2
tc lg-two-holes gen_random -z 100 -m 21 -c 10 -n 2
tc lg-few-holes gen_random -z 100 -m 21 -c 10 -n 9

group group3 18
limits --max_z 100 --max_m 100
include_group group1
tc ty-no-holes     gen_random -z   10 -m 2 -c 10 -n 0
tc ty-all-holes    gen_random -z   10 -m 2 -c 10 -n 9
tc ty-some-holes   gen_random -z   10 -m 2 -c 10 -n 3
tc sm-some-holes   gen_random -z  100 -m 2 -c 10 -n 33
tc ty-packed-early gen_random --strategy regular  -z 100 --min_a  1 --max_a 50 -n 50 -m 2 -c 10
tc ty-packed-late  gen_random --strategy regular  -z 100 --min_a 50 --max_a 99 -n 50 -m 2 -c 10
tc ty-alternating  gen_random --strategy regular  -z 100 --min_a  1 --max_a 99 -n 50 -m 2 -c 10

group group4 19
limits --max_n 1000
tc md-some-holes   gen_random -z 1000 -m 2 -c 10 -n 333
tc md-early-holes  gen_random -z 1000 -m 2 -c 10 -n 333 --max_a 500
tc rd-10k-1k-md    gen_random -z 10000 -m 1000 -c 10 -n 333
tc rd-10k-lg-md    gen_random -z 10000 -m 5112 -c 10 -n 333
tc rd-10k-lg-1k    gen_random -z 10000 -m 5112 -c 10 -n 1000
tc sm-n-lg-m       gen_random -z 1000000 -m 100000 -c 10 -n 1000 # need more of these
tc sm-n-hg-m       gen_random -z 100000000 -m 100000000 -c 10 -n 1000 
tc crit-smallc     gen_critc  -z 10000 -m 42 -c0 7   -n 1000
tc crit-medc       gen_critc  -z 10000 -m 42 -c0 24  -n 1000
tc crit-bigc       gen_critc  -z 10000 -m 100 -c0 43 -n 1000

group group5 20
limits --max_m 100
tc small-m-md-early-holes  gen_random  -z 1000000 -m 100 -c 10 -n 100000 --max_a 200000
tc small-m-rd              gen_random  -z 1000000 -m 100 -c 10 -n 100000
tc small-m-crit-smallc     gen_critc   -z 1000000 -m 100 -c0 7   -n 1000
tc small-m-crit-medc       gen_critc   -z 1000000 -m 100 -c0 24  -n 1000
tc small-m-crit-bigc       gen_critc   -z 1000000 -m 100 -c0 43 -n 1000

group group6 26
include_group group2
include_group group3
include_group group4
tc lg-some-holes   gen_random -z 10000 -m 2 -c 10 -n 3333
tc hg-some-holes   gen_random -z 100000 -m 2 -c 10 -n 33333
tc hg-large-m      gen_random -z 100000 -m 20000 -c 10 -n 33333
tc hg-no-holes     gen_random -z 100000 -m 2 -c 10 -n 0
tc hg-all-holes    gen_random -z 100000 -m 2 -c 10 -n 99999
tc rd-hg           gen_random -z 10000000 -m 43513451 -c 5123 -n 100000
