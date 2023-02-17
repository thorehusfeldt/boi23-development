#! /usr/env/python3

""" Validate interaction for 'skill'

    Typically run by verifyproblem. To run on its own from the command line,
    invoke as

    > ./validate.py input_file.in judge_answer.ans feedback_dir

    feedback_dir must exist, this is where the judgemessages are written
    judge_answer.ans is ignored
"""

import math
import sys
from pathlib import Path

def fail(msg: str) -> None:
    """Fail WA with given message"""
    with open(sys.argv[3] / Path("judgemessage.txt"), "a", encoding="utf-8") as jfile:
        jfile.write(f"WA: {msg}\n")
    with open(sys.argv[3] / Path("teammessage.txt"), "a", encoding="utf-8") as afile:
        afile.write(f"WA: {msg}\n")
    sys.exit(43)

def accept(rounds_used: int, input_size: int) -> None:
    if rounds_used < input_size + 16 * math.log(n):
        score = 100
    elif rounds_used < 2 * (input_size - 2) + 1:
        score = 75
    elif rounds_used < 3 * (input_size - 2):
        score = 50
    else:
        score = 25
    with open(sys.argv[3] / Path("score.txt"), "a", encoding="utf-8") as sfile:
        sfile.write(str(score)+"\n")
    sys.exit(42)

def get_team_line():
    team_bytes = sys.stdin.buffer.readline()
    try:
        team_line = team_bytes.decode("utf-8")
    except UnicodeDecodeError:
        fail("Team answer contains unexpected characters")
    if not team_line:
        fail("Team produces empty output") # can this ever happen?
    return team_line

with open(sys.argv[1]) as in_file:
    skills = list(map(int, in_file.readline().split()))
    n = len(skills)
    print(n, flush=True)
    for q in range(3 * n):
        line = get_team_line().split()
        if line[0] == '?':
            if len(line) != 3:
                fail(f"Got {len(line)} tokens, expected 3")
            i, j = map(int, line[1:])
            if not 1 <= i <= n:
                fail(f"Query index out of bounds: {i}")
            if not 1 <= j <= n:
                fail(f"Query index out of bounds: {j}")
            if i == j:
                fail(f"Query indices must be different, not both {i}")
            print(min(skills[i - 1], skills[j - 1]), flush=True)
        elif line[0] == '!':
            if len(line) != n + 1:
                fail(f"Got {len(line)} tokens, expected {n + 1}: {line}")
            for token in line[1:]:
                try:
                    _ = int(token)
                except ValueError:
                    fail(f"Failed to parse {token} as an integer")
            bs = map(int, line[1:])
            zeroes = 0
            for a, b in zip(skills, bs):
                if b == 0:
                    zeroes += 1
                else:
                    if a != b:
                        fail(f"Expected {i}th token to be {a[i]}, got {b[i]}")
                if zeroes > 2:
                    fail("Too many zeroes")
            break
        else:
            fail("Team response must start with ! or ?")
    else:
        fail("Too many rounds")
    accept(q, n)
