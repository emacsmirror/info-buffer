# Info Buffer

Interactive command (*info-buffer*) to display each info topic on its separate
buffer.  With prefix, display an already opened topic on a new buffer.

Emacs's default *info* command, when used interactively, always reuses the same
buffer, which makes it uncomfortable to have multiple open topics at the same
time.


## Quickstart

If you're using [use-package](https://github.com/jwiegley/use-package), you can
easily re-define Emacs's info binding to use *info-buffer* instead:

```emacs
(use-package info-buffer
  :bind (("C-h i" . info-buffer)))

```
