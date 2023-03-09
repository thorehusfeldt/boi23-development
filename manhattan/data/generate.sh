#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py
compile gen_maximise_candidates.py

samplegroup
# no samples

group group1 6
tc one-point-1 gen_explicit 10 10 350 5 5
tc one-point-2 gen_explicit 10 10 350 9 1
tc one-point-3 gen_explicit 10 10 350 1 8
tc one-point-4 gen_explicit 10 10 350 0 0
tc one-point-5 gen_explicit 10 10 350 10 0
tc one-point-6 gen_explicit 10 10 350 0 10
tc one-point-7 gen_explicit 10 10 350 10 10
tc ukr_task_description_sample_2 gen_explicit 5 5 350 1 1

group group2 94
tc ukr_task_description_sample_1 gen_explicit 4 5 350 1 2 3 3 2 5
tc tmp-1 gen_random --n 100 --m 100 --Q 350 --k 2
tc tmp-2 gen_random --n 100 --m 100 --Q 350 --k 3
tc tmp-3 gen_random --n 100 --m 100 --Q 350 --k 4
tc tmp-4 gen_random --n 100 --m 100 --Q 350 --k 5
tc random-maxk-1 gen_random --n 100 --m 100 --Q 350 --k 50
tc random-maxk-2 gen_random --n 10 --m 100 --Q 350 --k 50
tc random-maxk-3 gen_random --n 100 --m 10 --Q 350 --k 50
tc random-maxk-4 gen_random --n 1000 --m 1000 --Q 350 --k 50
tc random-maxk-5 gen_random --n 1000000000 --m 100000000 --Q 350 --k 50

tc random-maxcand-1 gen_maximise_candidates --n 2000 --m 2000 --Q 350 --k 50 --ccx 400 --ccy 400
tc random-maxcand-2 gen_maximise_candidates --n 2000000 --m 2000000 --Q 350 --k 50 --ccx 10000 --ccy 1000
tc random-maxcand-3 gen_maximise_candidates --n 2000000 --m 2000 --Q 350 --k 50 --ccx 800 --ccy 800
tc random-maxcand-4 gen_maximise_candidates --n 2000 --m 2000000 --Q 350 --k 50 --ccx 1100 --ccy 80000
tc random-maxcand-5 gen_maximise_candidates --n 1000000000 --m 100000000 --Q 350 --k 50 --ccx 10000000 --ccy 1000000