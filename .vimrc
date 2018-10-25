" *************
" VUNDLE
" *************
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Closetag : Auto-close xml tags
Plugin 'alvan/vim-closetag'

" Deus : Colorscheme
Plugin 'ajmwagar/vim-deus'

" Fugitive : git integration
Plugin 'tpope/vim-fugitive'

" fzf : fuzzy file finding. Installed via homebrew
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" Ripgrep: adds the :Rg command
Plugin 'jremmen/vim-ripgrep'

" Lightline : status line
Plugin 'itchyny/lightline.vim'

" Nerdtree : file browser drawer. <C-n> to toggle
Plugin 'scrooloose/nerdtree.git'

" PHP Syntax Highlighting
Bundle 'captbaritone/better-indent-support-for-php-with-html'

" PHPQA : Automatically runs
Bundle 'joonty/vim-phpqa.git'

" Rust : rust syntax, highlighting, etc
Plugin 'rust-lang/rust.vim'

" Javascript/ES6 sytax, highlighting, etc.
Plugin 'isRuslan/vim-es6'

" Spec Finder : Rails spec finder
Plugin 'skwp/vim-spec-finder'

" Syntastic : Syntax checker
Plugin 'vim-syntastic/syntastic'

" Run this after updating plugin list:
"   :PluginInstall
"
" Or from command line:
"   vim +BundleInstall +qall

call vundle#end()           " Required by Vundle
filetype plugin indent on   " Required by Vundle

" **************
" VANILLA CONFIG
" **************

" colorscheme angr
colorscheme deus
set background=dark
" colors mayansmoke

set guifont=Source\ Code\ Pro:h11
let mapleader=","

if has("gui_macvim")
  " Tab for autocomplete
  inoremap <tab> <c-r>=Smart_TabComplete()<CR>
 
  macmenu File.Open\ Tab\.\.\. key=<nop>
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  macmenu &File.New\ Tab key=<D-T>

  " Cmd-# on Mac and Alt-# elsewhere to switch tabs
  for n in range(10)
       let k = n == "0" ? "10" : n
       for m in ["D", "A"]
           exec printf("imap <silent> <%s-%s> <Esc>%sgt", m, n, k)
           exec printf("map <silent> <%s-%s> %sgt", m, n, k)
       endfor
  endfor
end

set history=1000              " Remember commands and search history
set showcmd                   " show incomplete cmds down the bottom
set showmode                  " show current mode down the bottom

set hlsearch                  " highlight my search
set incsearch                 " incremental search
set wrapscan                  " Set the search scan to wrap around the file
set ignorecase                " when searching
set smartcase                 " …unless I use an uppercase character

set number                    " add line numbers
set list                      " Show invisible chars
set wrap linebreak nolist
set showbreak=...
set linespace=0               " Tight Leading
set shiftwidth=2
set softtabstop=2
set expandtab                 " Expand tabs to spaces
set splitbelow                " Always split vertical windows below
syntax on                     " Syntax highlighting
syntax sync minlines=256      " Makes big files slow
set synmaxcol=2048            " Also long lines are slow
set autoindent                " try your darndest to keep my indentation
set smartindent               " Be smarter about indenting dummy

set exrc                      " Allow project-specific .vimrc
set secure                    " Disable unsafe commands in project-specific .vimrc files
set wildmode=list:longest     " Tab behavior opening files

set ttymouse=xterm2           " mouse/tmux
set mouse=a                   " mouse/tmux, part2

" let &colorcolumn=join(range(81,999),",") " Highlight past character limit
let &colorcolumn=join(range(121,999),",") " Highlight past character limit

" remove trailing whitespace
for ext in ['.rb', '.erb', '.haml', '.scss', '.php']
  execute "autocmd BufWritePre *" . ext . " :%s/\\s\\+$//e"
endfor

" No backup files, no swap files.
set nobackup
set nowritebackup
set noswapfile

noremap <F1> :SyntasticCheck<CR>;
noremap <F2> :call SyntasticToggleErrors()<CR>;

nmap <Leader>rhh :call RubyHashesAll()<CR>
vmap <Leader>rhh :call RubyHashesSelected()<CR>

" override indents for php/phtml
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType phtml setlocal shiftwidth=4 tabstop=4

" Nerdtree
noremap <C-n> :NERDTreeToggle<CR>

" Ripgrep
noremap <C-g> :Rg 

" *************
" PLUGIN CONFIG
" *************

" Closetag
let g:closetag_filenames = "*.xml"

" FZF
noremap <C-f> :Files<CR>

" Lightline
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
\ }

set laststatus=2                       " Fix bug where single mode wouldn't show

" PHPQA https://github.com/joonty/vim-phpqa
let g:phpqa_messdetector_ruleset="~/.vim/misc/phpmd-ruleset.xml"
let g:phpqa_codesniffer_args="--standard=Ecg"

let g:phpqa_messdetector_autorun=0     " Disable auto CodeCoverage on save
let g:phpqa_codesniffer_autorun=0      " Disable auto CodeCoverage on save
let g:phpqa_codecoverage_autorun=0     " Disable auto CodeCoverage on save
let g:phpqa_codecoverage_showcovered=0 " Recommended speed boost

" Ripgrep
let g:rg_highlight=1

" TODO: Bind F2 to messdetector and codesniffer
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Defaults recommended by the README
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 1

" disable PHP as we prefer PHPQA
let g:syntastic_php_checkers = [] 

" Update rust to use cargo. This avoids "crate not found" errors.
" Per https://github.com/rust-lang/rust.vim/issues/130
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["rust"],
  \ "passive_filetypes": []
\ }

" Throw Syntastic into passive mode.
if has("gui_macvim")
  call SyntasticToggleMode()
end

" *************
" LIBRARY
" *************

" http://www.economyofeffort.com/2014/07/09/vim-tricks-for-ruby-hashes/
function! RubyHashesAll()
  :%s/:\([^ ]*\)\(\s*\)=>/\1:/ge
endfunction
 
function! RubyHashesSelected()
  :'<,'>s/:\([^ ]*\)\(\s*\)=>/\1:/ge
endfunction

function! Smart_TabComplete()
" http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion

let line = getline('.')                     " current line

let substr = strpart(line, -1, col('.'))    " from the start of the current
                                            " line to one character right
                                            " of the cursor
let substr = matchstr(substr, "[^ \t]*$")   " word till cursor
if (strlen(substr)==0)                      " nothing to match on empty string
return "\<tab>"
endif
let has_period = match(substr, '\.') != -1  " position of period, if any
let has_slash = match(substr, '\/') != -1   " position of slash, if any
if (!has_period && !has_slash)
return "\<C-X>\<C-P>"                       " existing text matching
elseif ( has_slash )
return "\<C-X>\<C-F>"                       " file matching
else
return "\<C-X>\<C-O>"                       " plugin matching
endif
endfunction

" Close, or Open the errors window for Syntastic.
function! SyntasticToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

" Source off AoC
function! AdventOfCode()
  set guifont=Source\ Code\ Pro:h16
endfunction
function! AdventOfCodeReset()
  set guifont=Source\ Code\ Pro:h11
endfunction
command! Aoc call AdventOfCode()
command! Aocx call AdventOfCodeReset()
