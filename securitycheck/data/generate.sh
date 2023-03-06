#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution dacin21-full-bottom_up.cpp

# all the generators are introduced here
compile gen_random.py
compile gen_star.py
compile gen_regular.py

# there are two *.in files in data/sample
samplegroup
sample 1

# First test group, and the number of points for it
group group1 18
limits --max_n 100000 --structure "path"
tc sm-path     gen_star -n 100   --degree 1
tc md-path     gen_star -n 1000  --degree 1
tc lg-path-999 gen_star -n 999   --degree 1
tc lg-path     gen_star -n 10000  --degree 1
tc hg-path     gen_star -n 100000 --degree 1
tc hg-path-1   gen_star -n 99999  --degree 1

group group2 19
limits --max_n 100000 --structure "starlike"
include_group group1
tc sm-star gen_star     -n 100
tc md-star gen_star     -n 1000
tc sm-starlike gen_star -n 100   --degree 10
tc md-starlike gen_star -n 1000  --degree 100
tc lg-starlike      gen_star -n  10000 --degree 3
tc hg-starlike-3    gen_star -n 100000 --degree 3
tc hg-starlike-30   gen_star -n 100000 --degree 30
tc hg-starlike-300  gen_star -n 100000 --degree 300
tc hg-starlike-3000 gen_star -n 100000 --degree 3000

group group3 20
limits --max_n 10
tc 1
for F in ../manual_inputs/*.in; do
	tc_manual $F
done

group group4 21
limits --max_n 1000
include_group group3
tc md-random     gen_random -n 1000
tc md-2-regular  gen_regular   -n 1000 -d 2
tc md-3-regular-1  gen_regular -n 1000 -d 3
tc md-3-regular-2  gen_regular -n  999 -d 3
tc md-3-regular-3  gen_regular -n  998 -d 3
tc md-10-regular gen_regular   -n 1000 -d 10
tc md-100-regular gen_regular  -n 1000 -d 100

group group5 22
limits --max_n 100000
include_group group1
include_group group2
include_group group4
tc hg-random     gen_random     -n 100000
tc hg-star       gen_star       -n 100000
tc hg-2-regular  gen_regular    -n 100000 -d 2
tc hg-10-regular gen_regular    -n 100000 -d 10
tc hg-100-regular gen_regular   -n 100000 -d 100
tc hg-1000-regular gen_regular  -n 100000 -d 1000
