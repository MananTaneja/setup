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
