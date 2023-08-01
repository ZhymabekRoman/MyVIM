# MyVIM
My VIM config files

```bash
# Exctract .vimrc file to home directory
curl https://raw.githubusercontent.com/ZhymabekRoman/MyVIM/main/.vimrc > ~/.vimrc

# Install coc.nvim plugins:
vim -c "CocInstall coc-jedi coc-html coc-css coc-sh coc-go coc-tabnine"

# Install Python linters and code fixers (Optional):
# TODO: migrate to ruff
pip3 install yapf pylint flake8 black autopep8
```
