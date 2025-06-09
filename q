#!/usr/bin/env bash
set -euo pipefail

# Filter bookmark file.
#
# Usage:
# ./q '/pattern/' [file]
#
# Examples:
#
# 1. list entries matching 'foo' (defaults to bookmarks.txt)
# ./q '/foo/'
#
# 2. list entries matching 'foo' in a different file
# ./q '/foo/' archive.txt
#
# 3. list entries with tag 'book'
# ./q '/:tags.*\bbook\b/'
#
# 4. list entries with tag 'book' but not with tag 'history'
# ./q '/:tags.*\bbook\b/ && !/:tags.*\bhistory\b/'

perl -00 -ne "print if ${1:-true}" "${2:-bookmarks.txt}"
