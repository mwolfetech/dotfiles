" Include all plugins, in separate directories under .vim/bundle
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" large undo buffer?
set ut=2000

"I use a 256 color terminal
set t_Co=256

"Default ctags file under current directory
set tags=./tags

"Line numbering on
set number

"turn off arrow keys, they are a crutch
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" I like comma as my default leader key
let mapleader = ","

" Useful diff commands, may not need now that I use fugitive
map <Leader>sd :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
map <Leader>gd :new<CR>:read !git diff<CR>:set syntax=diff buftype=nofile<CR>gg

" Remove menu bar in gvim
set guioptions-=m

" Remove toolbar in gvim
set guioptions-=T

" Color syntax highlighting on
syntax on

" Turn indent handling on
filetype plugin indent on

" Tab handling
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" Light colored backgrounds are supposed to be more ergonomic
" I use terminals that support 256 colors, so this color scheme works with both
" vim and gvim

colorscheme mayansmoke

"required for Lusty explorer plugin
:set hidden

"for ack plugin
let g:ackprg="ack-grep -H --nocolor --nogroup --column"


" trim trailing whitespace on any write
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

"better status line
:set laststatus=2

if has("statusline")
  set statusline=
  set statusline+=%<\                       " cut at start
  set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
  set statusline+=%-40f\                    " relative path
  set statusline+=%=                        " seperate between right- and left-aligned
  set statusline+=%1*%y%*%*\                " file type
  set statusline+=%10((%l/%L)%)\            " line and column
  set statusline+=%P                        " percentage of file
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  set statusline+=%{fugitive#statusline()}
endif

" nice ruby / javascript compatible colorscheme
" colorscheme herald

" fix omni completion menu colors for herald
" highlight Pmenu ctermbg=238 ctermfg=255 guifg=#ffffff guibg=#0000aa gui=bold

" fix showmarks colors

" highlight ShowMarksHLl ctermfg=darkblue ctermbg=black guifg=#00008B guibg=#000000
" highlight ShowMarksHLu ctermfg=green    ctermbg=black guifg=#00FF00 guibg=#000000
" highlight ShowMarksHLo ctermfg=yellow   ctermbg=black guifg=#00FFFF guibg=#000000
" highlight ShowMarksHLm ctermfg=red      ctermbg=black guifg=#FF0000 guibg=#000000

" marks that showmarks should show
" let g:showmarks_include="a-zA-Z\"^'`(){}."

