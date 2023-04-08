#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py
compile gen_random.py
compile gen_maximise_candidates.py
compile gen_border_points.py
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
tc one-point-large-1 gen_random --b 100000000 --w 10000 --k 1
tc one-point-large-2 gen_random --b 100000000 --w 10000 --k 1
tc one-point-large-3 gen_explicit 100000000 10000 100000000 100000000
tc one-point-large-4 gen_explicit 100000000 10000 100000000 -100000000
tc one-point-large-5 gen_explicit 100000000 10000 -100000000 100000000
tc one-point-large-6 gen_explicit 100000000 10000 -100000000 -100000000
# tc two-point-1 gen_explicit 10 10000 5 5 1 2
# tc two-point-2 gen_explicit 10 10000 9 1 8 2
# tc two-point-3 gen_explicit 10 10000 1 8 1 6
# tc two-point-4 gen_explicit 10 10000 0 0 4 4
# tc two-point-5 gen_explicit 10 10000 10 0 10 10
# tc two-point-6 gen_explicit 10 10000 0 10 10 0
# tc two-point-7 gen_explicit 10 10000 10 10 5 5

group group2 19
limits --min_w 500
include_group group1
tc g2-tmp-1 gen_random --b 100 --w 500 --k 3
tc g2-tmp-2 gen_random --b 100 --w 500 --k 4
tc g2-tmp-3 gen_random --b 100 --w 500 --k 5
tc g2-tmp-4 gen_random --b 100 --w 500 --k 6
tc g2-tmp-5 gen_random --b 100 --w 500 --k 10
tc g2-tmp-6 gen_random --b 100 --w 500 --k 20
tc g2-random-maxk-1 gen_random --b 100  --w 500 --k 20
tc g2-random-maxk-4 gen_random --b 1000 --w 500 --k 20
tc g2-random-maxk-5 gen_random --b 100_000_000 --w 500 --k 20
tc g2-random-maxcand-1 gen_maximise_candidates --b 2000 --w 500 --k 20 --ccx 400 --ccy 400
tc g2-random-maxcand-2 gen_maximise_candidates --b 2_000_000 --w 500 --k 20 --ccx 10000 --ccy 1000
tc g2-borders-1 gen_border_points --b 100_000_000 --w 500 --k 20
tc g2-borders-2 gen_border_points --b 100_000_000 --w 500 --k 20

group group3 11
limits --min_w 210
include_group group2
tc g3-random-maxk-1 gen_random --b 100 --w 210 --k 20
tc g3-random-maxk-4 gen_random --b 1000  --w 210 --k 20
tc g3-random-maxk-5 gen_random --b 100_000_000  --w 210 --k 20
tc g3-random-maxcand-1 gen_maximise_candidates --b 2000 --w 210 --k 20 --ccx 400 --ccy 400
tc g3-random-maxcand-2 gen_maximise_candidates --b 2_000_000 --w 210 --k 20 --ccx 10000 --ccy 1000
tc g3-random-maxcand-5 gen_maximise_candidates --b 100_000_000 --w 210 --k 20 --ccx 10000000 --ccy 1000000
tc g3-borders-1 gen_border_points --b 100_000_000 --w 210 --k 20
tc g3-borders-2 gen_border_points --b 100_000_000 --w 210 --k 20

group group4 7
limits --min_w 130
include_group group3
tc g4-random-maxk-1 gen_random --b 100 --w 130 --k 20
tc g4-random-maxk-4 gen_random --b 1000 --w 130 --k 20
tc g4-random-maxk-5 gen_random --b 100_000_000 --w 130 --k 20
tc g4-random-maxcand-1 gen_maximise_candidates --b 2000 --w 130 --k 20 --ccx 400 --ccy 400
tc g4-random-maxcand-2 gen_maximise_candidates --b 2_000_000 --w 130 --k 20 --ccx 10000 --ccy 1000
tc g4-random-maxcand-5 gen_maximise_candidates --b 100_000_000  --w 130 --k 20 --ccx 10000000 --ccy 1000000
tc g4-borders-1 gen_border_points --b 100_000_000 --w 130 --k 20
tc g4-borders-2 gen_border_points --b 100_000_000 --w 130 --k 20

group group5 20
limits --max_b 10_000 --min_w 2
#include_group group5
tc ukr_task_description_sample_1 gen_explicit 5 2 1 2 3 3 2 5
tc g5-random-maxk-1 gen_random --b 100  --w 2 --k 20
tc g5-random-maxk-4 gen_random --b 1000 --w 2 --k 20
tc g5-random-maxk-5 gen_random --b 10_000 --w 2 --k 20
tc g5-random-maxcand-1 gen_maximise_candidates --b 10_000 --w 2 --k 20 --ccx 400 --ccy 400
tc g5-random-maxcand-2 gen_maximise_candidates --b 10_000 --w 2 --k 20 --ccx 9000 --ccy 1000
tc g5-random-maxcand-3 gen_maximise_candidates --b 10_000 --w 2 --k 20 --ccx 800 --ccy 800
tc g5-random-maxcand-4 gen_maximise_candidates --b 10_000 --w 2 --k 20 --ccx 1100 --ccy 8000
tc g5-random-maxcand-5 gen_maximise_candidates --b 10_000 --w 2 --k 20 --ccx 9000 --ccy 9000
tc g5-borders-1 gen_border_points --b 10_000 --w 2 --k 20
tc g5-borders-2 gen_border_points --b 10_000 --w 2 --k 20


group group6 15
limits --min_w 2 --max_b 10_000_000
include_group group5
tc g6-random-maxk-5 gen_random --b 10_000_000  --w 2 --k 20
tc g6-random-maxcand-1 gen_maximise_candidates --b 10_000_000 --w 2 --k 20 --ccx 400 --ccy 400
tc g6-random-maxcand-2 gen_maximise_candidates --b 10_000_000 --w 2 --k 20 --ccx 10000 --ccy 1000
tc g6-random-maxcand-3 gen_maximise_candidates --b 10_000_000 --w 2 --k 20 --ccx 800 --ccy 800
tc g6-random-maxcand-4 gen_maximise_candidates --b 10_000_000 --w 2 --k 20 --ccx 1100 --ccy 80000
tc g6-random-maxcand-5 gen_maximise_candidates --b 10_000_000 --w 2 --k 20 --ccx 1_000_000 --ccy 1_000_000
tc g6-borders-1 gen_border_points --b 10_000_000 --w 2 --k 20
tc g6-borders-2 gen_border_points --b 10_000_000 --w 2 --k 20


group group7 19
limits --min_w 2
include_group group4
include_group group6
tc g7-tmp-1 gen_random --b 100_000_000 --w 2 --k 7
tc g7-tmp-2 gen_random --b 100_000_000 --w 2 --k 14
tc g7-tmp-3 gen_random --b 100_000_000 --w 2 --k 20
tc g7-tmp-4 gen_random --b 100_000_000 --w 2 --k 20
tc g7-random-maxk-4 gen_random --b 100_000_000 --w 2 --k 20
tc g7-random-maxk-5 gen_random --b 100_000_000 --w 2 --k 20
tc g7-random-maxcand-4 gen_maximise_candidates --b 99_999_999 --w 2 --k 20
tc g7-random-maxcand-5 gen_maximise_candidates --b 100_000_000 --w 2 --k 20
tc g7-borders-1 gen_border_points --b 100_000_000 --w 2 --k 20
tc g7-borders-2 gen_border_points --b 100_000_000 --w 2 --k 20
