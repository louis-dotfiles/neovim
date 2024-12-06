# Notes

Signs are contained in extmarks since neovim 0.10.0

Be mindful of:
- The line the statuscolumn function wants to draw, which isn't necessarily in your "current buffer".
- "Current buffer" probably means the buffer where your cursor is.
- The function will be called once for each line for each buffer on screen. You
  should think about caching expensive function calls whenever possible. e.g.
  If the buffer hasn't changed then there is no reason for the git and LSP signs
  to have changed.
- Some vim options are globally scoped, others window scoped, and others buffer scoped.
  Make sure to get the `vim.wo[win_id].number` option for example. Or by
  default `vim.wo` will be `vim.wo[0]`. And as explained earlier, the "current
  buffer" is not always what you want (it rarely is for statuscolumn).

# Design

`changedtick` allows us to cache some results: e.g. we get all signs for the
buffer and cache the signs based on the changedtick. This way we don't need to
fetch those again for the next lines in this same buffer.

However `changedtick` is NOT a good way to detect when the cache should be
invalidated. Because gitsigns and diagnostics take some time to come in, so we
draw the statuscolumn before the updated signs come in.

The better way is to wait for the respective "changed" events for each "source"
to come in and switch a flag allowing the statuscolumn function to fetch more.

# TODOs

- [ ] When opening the same buffer in two windows, the line numbers behave strangely.
- [ ] Keep diagnostic symbols in insert mode (but don't fetch updates).
- [ ] Get rid of the last extra call.

