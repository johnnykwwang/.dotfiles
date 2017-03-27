" source functions for later usage
if filereadable(expand("~/.vimrc.functions"))
  source ~/.dotfiles/.vimrc.functions
endif

" Leader key
let mapleader = " "

" True Leader key
nnoremap ; :
nnoremap : ;

set autoread

set backspace=2 " Backspace deletes like most programs in insert mode

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Soft Tab, 2 space
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list listchars=tab:»·,trail:·,nbsp:· " Show dots in white space when added
nnoremap <leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <leader>rt :retab

" Search HL
set hlsearch
" highlight WHITE_ON_RED ctermfg=7  ctermbg=1
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

set colorcolumn=81
" call matchadd('colorcolumn', '\%81v', 100)

" Numbers
set number
set numberwidth=5

" Layout related options
set showcmd
set ruler

" Fix god damn clipboard
" set clipboard=unnamed

" Fix NERDTree Tabs
let g:nerdtree_tabs_synchronize_view = 0

" Indent Guide Setting
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=23

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['standard']

nnoremap <Leader>ss :SyntasticCheck<CR>
nnoremap <silent> <Leader>sf :%! standard --fix<CR>
nnoremap <silent>]l :lnext<CR>
nnoremap <silent>[l :lprevious<CR>
nnoremap <silent>]L :llast<CR>
nnoremap <silent>[L :lfirst<CR>

" NERDTree
map <Leader>nn <plug>NERDTreeTabsToggle<CR>
map <Leader>nf <plug>NERDTreeFind<CR>

" Commentary
map <Leader>/ gcc

" Source vim
nnoremap <Leader>` :source ~/.vimrc<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Tab Management like chrome
" Consider no more <Leader>t since vim-test need it, and we can always :tabnew
nnoremap <Leader>y :tabnew<CR>
nnoremap <Leader>1 :tabfirst<CR>
nnoremap <Leader>9 :tablast<CR>
nnoremap <Leader>[ :tabprevious<CR>
nnoremap <Leader>] :tabnext<CR>
nnoremap <Leader>w :tabclose<CR>

" Git ( Fugitive.vim ) related stuff
nnoremap <leader>gs :Gstatus<CR>
set diffopt+=vertical " Make split always goes right

" Open cursor pointed file in new tab
nnoremap <Leader>gf :tab wincmd f<CR>

" vim-test mappings
let test#strategy = "vimux"
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Swim between last 2 file
nnoremap <leader><leader> <c-^>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" =====
" Theme and Airline
" =====
set laststatus=2 " let statusbar show when there's only one split
let g:airline_powerline_fonts=1
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.linenr = ''
" let g:airline_section_z=airline#section#create(['%3p%%:','linenr',':%3v'])
let g:airline_section_z='%3p%% %l/%L %c'
let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

" ========
" Syntax Highlight
" ========

" Highlight CUDA files as C++
autocmd BufRead,BufNewFile *.cu set filetype=cpp

" ========

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Source Plugins
if filereadable(expand("~/.dotfiles/.vimrc.bundles"))
  source ~/.dotfiles/.vimrc.bundles
endif

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
colorscheme gruvbox
" let g:solarized_termtrans = 1
let g:airline_theme='cool'
" let g:airline_symbols.linenr = ''
set termguicolors
set t_Co=256
" let g:gruvbox_contrast='soft'

" Some color settings that can't go before colorscheme
" highlight ColorColumn ctermbg=0
highlight WHITE_ON_RED ctermfg=7  ctermbg=1



set t_ut=
