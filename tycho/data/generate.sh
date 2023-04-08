#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution lucas_impl_seg.cpp

# all the generators are introduced here
compile gen_random.py
compile gen_critc.py
compile gen_no_wait.py
compile gen_waiting.py
compile GenSmallComplete.java

# gen_critc.py and gen_no_wait.py need a full solution
g++ -O2 ../submissions/accepted/lucas_simple_seg_comp.cpp -o full_solution

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2
sample 3
sample 4
sample 5

group group1 8
limits --max_p 1_000_000 --no_wait
tc nw-small-1    gen_no_wait -b 100 -p 10 -d 11 -n 10 -use 7
tc nw-small-2    gen_no_wait -b 100 -p 10 -d 11 -n 15 -use 7 -start 5
tc nw-mid-1      gen_no_wait -b 100_000 -p 1000 -d 123 -n 1000 -use 91
tc nw-mid-2      gen_no_wait -b 100_000 -p 100 -d 123 -n 1000 -use 567 -start 42
tc nw-big-1      gen_no_wait -b 1_000_000_000_000 -p 1_000_000 -d 12345 -n 100_000 -use 99_900
tc nw-big-2      gen_no_wait -b 1_000_000_000_000 -p 1_000_000 -d 12345 -n 100_000 -use 90_000 -start 23415 -trivial 9950


group group2 5
limits --max_b 1000 --max_p 100 --max_n 10

tc 1
tc 2
tc 3
tc 4
tc 5

# Loop over binary strings of length 5, except 00000
declare -a b_strings
for i in {0,1}{0,1}{0,1}{0,1}{0,1}; do
    b_strings+=($i)
done
for i in {1..31}; do
    id=${b_strings[$i]}
    tc small-$id GenSmallComplete $id
done

tc ty-two-holes-m2 gen_random -b  10 -p  2 -d 10 -n 2
tc ty-two-holes-21 gen_random -b 100 -p 21 -d 10 -n 2
tc ty-9-holes      gen_random -b 100 -p 21 -d 10 -n 9
tc ty-10-holes     gen_random -b 100 -p 21 -d 10 -n 10

tc ty-waiting-1	   gen_waiting -n 10 -p 20 -d 1
tc ty-waiting-2	   gen_waiting -n 10 -p 20 -d 20
tc ty-waiting-3	   gen_waiting -n 10 -p 20 -d 30

group group3 7
limits --max_b 1000
include_group group2
tc ty-no-holes     gen_random -b   10 -p 2 -d 10 -n 0
tc ty-all-holes    gen_random -b   10 -p 2 -d 10 -n 9
tc ty-some-holes   gen_random -b   10 -p 2 -d 10 -n 3
tc sm-some-holes   gen_random -b  100 -p 2 -d 10 -n 33
tc ty-packed-early gen_random --strategy regular  -b 100 --min_a  1 --max_a 50 -n 50 -p 2 -d 10
tc ty-packed-late  gen_random --strategy regular  -b 100 --min_a 50 --max_a 99 -n 50 -p 2 -d 10
tc ty-alternating  gen_random --strategy regular  -b 100 --min_a  1 --max_a 99 -n 50 -p 2 -d 10
tc smallzmn-packed gen_random --strategy regular  -b 1000 -n 999 -p 2 -d 10
tc crit-smallzm-1  gen_critc  -b 1000 -p 42 -d0 7 -n 100
tc crit-smallzm-2  gen_critc  -b 1000 -p 42 -d0 7 -n 100
tc sm-waiting-1    gen_waiting -n 100 -p 12 -d 12
tc sm-waiting-2    gen_waiting -n 100 -p 12 -d 13

group group4 15
limits --max_p 1_000_000 --max_n 1000 
include_group group2
include_group group3
tc md-some-holes   gen_random -b 1000 -p 2 -d 10 -n 333
tc md-early-holes  gen_random -b 1000 -p 2 -d 10 -n 333 --max_a 500
tc rd-10k-1k-md    gen_random -b 10_000 -p 1000 -d 10 -n 333
tc rd-10k-lg-md    gen_random -b 10_000 -p 5112 -d 10 -n 333
tc rd-10k-lg-1k    gen_random -b 10_000 -p 5112 -d 10 -n 1000
tc sm-n-lg-p       gen_random -b  1_000_000 -p   100_000 -d 10 -n 1000 # need more of these
tc sm-n-lg-p-2     gen_random -b 10_000_000 -p   654_321 -d 10 -n 1000 
tc sm-n-hg-p       gen_random -b 10_000_000 -p 1_000_000 -d 10 -n 1000 
tc sm-crit-smallc  gen_critc  -b 10_000 -p 42 -d0 7   -n 100
tc crit-smallc     gen_critc  -b 10_000 -p 42 -d0 7   -n 1000
tc crit-medc       gen_critc  -b 10_000 -p 42 -d0 24  -n 1000
tc crit-bigc       gen_critc  -b 10_000 -p 100 -d0 43 -n 1000
tc md-waiting-1    gen_waiting -n 1000 -p 500 -d 500
tc md-waiting-2    gen_waiting -n 1000 -p 500 -d 501

group group5 20
limits --max_p 100
include_group group2
tc small-m-md-early-holes  gen_random  -b 1_000_000 -p 100 -d 10 -n 100_000 --max_a 200_000
tc small-m-rd              gen_random  -b 1_000_000 -p 100 -d 10 -n 100_000
tc small-m-crit-smallc     gen_critc   -b 1_000_000 -p 100 -d0 7   -n 1000
tc small-m-crit-medc       gen_critc   -b 1_000_000 -p 100 -d0 24  -n 1000
tc small-m-crit-bigc       gen_critc   -b 1_000_000 -p 100 -d0 43 -n 1000
tc lg-waiting-1           gen_waiting -n 100_000 -p 100 -d 100
tc lg-waiting-2           gen_waiting -n 100_000 -p 100 -d 101

group group6 35
limits --max_p 1_000_000
include_group group1
include_group group4
include_group group5
tc hg-midm-1       gen_random -b 10_000_000 -p 65536 -d 20 -n 100000
tc hg-midm-2       gen_random -b 100_000_000 -p 11231 -d 10 -n 99998
tc hg-midm-3       gen_random -b 10_000_000_000 -p 1000000 -d 42 -n 98976
tc hg-midm-4       gen_random -b 1_000_000_000 -p 987654 -d 100 -n 98765
tc hg-midm-5       gen_random -b 100_000_000 -p 123456 -d 2 -n 99999
tc hg-midm-6       gen_random -b 100_000_000 -p 12345 -d 5123 -n 100000
tc hg-midm-crit-smallc     gen_critc   -b 1_000_000_000 -p 1_000_000 -d0 7   -n 100_000
tc hg-midm-crit-medc       gen_critc   -b 1_000_000_000 -p 1_000_000 -d0 24  -n 100_000
tc hg-midm-crit-bigc       gen_critc   -b 1_000_000_000 -p 1_000_000 -d0 52  -n 100_000
tc hg-waiting-1  gen_waiting -n 100_000 -p 50000 -d 50000
tc hg-waiting-2  gen_waiting -n 100_000 -p 50000 -d 50001

group group7 10
include_group group6
tc hg-bigm-1       gen_random -b   100_000_000_000 -p 3_000_000_000 -d 20 -n 100_000
tc hg-bigm-2       gen_random -b     1_000_000_000 -p 12_345_678 -d 10 -n 99_998
tc hg-bigm-3       gen_random -b    10_000_000_000 -p 1_001_234_145 -d 42 -n 98_976
tc hg-bigm-4       gen_random -b     1_000_000_000 -p 98_765_432 -d 100 -n 98_765
tc huger-bigm-1       gen_random -b   1_000_000_000_000 -p 3_000_000_000 -d 20 -n 100_000
tc huger-bigm-2       gen_random -b   1_000_000_000_000 -p    12_345_678 -d 10 -n 99_998
tc huger-bigm-3       gen_random -b   1_000_000_000_000 -p 1_001_234_145 -d 42 -n 98_976
tc huger-bigm-4       gen_random -b   1_000_000_000_000 -p    98_765_432 -d 100 -n 98_765


# clean up the full solution
rm ./full_solution
