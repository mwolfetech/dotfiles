"syntax highlighting always on
syntax enable

"my terminal supports 256 colors.
set t_Co=256 

"F9 will show diff from SVN so I can write a nice commit log
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

"Navigate easily through quicklists
map <F6> :cn<CR>
map <F5> :cp<CR>

"Nice ruby support in this colorscheme
colorscheme herald 

"Make sure ruby filetypes are recognized.
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

"Autoindenting
filetype plugin indent on

"Turn tabs to spaces
:set expandtab
:set tabstop=2
:set shiftwidth=2

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

"ensure that whitespaces are trimmed from these filetypes on save
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

