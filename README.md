Guide to Setup My dev and other environments

# Install Brew

Website: https://brew.sh/

# Brew Packages

## Installation

```bash
cat brewList/formulae.txt | xargs brew install --formulae
cat brewList/casks.txt | xargs brew install --casks
```

## Backing Up

```bash
brew list -1 --casks > brewList/casks.txt
brew list --formulae -1 --installed-on-request > brewList/formulae.txt
```

# VS Code

## Listing Extensions

```bash
code --list-extensions > vscode/extensions.txt
```

## Installing extensions

```bash
xargs -n 1 code --install-extension < vscode/extensions.txt
```

## Copying Settings

```bash
cp /Users/manan/Library/Application\ Support/Code/User/settings.json ./vscode
```

# Terminal Settings

## ZSH

```bash
cp ~/.zshrc ./configs
```

## WezTerm

```bash
cp ~/.wezterm.lua ./configs
```

# Fonts

1. Monolisa - fonts folder
   1.1 For VS Code and Terminal
2. Cascadia Code - brew
   2.1 For VS Code and Terminal
3. Nunito - brew
   3.1 For Obsidian
