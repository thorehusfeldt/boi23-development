#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution lucas_impl_seg.cpp

# all the generators are introduced here
compile gen_random.py
compile gen_critc.py
compile GenSmallComplete.java

# gen_critc.py needs a full solution
g++ -O2 ../submissions/accepted/lucas_impl_seg.cpp -o full_solution

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2
sample 3
sample 4
sample 5

group group1 10
limits --max_b 1000 --max_p 100 --max_n 10

tc 1
tc 2
tc 3
tc 4
tc 5
#
# Loop over binary strings of length 5
#for i in {0,1}{0,1}{0,1}{0,1}{0,1}; do
for i in 1{0,1}{0,1}{0,1}{0,1}; do
    tc small-$i GenSmallComplete $i
done

tc ty-two-holes-m2 gen_random -z  10 -m  2 -c 10 -n 2
tc ty-two-holes-21 gen_random -z 100 -m 21 -c 10 -n 2
tc ty-9-holes      gen_random -z 100 -m 21 -c 10 -n 9
tc ty-10-holes     gen_random -z 100 -m 21 -c 10 -n 10

group group2 10
limits --max_b 1000
include_group group1
tc ty-no-holes     gen_random -z   10 -m 2 -c 10 -n 0
tc ty-all-holes    gen_random -z   10 -m 2 -c 10 -n 9
tc ty-some-holes   gen_random -z   10 -m 2 -c 10 -n 3
tc sm-some-holes   gen_random -z  100 -m 2 -c 10 -n 33
tc ty-packed-early gen_random --strategy regular  -z 100 --min_a  1 --max_a 50 -n 50 -m 2 -c 10
tc ty-packed-late  gen_random --strategy regular  -z 100 --min_a 50 --max_a 99 -n 50 -m 2 -c 10
tc ty-alternating  gen_random --strategy regular  -z 100 --min_a  1 --max_a 99 -n 50 -m 2 -c 10
tc smallzmn-packed gen_random --strategy regular  -z 1000 -n 999 -m 2 -c 10
tc crit-smallzm-1  gen_critc  -z 1000 -m 42 -c0 7 -n 100
tc crit-smallzm-2  gen_critc  -z 1000 -m 42 -c0 7 -n 100

group group3 15
limits --max_p 1_000_000 --max_n 1000 
include_group group1
include_group group2
tc md-some-holes   gen_random -z 1000 -m 2 -c 10 -n 333
tc md-early-holes  gen_random -z 1000 -m 2 -c 10 -n 333 --max_a 500
tc rd-10k-1k-md    gen_random -z 10_000 -m 1000 -c 10 -n 333
tc rd-10k-lg-md    gen_random -z 10_000 -m 5112 -c 10 -n 333
tc rd-10k-lg-1k    gen_random -z 10_000 -m 5112 -c 10 -n 1000
tc sm-n-lg-m       gen_random -z  1_000_000 -m   100_000 -c 10 -n 1000 # need more of these
tc sm-n-hg-m       gen_random -z 10_000_000 -m 1_000_000 -c 10 -n 1000 
tc sm-crit-smallc  gen_critc  -z 10_000 -m 42 -c0 7   -n 100
tc crit-smallc     gen_critc  -z 10_000 -m 42 -c0 7   -n 1000
tc crit-medc       gen_critc  -z 10_000 -m 42 -c0 24  -n 1000
tc crit-bigc       gen_critc  -z 10_000 -m 100 -c0 43 -n 1000

group group4 20
limits --max_p 100
include_group group1
tc small-m-md-early-holes  gen_random  -z 1_000_000 -m 100 -c 10 -n 100_000 --max_a 200_000
tc small-m-rd              gen_random  -z 1_000_000 -m 100 -c 10 -n 100_000
tc small-m-crit-smallc     gen_critc   -z 1_000_000 -m 100 -c0 7   -n 1000
tc small-m-crit-medc       gen_critc   -z 1_000_000 -m 100 -c0 24  -n 1000
tc small-m-crit-bigc       gen_critc   -z 1_000_000 -m 100 -c0 43 -n 1000

group group5 35
limits --max_p 1_000_000
include_group group3
include_group group4
tc hg-midm-1       gen_random -z 10_000_000 -m 65536 -c 20 -n 100000
tc hg-midm-2       gen_random -z 100_000_000 -m 11231 -c 10 -n 99998
tc hg-midm-3       gen_random -z 10_000_000_000 -m 1000000 -c 42 -n 98976
tc hg-midm-4       gen_random -z 1_000_000_000 -m 987654 -c 100 -n 98765
tc hg-midm-5       gen_random -z 100_000_000 -m 123456 -c 2 -n 99999
tc hg-midm-6       gen_random -z 100_000_000 -m 12345 -c 5123 -n 100000
tc hg-midm-crit-smallc     gen_critc   -z 1_000_000_000 -m 1_000_000 -c0 7   -n 100_000
tc hg-midm-crit-medc       gen_critc   -z 1_000_000_000 -m 1_000_000 -c0 24  -n 100_000
tc hg-midm-crit-bigc       gen_critc   -z 1_000_000_000 -m 1_000_000 -c0 52  -n 100_000

group group6 10
include_group group5
tc hg-bigm-1       gen_random -z   100_000_000_000 -m 3_000_000_000 -c 20 -n 100_000
tc hg-bigm-2       gen_random -z     1_000_000_000 -m 12_345_678 -c 10 -n 99_998
tc hg-bigm-3       gen_random -z    10_000_000_000 -m 1_001_234_145 -c 42 -n 98_976
tc hg-bigm-4       gen_random -z     1_000_000_000 -m 98_765_432 -c 100 -n 98_765
tc huger-bigm-1       gen_random -z   1_000_000_000_000 -m 3_000_000_000 -c 20 -n 100_000
tc huger-bigm-2       gen_random -z   1_000_000_000_000 -m    12_345_678 -c 10 -n 99_998
tc huger-bigm-3       gen_random -z   1_000_000_000_000 -m 1_001_234_145 -c 42 -n 98_976
tc huger-bigm-4       gen_random -z   1_000_000_000_000 -m    98_765_432 -c 100 -n 98_765


# clean up the full solution
rm ./full_solution
