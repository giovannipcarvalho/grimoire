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
#
# 5. piping through itself
# ./q /foo/ | ./q /bar/

pattern="${1:-true}"

if [ -t 0 ]; then
    # stdin is a terminal, so fallback to file
    file="${2:-bookmarks.txt}"
    exec < "$file"
fi

# stdin is piped in, just read from it
perl -00 -ne "print if $pattern"
