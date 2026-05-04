# zsh-pacman-command-not-found 
A Zsh plugin that suggests Pacman packages for missing commands, inspired by Fedora's `PackageKit-command-not-found` handler.
## Preview

<img src="./assets/preview.png" alt="Screenshot" />

## Dependencies
Before installing, make sure `pkgfile` is installed and its database is populated:
```sh
sudo pacman -S pkgfile
sudo pkgfile --update
```

## Installation
If you don't use any plugin manager like [Zinit](https://github.com/zdharma-continuum/zinit), simply source the `zsh-pacman-command-not-found.plugin.zsh` file in your `.zshrc` configuration file:

**But if you do**, add `upslaught/zsh-pacman-command-not-found` prefixed by your plugin manager's command to load plugins, for example:
```sh
zinit load upslaught/zsh-pacman-command-not-found
```

## Filkoll
There is a faster alternative for `pkgfile` called [Filkoll](https://github.com/VorpalBlade/filkoll). However, the fuzzy matching can't be disabled, which is pretty frustrating.
In the future, I might consider forking it to omit fuzzy matching, and use it in this plugin
