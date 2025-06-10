grimoire
========

Plain text bookmarks.

## Commands

- `grim /pattern/`: find entries
- `grim luck`: fetch a random entry
- `grim tags`: list tags and occurrences

`grim` accepts an optional file, or defaults to `bookmarks.txt`.
Alternatively, `grim` reads from `stdin` if used in a pipe.


## Usage

```bash
# grim /pattern/
# ==============

# list entries matching 'foo' (defaults to bookmarks.txt)
$ grim /foo/

# list entries matching 'foo' in a different file
$ grim /foo/ archive.txt

# list entries with tag 'book'
$ grim '/:tags.*\bbook\b/'

# list entries with tag 'book' but not with tag 'history'
$ grim '/:tags.*\bbook\b/ && !/:tags.*\bhistory\b/'

# piping through itself
$ grim /foo/ | grim /bar/


# grim luck
# =========

# get a random entry
$ grim luck

# get random entry from a different file
$ grim luck archive.txt

# filter and get a random entry
$ grim '/:tags.*\bbook\b/' | grim luck


# grim tags
# =========

# list tags and counts
$ grim tags

# list tags in a different file
$ grim tags archive.txt

# filter entries and list tags
$ grim '/:tags.*\bbook\b/' | grim tags

```

# TODO

- [ ] `grim add` command
