" oOPHINOo - vimrc

set nocompatible
filetype off

" Use Vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'gavocanov/vim-js-indent'
Plugin 'rking/ag.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'cohama/lexima.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'trotzig/import-js'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vimwiki'
call vundle#end()
filetype plugin indent on


" Colours!
syntax enable
set background=dark
set t_Co=256  " enable 256 colours
colorscheme evening


" Spaces
set expandtab       " tabs are spaces
set tabstop=2       " number of visual spaces per tab char
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " set shiftwidth so >> is 2 spaces


set number          " show line numbers
set relativenumber  " show line numbers relative to cursor
set showcmd         " show command in bottom bar
set cursorline      " highlight line cursor is on
set ruler           " always show cursor position
set laststatus=2    " always show a something bar
set incsearch       " show matching search results as typing
set ignorecase      " case insensitive search by default
set smartcase       " override ignorecase when term contains uppercase char
set autoindent      " copy the indentation from the previous line
set list            " show `listchars` characters
set scrolloff=3     " number of lines to always show at at the top & bottom
set hidden          " hide buffers rather than unloading then (so we don't
                    " have to save when switching buffers)
set wildmenu        " show available commands when autocompleting with tab
set wildmode=longest:full,full
set visualbell      " no beeping
set autoread        " reload file when changed on disk

set listchars=tab:=»,trail:·
set backspace=indent,eol,start   " make backspace behave in a sane manner

set splitright      " open vertical splits on the right
set splitbelow      " open the horizontal split below

set completeopt-=preview

" Make vim remember undos, even when the file is closed!
set undofile                              " save undo's after file closes
set undodir=~/.vim/tmp/undo//,/tmp//,.    " where to save undo histories
set undolevels=1000                       " how many undos
set undoreload=10000                      " number of lines to save for undo

" Keep backups and swap files in central location
set directory=$HOME/.vim/tmp/swap//,/tmp//,.
set backupdir=$HOME/.vim/tmp/backup//,/tmp//,.

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set linespace=0

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" Key maps!!

" Quick escaping
inoremap jk <Esc>
inoremap kl <Esc>

" Leader maps
let mapleader = "\<Space>"
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :e!<CR>

" Copy all lines to system clipboard
nnoremap <leader>c :%y*<CR>

" vimrc
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>vs :w<CR>:source $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>vo <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Tabs and buffers
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>
nnoremap <leader>d :bd<CR>

" Switching between last buffer
nnoremap <tab> :b#<CR>

" Search for visually highlighted text
vnoremap // y/<C-R>"<CR>

" Disable search highlighting until next search
nnoremap <leader><space> :noh<CR>

" Toggle highlighting for searches (in normal mode)
nnoremap <F2> :set hls!<CR>
set hlsearch

" Open new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" Ag
nnoremap <leader>ag :Ag!<space>
nnoremap <leader>as :AgFromSearch!<Cr>

" NERDTree
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeIgnore=['\.DS_Store$', '\~$', '\.sw[poq]$']
autocmd VimEnter * NERDTree | wincmd p

" Set File Icons
set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline\ 12
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11

set encoding=utf-8
let g:airline_powerline_fonts = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sass', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Git fugitive
nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gl :silent! Glog<CR>


" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "base16"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
" let g:airline_left_sep=''
" let g:airline_right_sep=''

" CtrlP
" Use The Silver Searcher
if executable('ag')
  " Use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ignore source control dirs
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" Change cursor appearance on insert/replace mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Toggle cursor
let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'line'
let g:togglecursor_replace = 'underline' " TODO: why doesn't this work?

" JSX
let g:jsx_ext_required = 0

" JavaScript Libraries Syntax
let g:used_javascript_libs = 'react,underscore'

" JsDoc
let g:jsdoc_allow_input_prompt = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

" Make vim indent normal tags
:let g:html_indent_inctags = "html,body,head,tbody"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="tomorrow"

" Custom Icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = "\ue781"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = "\ue749"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = "\ue74b"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['less'] = "\ue758"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = "\ue796"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['php'] = "\ue73d"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['eot'] = "\uf034"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ttf'] = "\uf034"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['otf'] = "\uf034"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['woff'] = "\uf034"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = "\uf03e"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpg'] = "\uf03e"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['png'] = "\uf03e"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gif'] = "\uf03e"


let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = "\ue71e"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = "\ue709"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['gruntfile.js'] = "\ue74c"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['gulpfile.js'] = "\ue763"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.babelrc'] = "\ue781"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.bowerrc'] = "\ue74d"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.babelrc'] = "\ue781"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['sass'] = "\ue74b"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['js'] = "\ue74e"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = "\ue71e"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['css'] = "\ue749"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = "\ue702"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.htaccess'] = "\uf013"


let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

"VIMWiki Markdown
"remap <leader>o :ImportJSGoTo<CR>
let g:vimwiki_list = [{'path': '~/Dropbox/Documents/Markdown/VIMWiki/', 'syntax': 'markdown', 'ext': '.md'}]
