Contributing
============

These problems use the [Kattis Problem Package Format](https://www.kattis.com/problem-package-format/).

Development uses the [Kattis/problemtools](https://github.com/Kattis/problemtools) toolchain, the easiest way to install this is to use a docker image, for instance using the `load_docker.sh` script.

Test data are generated using the `_tools` scripts taken from
[Kodsport/testdata_tools](https://github.com/Kodsport/testdata_tools).
Instances should be generated programmatically with a deterministic script in `data/generator.sh`.

Examples of polished problems can be found in `_tools/examples`, including two problems from BOI 2018.

Translation
-----------

Problem statements are written in LaTeX and reside in `<problem_id>/problem_name/problem.<code>.tex`, where `<code>` is the two-letter language code.

To turn this into PDF or HTML, assuming you want the Danish translation (using the ISO 639-1 two-letter language code `da`) of problem `sequence`:

```
_tools/load_docker.sh
_tools/verify sequence
problem2pdf -l da sequence
problem2html -l da sequence
```

The `verify` step is quite time consuming; it builds the input/output pairs in `sequence/data/sample` needed for the sample inputs in the problem statement. To avoid full verification, you can instead just do (after running the docker image)

```
cd sequence/data
./generate.sh
cd ../..
problem2pdf -l da sequence
```

(Once you’ve generated the `.ans` files in `sequence/data/sample` you don’t need to rebuild them.)

To avoid errors, the script `_tools/checkconstraints` extracts properly labeled LaTeX source code and shows it next to the other translations (as well the relevant parts of the input validator and instance generators).
So please run 

```
_tools/load-docker.sh
_tools/checkconstraints <problem_id>
```

and inspect the output with your eyes and good judgement.


Style Sheet
-----------

The section structure of a noninteractive problem is as follows:

* Example. (Optional)
* Input. Avoid numerical constraints such as “\\(n\leq 1000\\)” here, but do include  structural constraints such as “\\(0\leq u < v < n\\)”.
Put each such constraint on a single line in the source code; label them as `constraint:xyz` where `xyz` is a lowercase string of english letters a--z, such as `constraint:vertexnames`.
* Output.
* Constraints and Scoring. Put as many general constraints here as possible; put them on a single line in the LaTeX source and label them.

Interactive problems have no Input and Output sections but an Interaction section.

The validator should make parameter constraints explicit instead of relying on default arguments.
For instance, Write
```
assert n <= 20_000 # constraint:max_n
```
instead of relying on
```
parser.add_argument("--max_n", type=int, default=20_000)
...
assert n <= max_n
```
(It still makes sense to have argument defaults. But don't verify with them.)
As a rule, each constraint should be verified exactly once.

To avoid erros for numbers larger than 9999, do use underscores in python and bash, as in `10_000`, apostrophes in C++, etc. 
Use the correct decimal grouping seperators in your own natural language,
preferring thin space.
(This is includes English.)
In LaTeX source code, use `\,`, not `\thinspace`.
For powers of ten larger than \(9999\), use \(10^5\) instead of \(10\,000\).

Put problem-relevant numbers in LaTeX math mode. (Dates can remain in text mode.)
