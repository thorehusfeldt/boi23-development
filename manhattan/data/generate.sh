#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py

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

group group2 93
tc ukr_task_description_sample_1 gen_explicit 4 5 350 1 2 3 3 2 5
