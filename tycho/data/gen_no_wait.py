""" Generates an instance where an optimal solution exists
    which never waits after leaving position 0. The waiting
    time at position 0 can be specified by -start. 
    The generator starts by adding -use shelters used by this solution. Then new
    shelters will be incrementally added, always maintaining the optimal solution.
    To speed up the generation, we can add -trivial shelters before the 
    first possible shelter.

    This requires the existence of a compiled full solution in the file
    ./full_solution. (This should be provided by the generate.sh script)
    
    The time needed by this generator is O((n-u-t)*n*log(n)) where 
    u is -use and t is -trivial. So large instances should
    have a large u to have reasonably fast generation...
"""

import random
import subprocess
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("-b", type=int)
parser.add_argument("-p", type=int)
parser.add_argument("-n", type=int)
parser.add_argument("-d", type=int)
parser.add_argument("-use", type=int)
parser.add_argument("-trivial", type=int, default=0)
parser.add_argument("-start", type=int, default=0)
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()

random.seed(args.seed)

first_shelter = args.p - args.start
pulse_cnt = (args.b - first_shelter + args.p - 1) // args.p
shelters = set([x*args.p + first_shelter for x in random.sample(range(0, pulse_cnt), args.use)])
if args.trivial > 0:
    shelters |= set(sorted(random.sample(range(1, first_shelter), args.trivial)))
answer = args.b + args.start + args.d * (pulse_cnt - args.use)

def maketc():
    test = "{} {} {} {}\n".format(args.b, args.p, args.d, len(shelters))
    test += "\n".join(map(str, sorted(list(shelters)))) + "\n"
    return test

def solve():
    test = maketc()
    proc = subprocess.Popen(["./full_solution"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
    out, _ = proc.communicate(input=test.encode("utf-8"))
    _ = proc.wait()
    return int(out.decode("utf-8"))


while len(shelters) < args.n:
    pos = random.randint(1, args.b-1)
    if pos in shelters:
        continue
    shelters.add(pos)
    new_ans = solve()
    if answer != new_ans:
        shelters.remove(pos)

print(maketc(), end="")
