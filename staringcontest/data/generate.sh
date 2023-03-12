#!/bin/bash

# run this as ./generate.sh from the data directory. It populates data/secret

. ../../_testdata_tools/gen.sh

use_solution ../../data/empty.sh # empty .ans files

# all the generators are introduced here
compile gen_explicit.py
compile gen_range.py

samplegroup
# no samples

group group1 9
limits --max_n 50

tc pair12     gen_explicit 1 2
tc pair21     gen_explicit 2 1
tc pair86400  gen_explicit 86400 1
tc range-50    gen_range --n 50
tc range-r-50    gen_range --random --n 50
tc range-10    gen_range --n 10
tc range-r-10    gen_range --random --n 10
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

group group2 11
limits --max_n 1000

tc range-300   gen_range --n 300
tc range-1000   gen_range --n 1000
tc range-r-300   gen_range --random --n 300
tc range-r-1000   gen_range --random --n 1000

group group3 80
limits --min_n 1001 --max_n 1500

tc range-lg  gen_range --n 1500
tc range-r-lg-1 gen_range --random --n 1500
tc range-r-lg-2 gen_range --random --n 1500
tc range-r-lg-3 gen_range --random --n 1500
