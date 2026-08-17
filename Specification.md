# dotfiles

A collection of system configuration files and software inventory for setting up a macOS development environment.

## Configuration Files

- **Apps.txt**: An inventory listing of installed macOS applications.
- The authoritative Brewfile lives in the sibling `BrewBundle` project; the copy here diverged and is archived in `Old/`.

## Archived Configurations (Old/)

- Brewfile (superseded by `BrewBundle/Brewfile`)
- Fish shell configuration
- Git configuration
- Tmux configuration and session layout
- Zsh configuration

## Purpose

- Serves as a record of the desired software setup for a macOS machine.
- The Brewfile enables reproducible installation of command-line tools and applications via `brew bundle`.
- Apps.txt provides a reference list of installed GUI applications.

## Changelog

- 2026-04-18: Initial specification created from existing codebase
