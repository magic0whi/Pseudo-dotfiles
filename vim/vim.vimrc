augroup MyColors
  autocmd!
  autocmd vimenter * ++nested colorscheme gruvbox
  autocmd ColorScheme * highlight SpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
augroup END
set background=dark " Setting dark mode

"This fix colorcheme don't work in tmux
"set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
 set termguicolors
endif

"Settings Begin
set nocompatible
set showcmd "Show the pending operator on status line
set completeopt=longest,menuone "Don't select the first completion, just show the current common match before the cursor
set hlsearch
set incsearch
set ignorecase smartcase "Case sentitive if search pattern contains at least one uppercase character
set relativenumber number
set grepprg=rg\ --vimgrep\ --smart-case\ --follow "Replace Grep with Rg
"Persistent Undo, make sure that the undodir exists.
set undodir=~/.vim/undo_dir
set undofile
"Make alphabetical character can be increment by Ctrl+A, Ctrl+X
set nrformats+=alpha
"set hidden "Disable vim's save prompt when switching buffers

set expandtab "Use soft tab
set autoindent
set smartindent "Smart indent react to the syntax of the code

setlocal spell
set spelllang=en_us,cjk "Current for cjk Vim is just ignore spell check for these characters

"Disable mouse
set mouse=
set ttymouse=
"Settings End

filetype plugin on "For netrw

"Key Binding Begin
"----Normal Mode Binding Begin
"Press <Esc> twice to turn off search highlight
nnoremap <Esc><Esc> :noh<CR><Esc>

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

"Press <F5> to toggle undo history
nnoremap <F5> :MundoToggle<CR>

"Disable arrow button in normal mode
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"----Normal Mode Binding End

"Auto adding undo breaks when press Ctrl-W and Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"Set spell correcting key, jump to the prev spell mistake '[s', pick first
"suggestion '1z=', then jump back ']a', add a undo break.
inoremap <c-l> <c-g>u<esc>[s1z=`]a<c-g>u

"----Plugin Binding Begin
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

"Start interactive EasyAlign for a motion / text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"----Plugin Binding End
"Key binding End

"Let hardtime run default
"let g:hardtime_default_on = 1

set tabstop=4
set shiftwidth=4

call plug#begin()
Plug 'takac/vim-hardtime' "Kick bad habits
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/vim-peekaboo' "Peek Registers
Plug 'simnalamburt/vim-mundo' "Undo Trees
Plug 'ludovicchabant/vim-gutentags' "Automation Tags generation
"Plug 'sheerun/vim-polyglot' "Language highlight
Plug 'tpope/vim-fugitive' "GIT
Plug 'lervag/vimtex' "TeX
Plug 'sirver/ultisnips' "Snippets Engine
Plug 'honza/vim-snippets' "Snippets Collection
"Plug 'ycm-core/YouCompleteMe' "Completion
Plug 'morhetz/gruvbox' "Theme
call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1 "Auto make $ or \[ invisible in TeX
let g:vim_markdown_conceal_code_blocks = 0 "But disable the code fences coneal
let g:tex_conceal='abdmg'

"UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

"YCM Dont make it interfere with UltiSnips' key
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']

