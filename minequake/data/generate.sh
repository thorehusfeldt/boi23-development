#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_tools/gen.sh

use_solution dacin21-full-bottom_up.cpp

# all the generators are introduced here
compile gen_random.py
compile gen_star.py
compile gen_regular.py

# there are two *.in files in data/sample
samplegroup
sample 1
sample 2
sample 3

# First test group, and the number of points for it
group group1 18
limits --structure "path"
tc 1
tc 3
tc edge        gen_star -n 2     --degree 1
tc sm-path     gen_star -n 100   --degree 1
tc md-path     gen_star -n 1000  --degree 1
tc lg-path-999 gen_star -n 999   --degree 1
tc lg-path     gen_star -n 10000  --degree 1
tc hg-path     gen_star -n 100000 --degree 1
tc hg-path-1   gen_star -n 99999  --degree 1

group group2 19
limits --structure "starlike"
include_group group1
tc 2
tc sm-star gen_star          -n 100
tc md-star gen_star          -n 1000
tc hg-star gen_star          -n 100000
tc sm-starlike gen_star      -n 100   --degree 10
tc md-starlike gen_star      -n 1000  --degree 100
tc lg-starlike      gen_star -n  10000 --degree 3
tc hg-starlike-3    gen_star -n 100000 --degree 3
tc hg-starlike-30   gen_star -n 100000 --degree 30
tc hg-starlike-300  gen_star -n 100000 --degree 300
tc hg-starlike-3000 gen_star -n 100000 --degree 3000
tc hg-starlike-30K  gen_star -n 100000 --degree 30000

group group3 20
limits --max_n 10
tc 1
tc 2
tc 3
for F in ../manual_inputs/*.in; do
	case "$F" in 
		*tree-4-1*) echo "skipping $F (it duplicates sample 2)"
			;;
		*) tc_manual $F
			;;
	esac
done

group group4 21
limits --max_n 1000
include_group group3
tc md-random     gen_random    -n 1000
tc md-random-1     gen_random  -n 1000
tc md-random-2    gen_random   -n 1000
tc md-2-regular-1  gen_regular -n 1000 -d 2
tc md-2-regular-2  gen_regular -n  999 -d 2
tc md-3-regular-1  gen_regular -n 1000 -d 3
tc md-3-regular-2  gen_regular -n  999 -d 3
tc md-3-regular-3  gen_regular -n  998 -d 3
tc md-10-regular gen_regular   -n 1000 -d 10
tc md-100-regular gen_regular  -n 1000 -d 100

group group5 22
include_group group1
include_group group2
include_group group4
tc hg-random-1   gen_random     -n 100000
tc hg-random-2   gen_random     -n 100000
tc hg-random-3   gen_random     -n 100000
tc hg-2-regular  gen_regular    -n 100000 -d 2
tc hg-10-regular gen_regular    -n 100000 -d 10
tc hg-100-regular gen_regular   -n 100000 -d 100
tc hg-1000-regular gen_regular  -n 100000 -d 1000
