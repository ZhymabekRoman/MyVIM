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
Plugin 'dominikduda/vim_current_word'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'machakann/vim-highlightedyank'
Plugin 'Raimondi/delimitMate'
Plugin 'wakatime/vim-wakatime'
"Plugin 'davidhalter/jedi-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'dense-analysis/ale'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
"colorscheme oceanic_material

colorscheme onedark
"colorscheme onehalfdark

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

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
let b:ale_linters = ['flake8', 'pylint', 'golint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --ignore E501'
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_go_golint_executable = '/data/sdext2/data/com.termux/files/home/go/bin/golint'

" ale fix key binding
noremap <F9> :ALEFix <CR>

hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" установить tab равным 4 пробелам
set ts=4

"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#completions_command = "<F3>"
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = "1"

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

" vim markdown plugin options - https://github.com/plasticboy/vim-markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_folding_disabled = 1

hi CurrentWordTwins ctermfg=4 cterm=underline
let g:vim_current_word#highlight_current_word = 0
autocmd BufAdd NERD_tree_*,*.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1
let g:vim_current_word#disabled_by_insert_mode = 0

" Make trailing whitespace be flagged as bad.
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

set list
