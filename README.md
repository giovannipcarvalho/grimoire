grimoire
========

Plain text bookmarks.

## Commands

- `grim /pattern/`: find entries
- `grim luck`: fetch a random entry
- `grim tags`: list tags and occurrences
- `grim count`: count number of entries
- `grim unread`: list unread entries

`grim` accepts an optional file, or defaults to `~/bookmarks.txt`.
Alternatively, `grim` reads from `stdin` if used in a pipe.


## File format

Whatever you want, paragraph-separated.

```
:url https://example.com

:url https://google.com
```

The attributes preceding the value or the `:` preceding the attribute name are entirely optional, but make grepping easier.

Adding more attributes as metadata is also probably a good idea.

For instance, the example file [./bookmarks.txt](./bookmarks.txt) includes:
- `:title`
- `:url`
- `:ts` (timestamp)
- `:tags`
- `:comment`

The commands in the [Usage](#usage) section assume the structure above.


## Installation

```bash
# clone into ~/.local/src and symlink to ~/.local/bin/grim
mkdir -p ~/.local/src && cd $_
git clone https://github.com/giovannipcarvalho/grimoire
mkdir -p ~/.local/bin && ln -s ~/.local/src/grimoire/bin/grim $_
```

Make sure it is locatable:
```console
$ which grim
/home/giovanni/.local/bin/grim
```

You may need to add `~/.local/bin` to your `PATH`,
though it [should be there by default](https://sources.debian.org/src/bash/5.2.15-2/debian/skel.profile/#L24-L27)
if you're using bash on Debian and the path exists.


## Usage

```bash
# grim /pattern/
# ==============

# list entries matching 'foo' (defaults to ~/bookmarks.txt)
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


# grim count
# ==========

# count entries
$ grim count

# filter entries, then count
$ grim /foo/ | grim count


# grim unread
# ===========

# list unread entries
$ grim unread

# pick random unread entry
$ grim unread | grim luck
```

# TODO

- [ ] `grim add` command
