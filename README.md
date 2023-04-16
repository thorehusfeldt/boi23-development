Problems for BOI 2023
=====================

This repo contains the six new problems for the Baltic Informatics Olympiad 2023:

Day 1. Saturday 29 April 2023, 9:00–14:00 Copenhagen time (= CEST = GMT+2)

* Astronomer, `astronomer`  
* Staring Contest, `staringcontest`
* Tycho, `tycho`


Day 2. Sunday 30 April 2023, 9:00–14:00 Copenhagen time (= CEST = GMT+2)

* Minequake, `minequake`
* Mineral Deposits, `mineraldeposits`
* Sequence, `sequence`

Warm-up day
-----------

BOI is preceded by a warmup contest that reuses problems from Open Kattis.

Friday, 28 April 2023, 16:00-18:00 Copenhagen time (= CEST = GMT+2)

* Odd Echo, `open.kattis.com/problems/oddecho`
* Simple arithmetic, `open.kattis.com/problems/simplearithmetic`
* The Princess and the Pea, `open.kattis.com/problems/prinsesse`


Installation
============

Installation
------------

To build these problems, run the script `<id>/data/generate.sh` in each problem directory.
Alternatively, run `_tools/verify <id>`, which builds problem `<id>` and (among other things) runs `verifyproblem` on it, or even `_tools/verifyall`, which builds and runs all problems.


### Known Issues

* `astronomer` This problem has many test groups and many partially accepted submissions in various languages, which leads to many warnings about sensitive time limits. This could not be helped.
