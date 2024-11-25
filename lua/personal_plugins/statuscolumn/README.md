# Notes

Signs are contained in extmarks since neovim 0.10.0

Be mindful of:
- The line the statuscolumn wants to draw, which isn't necessarily in your "current buffer"
- "Current buffer" probably means the buffer where your cursor is.
- The function will be called once for each line for each buffer on screen. You
  should think about caching expensive function whenever possible. e.g. If the
  buffer hasn't changed then there is no reason for the git and LSP signs to have
  changed.


# Design

`changedtick` allows us to cache some results: e.g. we get all signs for the
buffer and cache the sigsn absed on the changedtick. This way we don't need to
fetch those again for the next lines in this same buffer.

However `changedtick` is NOT a good way to detect when the cache should be
invalidated. Because gitsigns and diagnostics take some time to come in, and we
almost systematically get oudated signs.

The better way is to wait for the respective events to come in and switch a flag.

# TODOs

- [ ] When opening the same buffer in two windows, the line numbers behave strangely.
- [ ] Keep diagnostic symbols in insert mode (but don't fetch updates).
- [ ] Get rid of the last extra call.

