#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py
compile gen_maximise_candidates_consentrated.py
compile gen_maximise_candidates.py
samplegroup
# no samples

group group1 3
limits --Q 10000 --max_k 1
tc one-point-1 gen_explicit 10 10 10000 5 5
tc one-point-2 gen_explicit 10 10 10000 9 1
tc one-point-3 gen_explicit 10 10 10000 1 8
tc one-point-4 gen_explicit 10 10 10000 0 0
tc one-point-5 gen_explicit 10 10 10000 10 0
tc one-point-6 gen_explicit 10 10 10000 0 10
tc one-point-7 gen_explicit 10 10 10000 10 10
tc ukr_task_description_sample_2 gen_explicit 5 5 10000 1 1

group group2 6
limits --Q 10000 --max_k 2
tc two-point-1 gen_explicit 10 10 10000 5 5 1 2
tc two-point-2 gen_explicit 10 10 10000 9 1 8 2
tc two-point-3 gen_explicit 10 10 10000 1 8 1 6
tc two-point-4 gen_explicit 10 10 10000 0 0 4 4
tc two-point-5 gen_explicit 10 10 10000 10 0 10 10
tc two-point-6 gen_explicit 10 10 10000 0 10 10 0
tc two-point-7 gen_explicit 10 10 10000 10 10 5 5

group group3 19
limits --Q 3000
tc g3-tmp-1 gen_random --n 100 --m 100 --Q 3000 --k 3
tc g3-tmp-2 gen_random --n 100 --m 100 --Q 3000 --k 4
tc g3-tmp-3 gen_random --n 100 --m 100 --Q 3000 --k 5
tc g3-tmp-4 gen_random --n 100 --m 100 --Q 3000 --k 6
tc g3-random-maxk-1 gen_random --n 100 --m 100 --Q 3000 --k 50
tc g3-random-maxk-2 gen_random --n 10 --m 100 --Q 3000 --k 50
tc g3-random-maxk-3 gen_random --n 100 --m 10 --Q 3000 --k 50
tc g3-random-maxk-4 gen_random --n 1000 --m 1000 --Q 3000 --k 50
tc g3-random-maxk-5 gen_random --n 1000000000 --m 100000000 --Q 3000 --k 50
tc g3-random-maxcand-1 gen_maximise_candidates_consentrated --n 2000 --m 2000 --Q 3000 --k 50 --ccx 400 --ccy 400
tc g3-random-maxcand-2 gen_maximise_candidates_consentrated --n 2000000 --m 2000000 --Q 3000 --k 50 --ccx 10000 --ccy 1000
tc g3-random-maxcand-3 gen_maximise_candidates_consentrated --n 2000000 --m 2000 --Q 3000 --k 50 --ccx 800 --ccy 800
tc g3-random-maxcand-4 gen_maximise_candidates_consentrated --n 2000 --m 2000000 --Q 3000 --k 50 --ccx 1100 --ccy 80000
tc g3-random-maxcand-5 gen_maximise_candidates_consentrated --n 1000000000 --m 100000000 --Q 3000 --k 50 --ccx 10000000 --ccy 1000000

group group4 11
limits --Q 600
tc g4-random-maxk-1 gen_random --n 100 --m 100 --Q 600 --k 50
tc g4-random-maxk-2 gen_random --n 10 --m 100 --Q 600 --k 50
tc g4-random-maxk-3 gen_random --n 100 --m 10 --Q 600 --k 50
tc g4-random-maxk-4 gen_random --n 1000 --m 1000 --Q 600 --k 50
tc g4-random-maxk-5 gen_random --n 1000000000 --m 100000000 --Q 600 --k 50
tc g4-random-maxcand-1 gen_maximise_candidates_consentrated --n 2000 --m 2000 --Q 600 --k 50 --ccx 400 --ccy 400
tc g4-random-maxcand-2 gen_maximise_candidates_consentrated --n 2000000 --m 2000000 --Q 600 --k 50 --ccx 10000 --ccy 1000
tc g4-random-maxcand-3 gen_maximise_candidates_consentrated --n 2000000 --m 2000 --Q 600 --k 50 --ccx 800 --ccy 800
tc g4-random-maxcand-4 gen_maximise_candidates_consentrated --n 2000 --m 2000000 --Q 600 --k 50 --ccx 1100 --ccy 80000
tc g4-random-maxcand-5 gen_maximise_candidates_consentrated --n 1000000000 --m 100000000 --Q 600 --k 50 --ccx 10000000 --ccy 1000000

group group5 11
limits --Q 310
tc g5-random-maxk-1 gen_random --n 100 --m 100 --Q 310 --k 50
tc g5-random-maxk-2 gen_random --n 10 --m 100 --Q 310 --k 50
tc g5-random-maxk-3 gen_random --n 100 --m 10 --Q 310 --k 50
tc g5-random-maxk-4 gen_random --n 1000 --m 1000 --Q 310 --k 50
tc g5-random-maxk-5 gen_random --n 1000000000 --m 100000000 --Q 310 --k 50
tc g5-random-maxcand-1 gen_maximise_candidates_consentrated --n 2000 --m 2000 --Q 310 --k 50 --ccx 400 --ccy 400
tc g5-random-maxcand-2 gen_maximise_candidates_consentrated --n 2000000 --m 2000000 --Q 310 --k 50 --ccx 10000 --ccy 1000
tc g5-random-maxcand-3 gen_maximise_candidates_consentrated --n 2000000 --m 2000 --Q 310 --k 50 --ccx 800 --ccy 800
tc g5-random-maxcand-4 gen_maximise_candidates_consentrated --n 2000 --m 2000000 --Q 310 --k 50 --ccx 1100 --ccy 80000
tc g5-random-maxcand-5 gen_maximise_candidates_consentrated --n 1000000000 --m 100000000 --Q 310 --k 50 --ccx 10000000 --ccy 1000000

group group6 20
limits --max_nm 100000 --Q 2
tc ukr_task_description_sample_1 gen_explicit 4 5 2 1 2 3 3 2 5
tc g6-random-maxk-1 gen_random --n 100 --m 100 --Q 2 --k 50
tc g6-random-maxk-2 gen_random --n 10 --m 100 --Q 2 --k 50
tc g6-random-maxk-3 gen_random --n 100 --m 10 --Q 2 --k 50
tc g6-random-maxk-4 gen_random --n 1000 --m 1000 --Q 2 --k 50
tc g6-random-maxk-5 gen_random --n 100000 --m 100000 --Q 2 --k 50
tc g6-random-maxcand-1 gen_maximise_candidates_consentrated --n 100000 --m 100000 --Q 2 --k 50 --ccx 400 --ccy 400
tc g6-random-maxcand-2 gen_maximise_candidates_consentrated --n 100000 --m 100000 --Q 2 --k 50 --ccx 10000 --ccy 1000
tc g6-random-maxcand-3 gen_maximise_candidates_consentrated --n 100000 --m 100000 --Q 2 --k 50 --ccx 800 --ccy 800
tc g6-random-maxcand-4 gen_maximise_candidates_consentrated --n 100000 --m 100000 --Q 2 --k 50 --ccx 1100 --ccy 80000
tc g6-random-maxcand-5 gen_maximise_candidates_consentrated --n 100000 --m 100000 --Q 2 --k 50 --ccx 90000 --ccy 90000

group group7 15
limits --max_nm 100000000 --Q 2
tc g7-random-maxk-5 gen_random --n 100000000 --m 100000000 --Q 2 --k 50
tc g7-random-maxcand-1 gen_maximise_candidates_consentrated --n 100000000 --m 100000000 --Q 2 --k 50 --ccx 400 --ccy 400
tc g7-random-maxcand-2 gen_maximise_candidates_consentrated --n 100000000 --m 100000000 --Q 2 --k 50 --ccx 10000 --ccy 1000
tc g7-random-maxcand-3 gen_maximise_candidates_consentrated --n 100000000 --m 100000000 --Q 2 --k 50 --ccx 800 --ccy 800
tc g7-random-maxcand-4 gen_maximise_candidates_consentrated --n 100000000 --m 100000000 --Q 2 --k 50 --ccx 1100 --ccy 80000
tc g7-random-maxcand-5 gen_maximise_candidates_consentrated --n 100000000 --m 100000000 --Q 2 --k 50 --ccx 10000000 --ccy 1000000


group group8 19
limits --Q 2
tc g8-tmp-1 gen_random --n 1000000000 --m 1000000000 --Q 2 --k 7
tc g8-tmp-2 gen_random --n 1000000000 --m 1000000000 --Q 2 --k 14
tc g8-tmp-3 gen_random --n 1000000000 --m 1000000000 --Q 2 --k 42
tc g8-tmp-4 gen_random --n 1000000000 --m 1000000000 --Q 2 --k 49
tc g8-random-maxk-4 gen_random --n 1000000000 --m 1000000000 --Q 2 --k 50
tc g8-random-maxk-5 gen_random --n 1000000000 --m 500000000 --Q 2 --k 50
tc g8-random-maxcand-4 gen_maximise_candidates --n 999999999 --m 999999999 --Q 2 --k 50
tc g8-random-maxcand-5 gen_maximise_candidates --n 1000000000 --m 1000000000 --Q 2 --k 50