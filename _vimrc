set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Make vim try to detect file types and load plugins for them
filetype plugin indent on

"Enable scripts
runtime macros/matchit.vim

"Enable and configure neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

"Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"Comment highlight feature

"Indentation rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent		" autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages

"Reload files changed outside vim
set autoread

"Encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

"Don't unload buffers when they are abandoned, instead stay in the background
set hidden

"Set unix line endings
set fileformat=unix
"When reading files try unix line endings then dos
set fileformats=unix,dos

"Save up to 100 marks, enable capital marks
set viminfo='100,f1

"gVim on startup
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
	set shortmess+=I   " remove startup text
	set columns=150    " resize window width
	set lines=40       " resize window height
end

"Remove the .ext~ and .un~ files, but not the swapfiles
set writebackup nobackup noswapfile noundofile

"Keep the cursor visible within 3 lines when scrolling
set scrolloff=3

"Search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
"Use ESC to remove search higlight
nnoremap <Esc> :noh<Return><Esc>

"Suggestion for normal mode commands
set wildmode=list:longest

"Disables wordwrap, sets number lines
set nowrap number

"Sets working directory to the current file
set autochdir

"Set Adobe's Source Code Pro font as default
set guifont=Source_Code_Pro:h11:cANSI




"Colour scheme!
colo tomorrow-night

"Normal mode from Insert mode 
inoremap jk <Esc>

"Remaps Append and Insert to make more sense on a keyboard
noremap h a
noremap H A
noremap a i
noremap A I

"Remaps movement keys & w/ Shift modifier
noremap i <Up>
noremap j <Left>
noremap k <Down>
noremap l <Right>

nmap J 3j
nmap L 3l
nmap I 3i
nmap K 3k

"Enables Visual mode highlight selection
vnoremap <S-j> <S-Left
vnoremap <S-l> <S-Right>
vnoremap <S-i> <S-Up>
vnoremap <S-k> <S-Down>

"Horizontal word-by-word insert bar bumping
"Caution! pressing C-i will insert a tab
nnoremap <C-j> <C-Left>
nnoremap <C-l> <C-Right>
nnoremap <C-k> <Nop>

"Allow Tab and Shift+Tab for forward and backward bumping
"Visual mode will re-select previous selection after bumping
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <Esc><<<Insert>

"Control-backspace to delete whole words
inoremap <C-BS> <C-\><C-o>db

"Control-delete to delete to end of word
inoremap <C-Del> <C-o>dw

"Control-Shift-[backspace/delete] remove whole word
inoremap <C-S-BS> <Esc>dawi
inoremap <C-S-Del> <Esc>dawi

"Control-space for Vim's keyword autocomplete
"...in the terminal
inoremap <Nul> <C-n>
"...and in gui mode
inoremap <C-Space> <C-n>

"Tab management
nnoremap <C-n> :bro :tabnew 
"Alt+Shift+[</>]
nnoremap ¼ gT
nnoremap ¾ gt
inoremap ¼ <C-o>gT
inoremap ¾ <C-o>gt

"Shift blocks of code
"Alt+[</>]
nnoremap ¬ <%
nnoremap ® >%
inoremap ¬ <C-o><%
inoremap ® <C-o>>%
