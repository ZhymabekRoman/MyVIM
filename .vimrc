set nocompatible              " be iMproved, required
filetype off                  " required

set whichwrap+=<,>,[,]

let g:pymode_lint_ignore = "E501,W"
let g:pymode_options_max_line_length=0
let g:pymode_lint = 1
let g:pymode_lint_on_fly = 1

" установить tab равным 4 пробелам
set ts=4

let g:jedi#show_call_signatures = "1"

" выделять строку, на которой находится курсор
set cursorline

" отступ при переходе на следующую строку при написании кода
set autoindent

" преобразование tab-ов в пробелы
set expandtab

set nu " нумерация строк
set encoding=utf-8
let python_highlight_all=1
syntax on
" let g:syntastic_check_on_open = 1

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'

" solarized не входит в стандартную поставку, необходимо загрузить набор тем
let g:airline_theme='minimalist'

" использовать пропатченные шрифты
let g:airline_powerline_fonts = 0

" включить управление табами
let g:airline#extensions#tabline#enabled = 1

" всегда показывать tabline
let g:airline#extensions#tabline#tab_min_count = 0

"" такое же поведение, как и в sublime: если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'

" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0

" имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'

" убираем раздражающие ненужные красные панели с предупреждениями или ошибками. Предупреждения, как по мне, не нужны, поскольку ругаются даже на trailing-spaces и разные отступы: например табы и пробелы (привет от phpDoc). Для ошибок и так открывается дополнительное окно. Впрочем, вам решать.
" let g:airline_section_warning = ''
" let g:airline_section_error = ''

" убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 1

" убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''

" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0

" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1

" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Make trailing whitespace be flagged as bad.
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Raimondi/delimitMate'
Plugin 'wakatime/vim-wakatime'
Plugin 'davidhalter/jedi-vim'
" Plugin 'othree/vim-autocomplpop'
" Plugin 'vim-scripts/L9'
Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

