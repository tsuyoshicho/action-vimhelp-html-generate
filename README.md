# GitHub Action: Run vim help html generator

## action-vimhelp-html-generate

Generate html from Vim help (/doc)

## Inputs

### `FOLDER`

**Optional**. generate html store folder

```
default value: "build"
```

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
        uses: actions/checkout@master
      - name: generate html
        uses: tsuyoshicho/action-vimhelp-html-generate@master
        env:
          FOLDER: build
      - name: deploy gh-pages
        uses: JamesIves/github-pages-deploy-action@master
        env:
          ACCESS_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          BASE_BRANCH: master
          BRANCH: gh-pages
          FOLDER: build
```

## Special thanks.

- [thinca's vim docker image](https://hub.docker.com/r/thinca/vim)
- [vim-jp vimdoc-jp help](https://github.com/vim-jp/vimdoc-ja)
