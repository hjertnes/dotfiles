# dotfiles

Archived 2020 fish, zsh, git and tmux configs plus a 2023 software inventory for Eivind's macOS setup -- no application code, so there is no build, test or lint suite.

## Build & Test

Nothing here is built or installed from. Per `Specification.md` the authoritative Brewfile lives in the sibling `BrewBundle` project, and installs run from there:

```bash
brew bundle --file=../BrewBundle/Brewfile          # install everything declared
brew bundle check --file=../BrewBundle/Brewfile    # report whether every entry is installed
fish --no-execute Old/fish/functions/trash.fish    # parse-check an edited fish file without running it
```

## Architecture

Nothing reads from this repo in place. To restore a config, it has to be copied into position by hand. The configs date from 2020 and were moved into `Old/` on 2023-11-21.

| Path | Purpose |
| --- | --- |
| `Apps.txt` | 115-line raw listing of `/Applications`, including folders and a temporary `(A Document Being Saved By Sparkle)` entry. Committed once, 2023-11-21. |
| `Brews` | The 27 `brew` names from `Old/Brewfile`, in the same order, added in the same 2023-11-21 commit (`clojure/tools/clojure` is tap-qualified). It has no taps, casks or `mas` entries. Nothing reads it. |
| `Specification.md` | Prose statement of the repo's purpose. The changelog at the bottom has one entry (2026-04-18). |
| `Old/Brewfile` | 81 lines: 4 taps, 27 brews, 6 casks, 44 `mas` apps. Added 2023-11-21 and moved here unchanged on 2026-08-17 after it diverged from `BrewBundle/Brewfile`. Kept for history, not as an install source. |
| `Old/README.org` | Says there is no linking script and configs are copied over by hand. The fish config differs a little between a MacBook and a ThinkPad. The Emacs config is the separate hjertnes/emacs.d repo. |
| `Old/fish/` | fisher 3.2.10 tree for `~/.config/fish`: a 5-line `config.fish` (Go paths, `PATH`, `EDITOR`, `emacs` alias), `fishfile` (5 plugins), `fish_variables`, and the plugin files fisher copied into `functions/`, `conf.d/`, `completions/`. |
| `Old/zshrc` | oh-my-zsh (`dracula-pro` theme; git/z/fzf/wakatime plugins) plus aliases. |
| `Old/gitconfig` | git-lfs filter, user identity, leftover `magithub` (Emacs) settings. |
| `Old/tmux.conf` | Mouse on, windows numbered from 1, tpm with tmux-sensible, dracula/tmux, tmux-yank, tmux-open. |
| `Old/tmux-session.yaml` | tmuxp session `main` (`session_name`/`window_name` keys -- not tmuxinator). Windows: home, `htop`, a `bookmarking` window (`~/go/src/bookmarking`, tails of `/tmp/bookmarking*.log`, `~/Code/bookmarking-app`), and windows that `cd` into other `~/Code/*` repos. |

## Key Details

- Standalone repo (`git@github.com:hjertnes/dotfiles.git`) living inside `Code/`, which is a collection of independent repositories, not a monorepo. See the parent `Code/CLAUDE.md` for the project index. There is no parent build to run.
- Almost everything in `Old/fish/functions/` is plugin code that fisher copied in from `fishfile`, not hand-written code:
  - `__fzf*` from jethrokuan/fzf and `__z*` from jethrokuan/z.
  - `_pure_*` plus `fish_prompt`/`fish_title` from pure 2.5.2 (rafaelrinaldi/pure).
  - `fuck` from RubieV/plugin-fuck. It reruns the last command with `sudo` and is not thefuck.
  - The macOS helpers `trash`, `ql`, `pfd`, `pfs`, `cdf`, `pushdf`, `showhidden`, `flushdns`, `manp`, `updatedb`, `itunes` from oh-my-fish/plugin-osx.
- `trash.fish` is the only file in `Old/fish/` changed since the 2020 import. Its 2026-08-27 fix: if the name is already taken in `~/.Trash`, it appends the epoch, then a counter. Every move uses `mv -n`, so an earlier trashed file is never overwritten.
- Running a bare `fisher`, `fisher add` or `fisher rm` re-fetches every package in `fishfile` and copies its files over the local ones. That replaces the `trash.fish` fix with the upstream copy. fisher 4+ reads `fish_plugins`, not `fishfile`.
- `Old/fish/config.fish` and `Old/zshrc` hardcode the Intel Homebrew prefix (`/usr/local/bin`, `GOROOT=/usr/local/opt/go/libexec`). Apple Silicon Homebrew lives in `/opt/homebrew`. If `GOROOT` points at a missing directory, `go` exits with "cannot find GOROOT directory". Both files set `GOPATH=~/.go`.
- `Old/zshrc` builds `PATH` on line 1, before `GOPATH`/`GOROOT` are set on lines 8-9, so a fresh shell gets `/bin` in place of the Go bin directories. `Old/fish/config.fish` line 3 lists `$PATH` twice, so every inherited entry appears twice.
- `Old/zshrc` also aliases `brew cask upgrade`, which Homebrew no longer has. It hardcodes `/Users/hjertnes` for oh-my-zsh and for a `bit` completion binary in `~/.go/bin`.
- `Old/fish/fish_variables` is fish's universal-variable store: colors, pure/fzf/z settings, and z paths under `/Users/hjertnes`. Copying it over an existing one replaces every universal variable.
- `Old/gitconfig` sets `filter.lfs.required = true`, so without git-lfs installed git errors on any LFS-tracked file.
- Both archived shells set `EDITOR=emacsclient` and alias `emacs` to `emacsclient -n`, so both need an Emacs server running.
- These configs use Emacs, tmux, tmuxp, htop and git-lfs, and none of them appears in `Old/Brewfile` or `Apps.txt`.
- `Old/tmux.conf` must live at `~/.tmux.conf`, because its `C-b r` reload binding sources that path. It also needs tpm cloned to `~/.tmux/plugins/tpm`.
- There is no `.gitignore`. A `.DS_Store` at the root was tracked from the first commit until 2023-11-21.
- Use the Fish shell for any scripting.
