"this is vim, not vi
set nocompatible

" Include all plugins, in separate directories under .vim/bundle
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on

filetype indent plugin on

" large undo buffer?
set ut=2000

"I use a 256 color terminal
set t_Co=256

"Default ctags file under current directory
"set tags=./tags
let g:Tlist_Ctags_Cmd = "/home/mwolfe/bin/javascripttags"
"Line numbering on
set number

"tagbar
map <F2> :TagbarToggle<CR>

"location and error list navigation
map <F3> :cn<CR>
map <F4> :cp<CR>
map <F7> :lne<CR>
map <F8> :lprevious<CR>
map <F9> :lclose<CR>

"navigate command-T on urxvt
let g:CommandTSelectNextMap='OB'
let g:CommandTSelectPrevMap='OA'


"ignore these files
:set wildignore+=.git,.svn,gems,gem

" I like comma as my default leader key
let mapleader = ","

"easy rewrapping of arguments
nnoremap <silent> <leader>s :call argumentrewrap#RewrapArguments()<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Useful diff commands, may not need now that I use fugitive
map <Leader>sd :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
map <Leader>gd :new<CR>:read !git diff<CR>:set syntax=diff buftype=nofile<CR>gg
nnoremap <Leader>z  :GundoToggle<CR>

" Remove menu bar in gvim
set guioptions-=m

" Remove toolbar in gvim
set guioptions-=T

" Color syntax highlighting on
syntax on

"syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0
"let g:syntastic_quiet_warnings=1
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

"colorscheme mayansmoke

"good alternative dark colorscheme
"colorscheme herald
set background=dark
let g:solarized_termcolors=256
"let g:colarized_termtrans=1
colorscheme solarized
"hi Normal ctermbg=none

"hi NORMAL ctermbg=230

"highlight text over 80 cols
highlight OverLength ctermbg=52 ctermfg=white guibg=#592929 guifg=white
match OverLength /\%81v.\+/

"required for Lusty explorer plugin
:set hidden

"for ack plugin
let g:ackprg="ack -H --nocolor --nogroup --column"


" trim trailing whitespace on any write
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

" trim whitespace at end of file on any write
autocmd BufWrite * mark ' | silent! g/^[\s\l\n]*\%$/d | norm ''


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

highlight ShowMarksHLl ctermfg=darkblue ctermbg=black guifg=#00008B guibg=#000000
highlight ShowMarksHLu ctermfg=green    ctermbg=black guifg=#00FF00 guibg=#000000
highlight ShowMarksHLo ctermfg=yellow   ctermbg=black guifg=#00FFFF guibg=#000000
highlight ShowMarksHLm ctermfg=red      ctermbg=black guifg=#FF0000 guibg=#000000

" marks that showmarks should show
let g:showmarks_include="a-zA-Z\"^'`(){}."
"count 'lines of code'
function! CountNonEmpty()
   return len(filter(getline(1, line('$')), '!empty(v:val)'))
endfunction




"fold for javascript
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent


function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
