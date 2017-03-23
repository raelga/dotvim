" -----------------------------------------------------------------------------
" @raelga dotvim 2017
" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------

let mapleader = ','

" -----------------------------------------------------------------------------
" Vundle
" -----------------------------------------------------------------------------

set nocompatible                        " Sorry vi :'(
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Utils
Plugin 'VundleVim/Vundle.vim'           " Plugin manager
Plugin 'scrooloose/nerdtree'            " File explorer
Plugin 'ctrlpvim/ctrlp.vim'             " Full path fuzzy finder
Plugin 'tpope/vim-repeat'               " Repeat last command (plus)
Plugin 'tpope/vim-surround'             " Block tokens helper
Plugin 'tpope/vim-commentary'           " Comment helper
Plugin 'scrooloose/syntastic'           " Syntax checking
Plugin 'SirVer/ultisnips'               " Snippet engine
Plugin 'honza/vim-snippets'             " Snippet collection
Plugin 'ervandew/supertab'              " Tab helper
" Interface
Plugin 'vim-airline/vim-airline'        " Fancy status bar
Plugin 'vim-airline/vim-airline-themes' " Fancier status bar themes
Plugin 'majutsushi/tagbar'              " Tags explorer
" Languages
Plugin 'vim-perl/vim-perl'              " Perl syntax and helpers
Plugin 'fatih/vim-go'                   " Golang syntax and helpers
Plugin 'python-mode/python-mode'        " Python syntax and helpers
Plugin 'eagletmt/ghcmod-vim'            " Haskell syntax and helpers
" Git
Plugin 'airblade/vim-gitgutter'         " Git helper
Plugin 'tpope/vim-fugitive'             " Git helper
" Format
Plugin 'Yggdroot/indentLine'            " Mark identations with a symbol
Plugin 'godlygeek/tabular'              " Text filtering and alignment

call vundle#end()            " required

" -----------------------------------------------------------------------------
" Vundle Plugins Configuration
" -----------------------------------------------------------------------------

" NerdTree - Sidebar folder navigation
"
let NERDTreeShowLineNumbers=1           " Show line numbers in NT
let NERDTreeShowBookmarks=1             " Show bookmakrs in NT
let NERDTreeChDirMode=2                 " CWD changes when NT root changes
let NERDTreeWinSize=35                  " NT window witdh

noremap <Leader>, :NERDTreeToggle<cr>   " Toggle > NERDTree window
"
" ctrlpvim
"
let g:ctrlp_working_path_mode = 'ra'    " The nearest ancestor with .git (+a)
let g:ctrlp_user_command = 'find %s -maxdepth 10 -type f' " Custom find cmd
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(swp|so|dll|exe)$' }   " Ignore some dirs/expensions
"
" vim-gitgutter
"
let g:gitgutter_enabled = 1             " Enable git on start
let g:gitgutter_realtime = 0            " Disable git update in realtime
let g:gitgutter_eager = 0               " Disble git update on tab/buff change
nmap ]h <Plug>GitGutterNextHunk         " Go to the next hunk
nmap [h <Plug>GitGutterPrevHunk         " Go to the prevous hunk
nmap <Leader>hs <Plug>GitGutterStageHunk    " Stage current hunk
nmap <Leader>hu <Plug>GitGutterUndoHunk     " Discard current hunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk  " Preview the hunk diff
"
" vim-airline
"
let g:airline_powerline_fonts = 1       " Populate the g:airline_symbols
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

"
" identLine
"
let g:indentLine_enabled = 1            " Enable on start
"
" YouCompleteMe
"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"
" UtilSnips
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"
" Syntastic
"
map <Leader>sc :SyntasticToggleMode<CR> " Syntastic > Check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*                      " Show syntastic info on the status bar
let g:syntastic_always_populate_loc_list = 1 " List errors on location list
let g:syntastic_loc_list_height = 5     " Error list max height
let g:syntastic_auto_loc_list = 1       " Open/close error list automatically
let g:syntastic_check_on_open = 0       " Enable syntax check on open
let g:syntastic_check_on_wq = 0         " Disable syntax check on exit
let g:syntastic_enable_highlighting = 1 " Enable error highlighting
let g:syntastic_enable_perl_checker = 1 " Enable perl checker
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'passive_filetypes': ['go'] }   " Passive mode for go, will use vim-go
"
" python-mode
"
let g:pymode_lint = 0                   " Disable pymode syntax (use syntastic)
let g:pymode_rope_goto_definition_bind = "<C-]>" " Ctrl-] python go to def
let g:pymode_run_bind = "<C-S-e>"       " Ctrl-Shift-d python run current
let g:pymode_doc_bind = "<C-S-d>"       " Ctrl-Shift-d python doc shortcut
"
" Golang
"                           moar info --> https://github.com/fatih/vim-go/wiki
let g:go_term_mode = "split"            " Run commands below in split mode
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)"
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gd <Plug>(go-def-split)
au FileType go nmap <leader>gi <Plug>(go-info)
au FileType go nmap <leader>gm <Plug>(go-implements)
let g:go_get_update = 0                 " Disable updating deps when installing
let g:syntastic_go_checkers = [
                    \ 'golint',
                    \ 'govet',
                    \ 'errcheck']       " vim-go/syntastic compatibility config
let g:go_list_type = "quickfix"         " Location list fix for syntastic
let g:go_highlight_functions = 1        " Syntax highlight function
let g:go_highlight_methods = 1          " Syntax highlight methods
let g:go_highlight_fields = 1           " Syntax highlight fields
let g:go_highlight_types = 1            " Syntax highlight types
let g:go_highlight_operators = 1        " Syntax highlight operators
let g:go_highlight_build_constraints = 1 " Syntax highlight build constraints
"
" Haskell
"
au FileType haskell map <silent> htw :GhcModTypeInsert<CR>
au FileType haskell map <silent> hts :GhcModSplitFunCase<CR>
au FileType haskell map <silent> htq :GhcModType<CR>
au FileType haskell map <silent> hte :GhcModTypeClear<CR>
"
" jsflakes
"
let g:jsflakes_autolint = 1             " Enable on start
au FileType html source $VIM\vimfiles\ftplugin\javascript\jsflakes.vim
"
" TabBar
"
map <leader>tb :TagbarToggle<cr>        " TagBar > Toggle (toggle file tags)

" -----------------------------------------------------------------------------
" Interface
" -----------------------------------------------------------------------------

set nocompatible                        " Sorry vi :'(
set laststatus=2                        " Show the status line

set ttyfast                             " Faster screen redrawing
if $TMUX == ''
  set clipboard=unnamed                 " Use OS clipboard
endif

set novisualbell                        " Screen blink instead of beeping
set noerrorbells                        " Don't ring the bell on errors

set listchars=tab:»\ ,eol:¬,extends:#,nbsp:.,trail:.
set list                                " Show hidden characters (customized)

colorscheme jellybeans                  " Default theme

let g:Powerline_symbols = 'fancy'       " Powerline symbols set

set number                              " Show line numbers column
set numberwidth=3                       " Line number column width
set relativenumber                      " Line number relative to current line
set cursorline                          " Highlight the current line
set cursorcolumn                        " Highlight the current column
set guicursor+=a:blinkon0               " Turn off cursor blinking
set ruler                               " Show the line and column number

" -----------------------------------------------------------------------------
" Format
" -----------------------------------------------------------------------------

" Syntax
syntax on                               " Enable syntax highlighting

" Identation
set autoindent                          " Auto identation
set smartindent                         " Smart identation
set tabstop=2                           " Tab lenght
set shiftwidth=2                        " Tab lenght (backwards compatible)
set expandtab                           " Expand tabs to spaces

" Text formating
set textwidth=79                        " Line width, 79 + newline = 80 ;)
set formatoptions=qrn1                  " Details at :help fo-table"
"
if exists('+colorcolumn')
  set colorcolumn=+1                    " Show marker at line <textwidth + 1>
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/             " Red background beyond column 80

" Folding
set foldmethod=indent                   " Use ident for folding

" -----------------------------------------------------------------------------
" Vim behaviour
" -----------------------------------------------------------------------------

" History
set history=500                         " Command lines that are remembered

" Search
set incsearch                           " Show search results while typing
set ignorecase                          " Case insensitive search
set smartcase                           " Case sensitive if upper chars used
set hlsearch                            " Highlight matches

" Scrolling
set scrolloff=10                        " Scroll with 10 line buffer

" Backup
set nobackup                            " Don't backup before overwriting
set writebackup                         " Just while is being written

" Backspace
set backspace=indent,eol,start          " Backspaces over everything in insert

" -----------------------------------------------------------------------------
" Keybindings
" -----------------------------------------------------------------------------

" Clear recent search highlighting with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let mapleader = ','

" Vim
map <leader>vrc :source ~/.vimrc<cr>    " Vim > Reload > Config
map <leader>vec :new ~/.vimrc<cr>       " Vim  > Edit > Config (in a window)
map <leader>smc :set cc=40,+1<cr>       " Show Middle Column marker (40)

" Format
map <leader>tts :%s/\s\+$//<cr>         " Trim > Traling > Spaces

" Tabs
map <Leader>tn :tabnew<cr>              " Tabs > New (Opens a new tab)
map <Leader>tp :tabprevious<cr>         " Tabs > Previous (Move to prev tab)
map <Leader>tn :tabnext<cr>             " Tabs > Next (Move to next tab)
map <Leader>tc :tabclose<cr>            " Tabs : Close (Close current tab)

" Utils

" Launch bash
map <leader>term :!bash<cr>
" Run spellcheck (us)
map <leader>spc :setlocal spell! spelllang=en_us<CR>
" cd to directory of current file
map <leader>cd :cd %:p:h<cr>
"
" Normal Mode
"

" Move single lines up-down
nmap <c-up> ddkP
nmap <c-down> ddp

" Resize vertical windows
nmap + <c-w>+
nmap _ <c-w>-

" Resize horizontal windows
nmap > <c-w>>
nmap < <c-w><

" Insert on empty line, with lines above and below
nmap oo o<Esc>O

" Copy all lines that match a search on a new window including line numbers
nmap <leader>s :redir @a<cr>:g//<cr>:redir END<cr>:new<cr>:put! a<cr><cr>zRggd<cr>

" ; --> : for command inputs on normal
nnoremap ; :

"
" Insert mode
"

" Exit insert mode with
inoremap jj <Esc>

" Autocompletion
imap <Leader><Tab> <C-X><C-O>

" -----------------------------------------------------------------------------
" Shortcuts
" -----------------------------------------------------------------------------

" Save files as root without prior sudo
cmap w!! w !sudo tee % >/dev/null

" -----------------------------------------------------------------------------
" Filetype customizations
" -----------------------------------------------------------------------------

"filetype plugin on                      " Enable perl filetype file
filetype plugin indent on               " Enable language-dependent indenting

" perl    --> ftplugin/perl.vim
" python  --> ftplugin/python.vim
" haskell --> ftplugin/haskell.vim
"
" Some help for filetype match
au BufRead,BufNewFile *.hs set filetype=haskell
au BufRead,BufNewFile *.sh set filetype=sh
au BufRead,BufNewFile *.t,*.cgi set filetype=perl
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.json setf json
au FileType json set filetype=javascript foldmethod=syntax

" ------------------------
" Perl Programing Language
" ------------------------

" Keybindings
"
map <Leader>pdc :!perldoc %<cr>          " Open perldoc for current file
map <Leader>pdm :!perldoc <cword><cr>
map <Leader>pdf :!perldoc -f <cword><cr>

map <Leader>x :!perl -Ilib %<cr>


" ,T perl tests
"nmap <Leader>T :let g:testfile = expand("%")<cr>:echo "testfile is now" g:testfile<cr>:call Prove (1,1)<cr>
function! Prove ( verbose, taint )
    let g:testfile = expand("%")
    if ! exists("g:testfile") || ! (g:testfile =~ "\.t$")
        let g:testfile = "t/*.t"
    endif
    if g:testfile == "t/*.t" || g:testfile =~ "\.t$"
        let s:params = "lvrc"
        if a:verbose
            let s:params = s:params . "v"
        endif
        let s:pexec = "carton exec prove"
        let s:pargs = "--timer --normalize --state=save -" . s:params
        execute ":tabe | read ! ".s:pexec." ".s:pargs." ".g:testfile
    else
        call Compile ()
    endif
endfunction

function! Compile ()
    if ! exists("g:compilefile")
        let g:compilefile = expand("%")
    endif
    execute ":new | read !perl -wc -Ilib " . g:compilefile
endfunction

autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm nmap <Leader>pt :call Prove (1,1)<cr>
autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm nmap <Leader>pc :call Compile ()<cr>

" open installed perl modules
au FileType perl command! -nargs=1 PerlModuleSource :tabnew `perldoc -lm <args>`
au FileType perl setlocal iskeyword+=:
au FileType perl nmap <leader>P :PerlModuleSource <cword><cr>zR<cr>

" perltidy
au FileType perl command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy


" -----------------------------------------------------------------------------
" Extra
" -----------------------------------------------------------------------------

" ctags
set tags=./tags,./../tags,./../../tags,./../../../tags,tags
nmap ,ct :!(cd %:p:h;ctags *)&

