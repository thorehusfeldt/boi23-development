#! /usr/env/python3

""" Validate interaction for 'manhattan'

    Typically run by verifyproblem. To run on its own from the command line,
    invoke as

    > ./validate.py input_file.in judge_answer.ans feedback_dir

    feedback_dir must exist, this is where the judgemessages are written
    judge_answer.ans is ignored
"""

import sys
from pathlib import Path


def fail(msg: str) -> None:
    """Fail WA with given message"""
    with open(sys.argv[3] / Path("judgemessage.txt"), "a", encoding="utf-8") as jfile:
        jfile.write(f"WA: {msg}\n")
    with open(sys.argv[3] / Path("teammessage.txt"), "a", encoding="utf-8") as afile:
        afile.write(f"WA: {msg}\n")
    sys.exit(43)


def accept(num_hidden_points: int, rounds_used: int, max_rounds: int, board_width : int, board_height : int) -> None:
    # Extremely preliminary scoring function
    sys.exit(42)
    """
    tc_point = None
    if num_hidden_points == 1:
        tc_point = 3
    elif num_hidden_points == 2:
        tc_point = 6
    elif max_rounds == 3000:
        tc_point = 19
    elif max_rounds == 600:
        tc_point = 11
    elif max_rounds == 310:
        tc_point = 7
    elif max_rounds == 2 and board_width <= 10**5 and board_height <= 10**5:
        tc_point = 20
    elif max_rounds == 2 and board_width <= 10**8 and board_height <= 10**8:
        tc_point = 15
    else: # Q = 2
        tc_point = 19

    score = int(0.5 + tc_point * min(1, max_rounds / rounds_used))
    with open(sys.argv[3] / Path("score.txt"), "a", encoding="utf-8") as sfile:
        sfile.write(str(score) + "\n")
    sys.exit(42)"""


def get_team_line():
    team_bytes = sys.stdin.buffer.readline()
    try:
        team_line = team_bytes.decode("utf-8")
    except UnicodeDecodeError:
        fail("Team answer contains unexpected characters")
    if not team_line:
        fail("Team produces empty output")  # can this ever happen?
    return team_line


with open(sys.argv[1]) as in_file:
    n, m, k, Q = map(int, in_file.readline().split())
    hidden_dots = set()
    for _ in range(k):
        hidden_dots.add(tuple(map(int, in_file.readline().split())))

    print(n, m, k, Q, flush=True)
    for rounds in range(Q + 1): # Q queries + 1 answer
        line = get_team_line().split()
        if line[0] == "?":
            if len(line) != 2:
                fail(f"Got {len(line)} tokens, expected 2")
            try:
                d = int(line[1])
            except ValueError:
                fail(f"Failed to parse {line[1]} as int")
            if not 1 <= d <= 10**4: # constraint:wavesize
                fail(f"Wave size out of bounds: {d}")
            query_points = set()
            for _ in range(d):
                line = get_team_line().split()
                if len(line) != 2:
                    fail(f"Got {len(line)} tokens, expected 2")
                try:
                    x, y = map(int, line)
                except ValueError:
                    fail(f"Failed to parse {line} as two ints")
                if(x < 0 or x > 10**9 or y < 0 or y > 10** 9):
                    fail(f"Query point is out of bounds:  {(x,y)}")
                query_points.add((x, y))
            if len(query_points) < d:
                fail("Duplicate query points")
            print(
                *sorted(
                    abs(p[0] - q[0]) + abs(p[1] - q[1])
                    for q in query_points
                    for p in hidden_dots
                ),
                flush=True,
            )
        elif line[0] == "!":
            if len(line) != 2 * k + 1:
                fail(f"Got {len(line)} tokens, expected {2 * k + 1}: {line}")
            line = line[1:]
            for token in line:
                try:
                    _ = int(token)
                except ValueError:
                    fail(f"Failed to parse {token} as an integer")
            answer_ints = list(map(int, line))
            answer_dots = set(zip(answer_ints[::2], answer_ints[1::2]))
            if answer_dots != hidden_dots:
                fail("Wrong answer")  # this could be more informative...
            break
        else:
            fail("Team response must start with ! or ?")
    else:
        fail("Too many rounds")
    accept(k, rounds, Q, n, m)
