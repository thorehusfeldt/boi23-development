#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py

samplegroup
# no samples

group group1 100
tc ukr_task_description_sample_1 gen_explicit 4 5 350 1 2 3 3 2 5
tc ukr_task_description_sample_2 gen_explicit 5 5 350 1 1
