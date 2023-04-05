#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py
compile gen_maximise_candidates.py
samplegroup
# no samples

group group1 9
limits --max_k 1
tc one-point-1 gen_explicit 10 10000 5 5
tc one-point-2 gen_explicit 10 10000 9 1
tc one-point-3 gen_explicit 10 10000 1 8
tc one-point-4 gen_explicit 10 10000 0 0
tc one-point-5 gen_explicit 10 10000 10 0
tc one-point-6 gen_explicit 10 10000 0 10
tc one-point-7 gen_explicit 10 10000 10 10
tc ukr_task_description_sample_2 gen_explicit 5 10000 1 1
# tc two-point-1 gen_explicit 10 10000 5 5 1 2
# tc two-point-2 gen_explicit 10 10000 9 1 8 2
# tc two-point-3 gen_explicit 10 10000 1 8 1 6
# tc two-point-4 gen_explicit 10 10000 0 0 4 4
# tc two-point-5 gen_explicit 10 10000 10 0 10 10
# tc two-point-6 gen_explicit 10 10000 0 10 10 0
# tc two-point-7 gen_explicit 10 10000 10 10 5 5

group group2 19
limits --min_w 3000
include_group group1
tc g3-tmp-1 gen_random --b 100 --w 3000 --k 3
tc g3-tmp-2 gen_random --b 100 --w 3000 --k 4
tc g3-tmp-3 gen_random --b 100 --w 3000 --k 5
tc g3-tmp-4 gen_random --b 100 --w 3000 --k 6
tc g3-tmp-5 gen_random --b 100 --w 3000 --k 10
tc g3-tmp-6 gen_random --b 100 --w 3000 --k 20
tc g3-random-maxk-1 gen_random --b 100  --w 3000 --k 30
tc g3-random-maxk-4 gen_random --b 1000 --w 3000 --k 30
tc g3-random-maxk-5 gen_random --b 100_000_000 --w 3000 --k 30
tc g3-random-maxcand-1 gen_maximise_candidates --b 2000 --w 3000 --k 30 --ccx 400 --ccy 400
tc g3-random-maxcand-2 gen_maximise_candidates --b 2_000_000 --w 3000 --k 30 --ccx 10000 --ccy 1000

group group3 11
limits --min_w 600
include_group group2
tc g4-random-maxk-1 gen_random --b 100 --w 600 --k 30
tc g4-random-maxk-4 gen_random --b 1000  --w 600 --k 30
tc g4-random-maxk-5 gen_random --b 100_000_000  --w 600 --k 30
tc g4-random-maxcand-1 gen_maximise_candidates --b 2000 --w 600 --k 30 --ccx 400 --ccy 400
tc g4-random-maxcand-2 gen_maximise_candidates --b 2_000_000 --w 600 --k 30 --ccx 10000 --ccy 1000
tc g4-random-maxcand-5 gen_maximise_candidates --b 100_000_000 --w 600 --k 30 --ccx 10000000 --ccy 1000000

group group4 7
limits --min_w 310
include_group group3
tc g5-random-maxk-1 gen_random --b 100 --w 310 --k 30
tc g5-random-maxk-4 gen_random --b 1000 --w 310 --k 30
tc g5-random-maxk-5 gen_random --b 100_000_000 --w 310 --k 30
tc g5-random-maxcand-1 gen_maximise_candidates --b 2000 --w 310 --k 30 --ccx 400 --ccy 400
tc g5-random-maxcand-2 gen_maximise_candidates --b 2_000_000 --w 310 --k 30 --ccx 10000 --ccy 1000
tc g5-random-maxcand-5 gen_maximise_candidates --b 100_000_000  --w 310 --k 30 --ccx 10000000 --ccy 1000000

group group5 20
limits --max_b 10_000 --min_w 2
#include_group group5
tc ukr_task_description_sample_1 gen_explicit 5 2 1 2 3 3 2 5
tc g6-random-maxk-1 gen_random --b 100  --w 2 --k 30
tc g6-random-maxk-4 gen_random --b 1000 --w 2 --k 30
tc g6-random-maxk-5 gen_random --b 10_000 --w 2 --k 30
tc g6-random-maxcand-1 gen_maximise_candidates --b 10_000 --w 2 --k 30 --ccx 400 --ccy 400
tc g6-random-maxcand-2 gen_maximise_candidates --b 10_000 --w 2 --k 30 --ccx 9000 --ccy 1000
tc g6-random-maxcand-3 gen_maximise_candidates --b 10_000 --w 2 --k 30 --ccx 800 --ccy 800
tc g6-random-maxcand-4 gen_maximise_candidates --b 10_000 --w 2 --k 30 --ccx 1100 --ccy 8000
tc g6-random-maxcand-5 gen_maximise_candidates --b 10_000 --w 2 --k 30 --ccx 9000 --ccy 9000

group group6 15
limits --min_w 2
include_group group5
tc g7-random-maxk-5 gen_random --b 100_000_000  --w 2 --k 30
tc g7-random-maxcand-1 gen_maximise_candidates --b 100_000_000 --w 2 --k 30 --ccx 400 --ccy 400
tc g7-random-maxcand-2 gen_maximise_candidates --b 100_000_000 --w 2 --k 30 --ccx 10000 --ccy 1000
tc g7-random-maxcand-3 gen_maximise_candidates --b 100_000_000 --w 2 --k 30 --ccx 800 --ccy 800
tc g7-random-maxcand-4 gen_maximise_candidates --b 100_000_000 --w 2 --k 30 --ccx 1100 --ccy 80000
tc g7-random-maxcand-5 gen_maximise_candidates --b 100_000_000 --w 2 --k 30 --ccx 10000000 --ccy 1000000


group group7 19
limits --min_w 2
include_group group4
include_group group6
tc g8-tmp-1 gen_random --b 100_000_000 --w 2 --k 7
tc g8-tmp-2 gen_random --b 100_000_000 --w 2 --k 14
tc g8-tmp-3 gen_random --b 100_000_000 --w 2 --k 22
tc g8-tmp-4 gen_random --b 100_000_000 --w 2 --k 29
tc g8-random-maxk-4 gen_random --b 100_000_000 --w 2 --k 30
tc g8-random-maxk-5 gen_random --b 100_000_000 --w 2 --k 30
tc g8-random-maxcand-4 gen_maximise_candidates --b 99_999_999 --w 2 --k 30
tc g8-random-maxcand-5 gen_maximise_candidates --b 100_000_000 --w 2 --k 30
