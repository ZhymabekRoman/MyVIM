set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin on


let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

set noshowmode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'ajmwagar/vim-deus'
Plugin 'joshdick/onedark.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
"Plugin 'glepnir/oceanic-material'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'machakann/vim-highlightedyank'
Plugin 'Raimondi/delimitMate'
Plugin 'wakatime/vim-wakatime'
Plugin 'davidhalter/jedi-vim'
"Plugin 'neomake/neomake'
"Plugin 'sbdchd/neoformat'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'dense-analysis/ale'

call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
"colorscheme oceanic_material

colorscheme onedark
"colorscheme onehalfdark

" Ctrl-Left or Ctrl-Right to go to the previous or next tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Alt-Left or Alt-Right to move the current tab to the left or right
nnoremap <silent> <C-Down> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-Up> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

nmap <F6> :NERDTreeToggle<CR>

set whichwrap+=<,>,[,]
set nowrap

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" ale fix key binding
noremap <F9> :ALEFix <CR>

"let g:neoformat_enabled_python = ['autopep8', 'yapf', 'black']

" Enable alignment
"let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
"let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
"let g:neoformat_basic_format_trim = 1

hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" When writing a buffer (no delay).
"call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
" Enable flake8
"let g:neomake_python_enabled_makers = ['flake8']

"let g:neomake_warning_sign = {
""  \ 'text': 'W',
""  \ 'texthl': 'WarningMsg',
""  \ }
"let g:neomake_error_sign = {
""  \ 'text': 'E',
""  \ 'texthl': 'ErrorMsg',
""  \ }

" установить tab равным 4 пробелам
set ts=4

autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<F3>"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "1"

" disable autocompletion, because we use deoplete for completion
"let g:jedi#completions_enabled = 0

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

"let g:airline_theme='minimalist'
let g:airline_theme='onehalfdark'

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

" для закрытия вкладки мышью (мышью!?)
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

" vim markdown plugin options - https://github.com/plasticboy/vim-markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_folding_disabled = 1

