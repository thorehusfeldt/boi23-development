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
tc range-r-50    gen_range --shuffled --n 50
tc range-10    gen_range --n 10
tc range-r-10     gen_range --shuffled --n 10
tc sm-range-sm-1  gen_range --n 50 --max_a 100
tc sm-range-sm-2  gen_range --n 50 --min_a 86350 --max_a 86400
tc sm-range-mid   gen_range --n 50 --min_a 5000 --max_a 10000
tc sm-range-mid-2 gen_range --n 50 --min_a 5000 --max_a 5100
tc sm-range-hi    gen_range --n 50 --min_a 50000 --max_a 86400
tc sm-range-sm-s    gen_range --n 50 --shuffled --max_a 50
tc sm-range-sm-1-s  gen_range --n 50 --shuffled --max_a 100
tc sm-range-sm-2-s  gen_range --n 50 --shuffled --min_a 86350 --max_a 86400
tc sm-range-mid-s   gen_range --n 50 --shuffled --min_a 5000 --max_a 10000
tc sm-range-mid-2-s gen_range --n 50 --shuffled --min_a 5000 --max_a 5100
tc sm-range-hi-s    gen_range --n 50 --shuffled --min_a 50000 --max_a 86400
tc sm-planted-01    gen_range --n 50 --plantfirst 0 --plantsecond 1
tc sm-planted-10    gen_range --n 50 --plantfirst 1 --plantsecond 0
tc sm-planted--2-1  gen_range --n 50 --plantfirst 49 --plantsecond 48 --shuffled
tc sm-planted--1-2  gen_range --n 50 --plantfirst 48
tc sm-planted-1--1  gen_range --n 50 --plantfirst 0 --plantsecond 49
tc sm-planted--1-1  gen_range --n 50 --plantfirst 49 --plantsecond 0
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
tc range-r-300   gen_range --shuffled --n 300
tc range-r-1000   gen_range --shuffled --n 1000
tc md-range-sm-1  gen_range --n 1000 --max_a 2000
tc md-range-sm-2  gen_range --n 1000 --min_a 85400 --max_a 86400
tc md-range-mid   gen_range --n 1000 --min_a 5000 --max_a 10000
tc md-range-mid-2 gen_range --n 1000 --min_a 4000 --max_a 6000
tc md-range-hi    gen_range --n 1000 --min_a 50000 --max_a 86400
tc md-range-sm-s    gen_range --n 1000 --shuffled --max_a 1000
tc md-range-sm-1-s  gen_range --n 1000 --shuffled --max_a 2000
tc md-range-sm-2-s  gen_range --n 1000 --shuffled --min_a 85400 --max_a 86400
tc md-range-mid-s   gen_range --n 1000 --shuffled --min_a 5000 --max_a 10000
tc md-range-mid-2-s gen_range --n 1000 --shuffled --min_a 4000 --max_a 6000
tc md-range-hi-s    gen_range --n 1000 --shuffled --min_a 50000 --max_a 86400
tc md-planted-01    gen_range --n 1000 --plantfirst 0 --plantsecond 1
tc md-planted-10    gen_range --n 1000 --plantfirst 1 --plantsecond 0
tc md-planted--2-1  gen_range --n 1000 --plantfirst 999 --plantsecond 998 --shuffled
tc md-planted--1-2  gen_range --n 1000 --plantfirst 998
tc md-planted-1--1  gen_range --n 1000 --plantfirst 0 --plantsecond 999
tc md-planted--1-1  gen_range --n 1000 --plantfirst 999 --plantsecond 0

group group3 80
limits --min_n 1001 --max_n 1500

tc range-lg  gen_range --n 1500
tc range-r-lg-1 gen_range --shuffled --n 1500
tc range-r-lg-2 gen_range --shuffled --n 1500
tc range-r-lg-3 gen_range --shuffled --n 1500
tc lg-range-sm-1  gen_range --n 1500 --max_a 3000
tc lg-range-sm-2  gen_range --n 1500 --min_a 84900 --max_a 86400
tc lg-range-mid   gen_range --n 1500 --min_a 5000 --max_a 10000
tc lg-range-mid-2 gen_range --n 1500 --min_a 4000 --max_a 6000
tc lg-range-hi    gen_range --n 1500 --min_a 50000 --max_a 86400
tc lg-range-sm-s    gen_range --n 1500 --shuffled --max_a 1500
tc lg-range-sm-1-s  gen_range --n 1500 --shuffled --max_a 2000
tc lg-range-sm-2-s  gen_range --n 1500 --shuffled --min_a 84900 --max_a 86400
tc lg-range-mid-s   gen_range --n 1500 --shuffled --min_a 5000 --max_a 10000
tc lg-range-mid-2-s gen_range --n 1500 --shuffled --min_a 4000 --max_a 6000
tc lg-range-hi-s    gen_range --n 1500 --shuffled --min_a 50000 --max_a 86400
tc lg-planted-01    gen_range --n 1500 --plantfirst 0 --plantsecond 1
tc lg-planted-10    gen_range --n 1500 --plantfirst 1 --plantsecond 0
tc lg-planted--2-1  gen_range --n 1500 --plantfirst 1499 --plantsecond 1498 --shuffled
tc lg-planted--1-2  gen_range --n 1500 --plantfirst 1498
tc lg-planted-1--1  gen_range --n 1500 --plantfirst 0 --plantsecond 1499
tc lg-planted--1-1  gen_range --n 1500 --plantfirst 1499 --plantsecond 0
