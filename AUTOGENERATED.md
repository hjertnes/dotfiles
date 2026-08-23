# dotfiles

Declarative software inventory and archived shell configuration for setting up Eivind's macOS development environment -- no application code, so there is no build, test, or lint suite.

## Build & Test

This repository holds no Brewfile to install from. The authoritative one lives in the sibling `BrewBundle` project, and that is where installs are driven from:

```bash
brew bundle --file=../BrewBundle/Brewfile          # install everything declared
brew bundle check --file=../BrewBundle/Brewfile    # is every entry installed?
```

`Old/Brewfile` is an 81-line snapshot last updated 2023-11-21 and archived 2026-08-17. It has diverged from `BrewBundle/Brewfile` -- kept for history, not for installing.

## Architecture

Every file is a manifest, a snapshot, or an archived config; `brew bundle` is the only tool that consumes anything, and it reads from outside this repo.

| Path | Purpose |
| --- | --- |
| `Brews` | 27 formula names, one per line, no taps/casks/mas. Hand-maintained, consumed by nothing, and not the manifest -- `BrewBundle/Brewfile` is. |
| `Apps.txt` | 115-line snapshot of `/Applications`. Reference only. |
| `Specification.md` | Prose statement of the repo's purpose, with a dated changelog at the bottom. |
| `Old/` | Archived legacy configs plus the superseded `Brewfile`, copied into place by hand -- per `Old/README.org` there is no linking script. |

`Old/` holds a complete `fish/` tree (`config.fish`, `conf.d/`, `functions/`, `completions/`, `fish_variables`, and a `fishfile` naming the fisher plugins jethrokuan/fzf, oh-my-fish/plugin-osx, jethrokuan/z, RubieV/plugin-fuck, rafaelrinaldi/pure -- whose files are vendored into those directories), plus standalone `gitconfig`, `zshrc` (oh-my-zsh, `dracula-pro` theme, plugins git/z/fzf/wakatime), `tmux.conf` (tpm plugins, dracula theme), and `tmux-session.yaml` (a tmuxinator layout over `~/Code/*` project directories).

## Key Details

- Standalone repo (`git@github.com:hjertnes/dotfiles.git`) living inside `Code/`; see the parent `Code/CLAUDE.md` for the project index. There is no parent build to run.
- Everything in the tree is tracked and committed; there is no `.gitignore`.
- `Apps.txt` and `Brews` were both last touched 2023-11-21 and have drifted from the real system. Reference only.
- `Old/fish/config.fish` and `Old/zshrc` hardcode the Intel Homebrew prefix (`/usr/local/bin`, `/usr/local/opt/go/libexec`); Apple Silicon needs `/opt/homebrew` paths.
- `Old/gitconfig` sets `filter.lfs.required = true`; installing that config on a machine without git-lfs breaks git.
- `Old/zshrc` still aliases `brew cask upgrade`, a command modern Homebrew no longer accepts.
- Both archived shells set `EDITOR=emacsclient` and alias `emacs`; the emacs config is a separate repo (hjertnes/emacs.d).
- Use the Fish shell for any scripting.
