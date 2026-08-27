# dotfiles

Declarative software inventory and archived shell configuration for Eivind's macOS development environment -- no application code, so there is no build, test, or lint suite.

## Build & Test

This repository holds no Brewfile. The authoritative one lives in the sibling `BrewBundle` project, and installs are driven from there:

```bash
brew bundle --file=../BrewBundle/Brewfile          # install everything declared
brew bundle check --file=../BrewBundle/Brewfile    # is every entry installed?
```

`Old/Brewfile` is an 81-line snapshot last updated 2023-11-21 and archived 2026-08-17. It has diverged from `BrewBundle/Brewfile` -- kept for history, not for installing.

## Architecture

Every file is a manifest, a snapshot, or an archived config. `brew bundle` is the only tool that consumes anything here, and it reads from outside this repo.

| Path | Purpose |
| --- | --- |
| `Brews` | 27 formula names, one per line (including the tap-qualified `clojure/tools/clojure`), no casks or mas entries. Hand-maintained, consumed by nothing, and not the manifest -- `BrewBundle/Brewfile` is. |
| `Apps.txt` | 115-line snapshot of `/Applications`. Reference only. |
| `Specification.md` | Prose statement of the repo's purpose, with a dated changelog at the bottom. |
| `Old/` | Archived legacy configs plus the superseded `Brewfile`, copied into place by hand -- per `Old/README.org` there is no linking script. |

`Old/` holds a complete `fish/` tree (`config.fish`, `conf.d/`, `functions/`, `completions/`, `fish_variables`, and a `fishfile` naming the fisher plugins jethrokuan/fzf, oh-my-fish/plugin-osx, jethrokuan/z, RubieV/plugin-fuck, rafaelrinaldi/pure -- whose files are vendored into those directories), plus standalone `gitconfig`, `zshrc` (oh-my-zsh, `dracula-pro` theme, plugins git/z/fzf/wakatime), `tmux.conf` (tpm with tmux-sensible/dracula/yank/open), and `tmux-session.yaml` (a tmuxinator layout over `~/Code/*` project directories).

## Key Details

- Standalone repo (`git@github.com:hjertnes/dotfiles.git`) living inside `Code/`, which is a collection of independent repositories, not a monorepo; see the parent `Code/CLAUDE.md` for the project index. There is no parent build to run.
- All 81 files are tracked and the tree is clean; there is no `.gitignore`.
- `Apps.txt` and `Brews` were both last committed 2023-11-21 and have drifted from the real system. Reference only.
- `Old/fish/config.fish` and `Old/zshrc` hardcode the Intel Homebrew prefix (`/usr/local/bin`, `/usr/local/opt/go/libexec`); Apple Silicon needs `/opt/homebrew` paths.
- `Old/gitconfig` sets `filter.lfs.required = true`; installing it on a machine without git-lfs breaks git. It also carries dead `magithub` settings.
- `Old/zshrc` still aliases `brew cask upgrade`, a command modern Homebrew no longer accepts.
- Both archived shells set `EDITOR=emacsclient` and alias `emacs`; the emacs config is a separate repo (hjertnes/emacs.d).
- Use the Fish shell for any scripting.
