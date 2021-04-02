from os.path import expanduser
from shutil import copy

nvimdir = expanduser('~\AppData\Local\\nvim')
copy('.\\vim\.vimrc', nvimdir + '\init.vim')
copy('.\\nvim\coc-settings.json', nvimdir + '\coc-settings.json')
