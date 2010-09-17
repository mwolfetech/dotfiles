syntax enable
set t_Co=256 

"turn off arrow keys, for learning purposes
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>
let mapleader = ","
map <Leader>t :FuzzyFinderTextMate<CR>
map <Leader>sd :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
map <Leader>gd :new<CR>:read !git diff<CR>:set syntax=diff buftype=nofile<CR>gg

map <F4> :cn<CR>
map <F3> :cp<CR>
colorscheme herald 

"fix omni completion menu
highlight Pmenu ctermbg=238 ctermfg=255 gui=bold

" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec set filetype=ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs set filetype=ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake set filetype=ruby

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant set filetype=ruby

" IRB config
au BufNewFile,BufRead .irbrc,irbrc set filetype=ruby

" Rackup
au BufNewFile,BufRead *.ru set filetype=ruby

" Capistrano
au BufNewFile,BufRead Capfile set filetype=ruby

" Bundler
au BufNewFile,BufRead Gemfile set filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml set filetype=eruby

au BufRead,BufNewFile *_spec.rb set filetype=rspec

" Thorfile
au BufNewFile,BufRead [tT]horfile,*.thor set filetype=ruby

filetype plugin indent on

:set expandtab
:set tabstop=2
:set shiftwidth=2

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
  :endfunction

  set list listchars=trail:.,extends:>
  autocmd FileWritePre *.rb :call TrimWhiteSpace()
  autocmd FileAppendPre *.rb :call TrimWhiteSpace()
  autocmd FilterWritePre *.rb :call TrimWhiteSpace()
  autocmd BufWritePre *.rb :call TrimWhiteSpace()
  autocmd FileWritePre *.json :call TrimWhiteSpace()
  autocmd FileAppendPre *.json :call TrimWhiteSpace()
  autocmd FilterWritePre *.json :call TrimWhiteSpace()
  autocmd BufWritePre *.json :call TrimWhiteSpace()
  autocmd FileWritePre *.haml :call TrimWhiteSpace()
  autocmd FileAppendPre *.haml :call TrimWhiteSpace()
  autocmd FilterWritePre *.haml :call TrimWhiteSpace()
  autocmd BufWritePre *.haml :call TrimWhiteSpace()
  autocmd FileWritePre *.sass :call TrimWhiteSpace()
  autocmd FileAppendPre *.sass :call TrimWhiteSpace()
  autocmd FilterWritePre *.sass :call TrimWhiteSpace()
  autocmd BufWritePre *.sass :call TrimWhiteSpace()
  autocmd FileWritePre *.erb :call TrimWhiteSpace()
  autocmd FileAppendPre *.erb :call TrimWhiteSpace()
  autocmd FilterWritePre *.erb :call TrimWhiteSpace()
  autocmd BufWritePre *.erb :call TrimWhiteSpace()
  autocmd FileWritePre *.js :call TrimWhiteSpace()
  autocmd FileAppendPre *.js :call TrimWhiteSpace()
  autocmd FilterWritePre *.js :call TrimWhiteSpace()
  autocmd BufWritePre *.js :call TrimWhiteSpace()
  autocmd FileWritePre *.css :call TrimWhiteSpace()
  autocmd FileAppendPre *.css :call TrimWhiteSpace()
  autocmd FilterWritePre *.css :call TrimWhiteSpace()
  autocmd BufWritePre *.css :call TrimWhiteSpace()
  autocmd FileWritePre *.scss :call TrimWhiteSpace()
  autocmd FileAppendPre *.scss :call TrimWhiteSpace()
  autocmd FilterWritePre *.scss :call TrimWhiteSpace()

