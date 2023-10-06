#lint.py 

import sys

from pylint import lint

THRESHOLD = 4

run = lint.Run(["factorial.py"])

score = run.linter.stats["global_note"]

if score < THRESHOLD:

    print("Linter failed: Score < threshold value")

    sys.exit(1)


sys.exit(0)
