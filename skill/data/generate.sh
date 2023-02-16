#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py

samplegroup
# no samples

# so far only have one test group, this will change
group group1 100
tc four-primes-1 gen_explicit 2 3 5 7
tc four-primes-2 gen_explicit 2 3 7 5
tc four-primes-3 gen_explicit 2 5 3 7
tc four-primes-4 gen_explicit 2 5 7 3
tc four-primes-5 gen_explicit 2 7 3 5
tc four-primes-6 gen_explicit 2 7 5 3
tc four-primes-7 gen_explicit 3 2 5 7
tc four-primes-8 gen_explicit 3 2 7 5
tc four-primes-9 gen_explicit 3 5 2 7
tc four-primes-10 gen_explicit 3 5 7 2
tc four-primes-11 gen_explicit 3 7 2 5
tc four-primes-12 gen_explicit 3 7 5 2
tc four-primes-13 gen_explicit 5 2 3 7
tc four-primes-14 gen_explicit 5 2 7 3
tc four-primes-15 gen_explicit 5 3 2 7
tc four-primes-16 gen_explicit 5 3 7 2
tc four-primes-17 gen_explicit 5 7 2 3
tc four-primes-18 gen_explicit 5 7 3 2
tc four-primes-19 gen_explicit 7 2 3 5
tc four-primes-20 gen_explicit 7 2 5 3
tc four-primes-21 gen_explicit 7 3 2 5
tc four-primes-22 gen_explicit 7 3 5 2
tc four-primes-23 gen_explicit 7 5 2 3
tc four-primes-24 gen_explicit 7 5 3 2
