# vim-svelte 

Vim syntax highlighting for [svelte](https://svelte.dev/).

This was initially forked from
[posva/vim-vue](https://github.com/posva/vim-vue).

## Installation

### Install with [Vundle](https://github.com/VundleVim/Vundle.vim)

```viml
Plugin 'burner/vim-svelte'
```

### Install with [Plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'burner/vim-svelte'
```

### Install with [Pathogen](https://github.com/tpope/vim-pathogen)

```bash
cd ~/.vim/bundle && \
git clone https://github.com/burner/vim-svelte.git
```

### Install without a plugin manager (Vim 8)

```bash
git clone https://github.com/burner/vim-svelte.git ~/.vim/pack/plugins/start/vim-svelte
```

## Contributing

If your language is not getting highlighted open an issue or a PR with the fix.
You only need to add a line to the `syntax/svelte.vim` file.

Don't forget to write [Vader](https://github.com/junegunn/vader.vim) tests for
the code you write. You can run the tests by executing `make test` in the
terminal.
