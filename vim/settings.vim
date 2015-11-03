let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
let maplocalleader='\'
let mapleader='\'
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>rt :!ctags -F `ack --ruby -f`<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>ff :FufCoverageFile<CR>
map <silent> <LocalLeader>o :FufCoverageFile<CR>
map <silent> <LocalLeader>ft :FufTag<CR>
map <silent> <LocalLeader>fb :FufBuffer<CR>
map <silent> <LocalLeader>fr :FufRenewCache<CR>
map <silent> <LocalLeader>fv :vsplit<CR>:FufCoverageFile<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>ss :SSave<CR>
map <silent> <LocalLeader>sl :SLoad<CR>
map <silent> <LocalLeader>sd :SDelete<CR>
map <silent> <LocalLeader>gp :Gist --private<CR>
map <silent> <LocalLeader>ga :Gist -m --private<CR>

set hlsearch
set number
set showmatch
set incsearch
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set foldmethod=syntax
set foldlevelstart=20
set foldcolumn=4
set ignorecase
set smartcase

Bundle 'mhinz/vim-startify'
Bundle 'Lokaltog/vim-powerline'
Bundle 'lunaru/vim-less'
Bundle 'tommcdo/vim-lion'
Bundle 'elixir-lang/vim-elixir'


"ws -- white space: removes all trailing whitespace from a file
map <silent> <LocalLeader>ws :%s/\s\+$//<CR>

"fl -- format line: expands a single line of parameters into multiple lines
map <silent> <LocalLeader>fl :s/\([;,{]\) */\1\r  /g<CR>:s/  }/}/g<CR>:nohls<CR>


" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=white guibg=white

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" Enable PowerLine
let g:Powerline_symbols = 'fancy'
set guifont=Anonymous\ for\ Powerline\ Medium\ 12

" VIM Split Enhancements
nnoremap <M-Right> <C-W>l
nnoremap <M-Left> <C-W>h
nnoremap <M-Down> <C-W>j
nnoremap <M-Up> <C-W>k

"Git related stuff:
au FileType gitcommit set tw=72


syntax enable
colorscheme monokai



hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment


" ag 
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

map <silent> <Leader>cl      :set                  cursorline! <CR>
imap <silent> <Leader>cl <Esc>:set                  cursorline! <CR>a
map <silent> <Leader>cc      :set   cursorcolumn!              <CR>
imap <silent> <Leader>cc <Esc>:set   cursorcolumn!              <CR>a
map <silent> <Leader>ct      :set   cursorcolumn!  cursorline! <CR>
imap <silent> <Leader>ct <Esc>:set   cursorcolumn!  cursorline! <CR>a
map <silent> <Leader>co      :set   cursorcolumn   cursorline  <CR>
imap <silent> <Leader>co <Esc>:set   cursorcolumn   cursorline  <CR>a
map <silent> <Leader>cn      :set nocursorcolumn nocursorline  <CR>
imap <silent> <Leader>cn <Esc>:set nocursorcolumn nocursorline  <CR>a

filetype plugin on
