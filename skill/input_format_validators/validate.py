import re
import sys

MAX_N = 99800 # this needs to be set depending on test group

line = sys.stdin.readline()
assert re.match(r"([1-9][0-9]* )*[1-9][0-9]*\n", line), line
tokens = line.split()
for token in tokens:
    assert int(token) > 0, 'Skills must be positive'

n = len(tokens)
assert 3 <= n <= MAX_N
assert len(set(tokens)) == n, 'Duplicate skills'
assert sys.stdin.readline() == ""
sys.exit(42)
