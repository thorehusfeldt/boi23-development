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


def accept() -> None:
    sys.exit(42)


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
    b, k, w = map(int, in_file.readline().split())
    hidden_dots = set()
    for _ in range(k):
        hidden_dots.add(tuple(map(int, in_file.readline().split())))
    total_probes = 0
    print(b, k, w, flush=True)
    for rounds in range(w + 1):
        line = get_team_line().split()
        if len(line) == 0:
            fail("Tokens expected (maybe team sent empty line?)")
        mode = line.pop(0)
        if mode == "?":
            if len(line) % 2 == 1:
                fail(f"Got {len(line)} tokens, expected an even number")
            d = len(line) // 2
            total_probes += d
            if not 1 <= d <= 2_000: # constraint:wavesize
                fail(f"Expected at least 1 and at most 2000 probes, got {d}")
            if total_probes > 20_000: #constraint:totalprobes
                fail(f"Expected at most 20_000 probes in total, currently has {total_probes}")
            probe_coordinates = []
            for token in line:
                try:
                    coord = int(token)
                except ValueError:
                    fail(f"Failed to parse {token} as int")
                if not -10**8 <= coord <= 10**8: # constraint:probecoordinates
                    fail(f"Probe coordinate out of bounds: {coord}")
                probe_coordinates.append(coord)
            probed_points = list(zip(probe_coordinates[::2], probe_coordinates[1::2]))
            if len(set(probed_points)) < d:
                fail("Duplicate probes")
            print(
                *sorted(
                    abs(p[0] - q[0]) + abs(p[1] - q[1])
                    for q in probed_points
                    for p in hidden_dots
                ),
                flush=True,
            )
        elif mode == "!":
            if len(line) != 2 * k:
                fail(f"Got {len(line)} tokens, expected {2 * k}: {line}")
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
    if sys.stdin.buffer.readline():
        fail("Too much output")
    accept()
