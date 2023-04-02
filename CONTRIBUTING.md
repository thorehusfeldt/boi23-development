Style Sheet
===========

The section structure of a noninteractive problem is as follows:

* Example. (Optional)
* Input. Avoid numerical constraints such as “\\(n\leq 1000\\)” here, but do include  structural constraints such as “\\(0\leq u < v < n\\)”.
Put each such constraint on a single line in the source code; label them as `constraint:xyz` where `xyz` is a lowercase string of english letters a--z, such as `constraint:vertexnames`.
* Output.
* Constraints and Scoring. Put as many general constraints here as possible; put them on a single in in the LaTeX source and label them.

Interactive problems have no Input and Output sections but an Interaction section.

The validator should make parameter constraints explicit instead of relying on default arguments.
For instance, Write
```
assert n <= 100_000 # constraint:max_n
```
instead of relying on
```
parser.add_argument("--max_n", type=int, default=100_000)
...
assert n <= max_n
```
(It still makes sense to have argument defaults. But don't verify with them.)
As a rule, each constraint should be verified exactly once.

To avoid erros, do use underscores in python, as in `1_000`, and the correct decimal grouping seperators in your own natural language.
In LaTeX, use `\,` (for `\thinspace`) as the thousands seperator in English.

