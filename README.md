# Elmlint

A linter for Elm for use with NeoMake.

## Installation

First install the gem:

```sh
gem install elmlint
```

Make sure you have NeoMake installed (using VimPlug):

  Add NeoMake to your `.vimrc`:

    ```viml
    Plug 'neomake/neomake'
    ```

  Run `:PlugInstall`


Add the following to your `.vimrc`:

```viml
let g:neomake_elm_elm_lint_maker = {
      \ 'exe': 'elmlint',
      \ 'errorformat': '%f:%l:%c [%t] %m'
      \ }
let g:neomake_elm_enabled_makers = ['elm_lint']
```

# Compatibility
ElmLint was tested with elm-make 0.18 (Elm Platform 0.18.0) and the latest
NeoMake as of 03/11/2017.

# Credits
The code for ElmLint is based on the elm-lint-script repo by Rohan Orton:
https://github.com/rohanorton/elm-lint-script I simply refactored it a bit and
packaged it as a gem. It uses elm-make with the warning flag to produce the
output and do the actual linting.
