#!/bin/bash
# based on https://github.com/w3ctag/promises-guide
set -e # Exit with nonzero exit code if anything fails
# based on https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -u # Undefined variable use error

# File Deploy
make html

# EOF
