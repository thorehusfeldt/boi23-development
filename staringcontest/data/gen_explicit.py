#! /usr/bin/env python3

import sys

values = sys.argv[1:-1] # drop first argument (myself) and last (seed)
print (*(int(v) for v in values)) # print all arguments back
