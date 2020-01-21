# GitHub Action: Run vim help html generator

[![Docker Image CI](https://github.com/tsuyoshicho/action-vimhelp-html-generate/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/tsuyoshicho/action-vimhelp-html-generate/actions)
[![Release](https://github.com/tsuyoshicho/action-vimhelp-html-generate/workflows/release/badge.svg)](https://github.com/tsuyoshicho/action-vimhelp-html-generate/releases)

## action-vimhelp-html-generate

Generate html from Vim help (/doc)

## Inputs

### `FOLDER`

**Optional**. generate html store folder

default value: "build"

## Example usage

Set workflow into vim plugin.

### [.github/workflows/vimhelpdeploy.yml](.github/workflows/vimhelpdeploy.yml)

```yml
name: "deploy vim help to gh-pages"
on:
  push:
    branches:
      - master
jobs:
  ghpages:
    name: Convert and deploy vim help
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v1
      - name: generate html
        uses: tsuyoshicho/action-vimhelp-html-generate@v1
        env:
          FOLDER: build
      - name: deploy gh-pages
        uses: JamesIves/github-pages-deploy-action@releases/v2
        env:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          BRANCH: gh-pages
          FOLDER: build
```

## Special thanks

- [thinca's vim docker image](https://hub.docker.com/r/thinca/vim)
- [vim-jp vimdoc-jp help](https://github.com/vim-jp/vimdoc-ja)

## License

[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/)

vim-jp: vimdoc-ja-working's [discussion](https://github.com/vim-jp/vimdoc-ja-working/issues/733).
