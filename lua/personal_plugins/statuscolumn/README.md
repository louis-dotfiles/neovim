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


## Design


### Caching

Note: I need to run some kind of performance test to make sure the caching is actually saving time and resources.


`changedtick` allows us to cache some results: e.g. we get all signs for the
buffer and cache the signs based on the changedtick. This way we don't need to
fetch those again for the next lines in this same buffer.

However `changedtick` is NOT a good way to detect when the cache should be
invalidated. When you change the  buffer, the `changedtick` will increment, and
your signs will likely change. Because gitsigns and diagnostics take some time
to come in, Neovim will redraw the cursorline before the signs are updated.

The better way is to wait for the respective "changed" events for each "source"
to come in and switch a flag allowing the statuscolumn function to fetch the signs.


### Extmarks and namespaces

extmarks are namespaced, making "filtering" them easier, provided you have the
correct namespace. For gitsigns it's easy enough to find the namespace id
from the namespace name, because the name is stable. For LSPs however, they all
have a different name. So I chose to get all marks and filter them based on the
highlight group used.


## TODOs

- [ ] When opening the same buffer in two windows, the line numbers behave strangely.
- [ ] Keep diagnostic symbols in insert mode (but don't fetch updates).
- [ ] Get rid of the last extra call.

