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

### Searching for regex `/pattern/`s

#### Find entries matching a pattern

```console
$ grim /foo/
```

#### Search a specific file

```console
$ grim /foo/ archive.txt
```

#### Find entries tagged with `book`

```console
$ grim '/:tags.*\bbook\b/'
```

#### Find entries tagged with `book`, but not tagged with `history`

```console
$ grim '/:tags.*\bbook\b/ && !/:tags.*\bhistory\b/'
:title Neuromancer
:url https://www.goodreads.com/book/show/22328.Neuromancer
:ts 2025-06-09 16:12:05
:tags book sci-fi cyberpunk
:comment William Gibson's groundbreaking novel that defined cyberpunk
```

#### Piping `grim` through itself

```console
$ grim /sci-fi/ | grim /tv/
:title The Expanse
:url https://www.imdb.com/title/tt3552222/
:ts 2025-06-09 15:45:22
:tags tv sci-fi drama
:comment realistic space politics and physics in a colonized solar system
```

### Random picks

#### Get a random entry

```console
$ grim luck
```

#### Get a random entry from a specific file

```console
$ grim luck archive.txt
```

#### Filtered random pick

```console
$ grim '/:tags.*\bbook\b/' | grim luck
```

### Tags

#### List tags and their counts

```console
$ grim tags
      3 sci-fi
      2 movie
      2 book
      1 tv
      1 non-fiction
      1 history
      1 fantasy
      1 epic
      1 drama
      1 cyberpunk
      1 comedy
```

#### List tags from a specific file

```console
$ grim tags archive.txt
```

#### Filter entries and list tags

```console
$ grim '/:tags.*\bbook\b/' | grim tags
      2 book
      1 sci-fi
      1 non-fiction
      1 history
      1 cyberpunk
```

### Count

#### Count total entries

```console
$ grim count
5
```

#### Filter and count entries

```console
$ grim /movie/ | grim count
2
```

### Unread

#### List unread entries

By default, entries not tagged with `archive` are considered unread.

```console
$ grim unread
```

#### Count unread entries

```console
$ grim unread | grim count
5
```

#### Pick a random unread entry

```console
$ grim unread | grim luck
```

## Bookmarklet

To easily copy the current page title and URL for pasting in your bookmark file.

Create a new bookmark and name it `grim-copy`, with the following URL:

```javascript
javascript:(() => {
    const ts = new Date().toISOString().replace('T', ' ').slice(0, 19);
    const out = `:title ${document.title}\n:url ${location.href}\n:ts ${ts}\n:tags\n:comment`;
    navigator.clipboard.writeText(out);
})();
```

## TODO

- [ ] `grim add` command
