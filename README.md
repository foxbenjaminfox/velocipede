# Velocipede

Cycle through enums and the like in vim with C-A/C-X.

Inspired by [vim-cycle](https://github.com/zef/vim-cycle), which unfortunately doesn't currently work with [vim-speeddating](https://github.com/tpope/vim-speeddating).

Add wordslists with the `:VelocipedeAdd` command.

<details>
<summary>Example</summary>

For cycling through CSS `position` values:

```vim
VelocipedeAdd static relative absolute fixed sticky
```
</details>

Other features:
- By default, `velocipede` allows cycling through `true`/`false`. You can add othre wordlists as appropriate.
- Velocipede does it's best to preserve the case of the words as you cycle through them.
  For instance, `true => false`, `True => False`, and `TRUE => FALSE`.
