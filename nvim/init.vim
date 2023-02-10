" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'rktjmp/lush.nvim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'wfxr/minimap.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/vimux'
call plug#end()

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

if has("autocmd")
    filetype indent plugin on
endif

set statusline=
set statusline+=%{FugitiveStatusline()}
let g:VimuxUseNearest = 0
" dbt integration
function! OpenDbtCompiled()
    call ExecuteDbtCommand("compile")
    let model_path = bufname()
    let project_name = substitute(split(getcwd(), "/")[-1], "-", "_", "")
    let compiled_model_path = "/tmp/target/compiled/" . project_name . "/" . model_path
    execute 'edit' compiled_model_path
endfunction

function! ExecuteDbtCommand(command)
    :w
    let buf = bufname()
    let model = split(split(buf, "/")[-1], '\.')[0]
    let dbt_command = "dbt " . a:command . " -s " . model
    VimuxRunCommand(dbt_command)
endfunction

map <Leader>dbtc :call OpenDbtCompile()<CR>
map <Leader>dbtr :call ExecuteDbtCommand("run")<CR>
map <Leader>dbtt :call ExecuteDbtCommand("test")<CR>

map <silent> <C-n> :NERDTreeToggle<CR>

"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1

let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=10 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection

inoremap jh <Esc>

" autocmd VimEnter * NERDTree | wincmd p
set splitbelow
set splitright
set background=dark " or light if you want light mode
colorscheme gruvbox

syntax on                   " syntax highlighting
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like ta completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
highlight cursorline ctermfg=blue
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set nowrap
highlight VertSplit cterm=NONE

set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
    autocmd BufLeave,FocusLost, InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END    

" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.b
