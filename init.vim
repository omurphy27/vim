set nocompatible              " be iMproved, required

" load in vim vundle and all vim plugins from separate file
so ~/.vim/plugins.vim

syntax on

let mapleader = ','  	"The default leader key is \ changing to ,
set number  	     	"Activate line numbers
set linespace=10     	"Change line spacing
set clipboard=unnamed   "Allow vim copy paste to work with OS X Clipboard
set backspace=indent,eol,start
set sw=2		"Set shiftwidth to 4 spaces, important when indenting using < or >
set shortmess+=A	"Stop annoying swap file replacements messages. See here: http://stackoverflow.com/questions/1098159/vim-stop-existing-swap-file-warnings
set ic 			"make case insensitive search the default
set noerrorbells visualbell t_vb= "turn off thos annoying error bells
set foldmethod=indent	"have folds auto generated based on indentation
set termguicolors 	"make terminal vim and neovim prettier

"--------- Plugin Config Options--------"

"~ CtrlP Plugin Options ~
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30' 	"change order and amount of displayed results from Ctrl P
let g:ctrlp_max_depth = 50 						"the directory depth at which to search
let g:ctrlp_max_files = 0 						"place no limit on amount of files to search
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' 		"ignore custom files and directories

"~ NERDTree Options ~
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden=1 						"show hidden files, like dotfiles in NERDtree

"~ Vim Emmet Options ~
let g:user_emmet_expandabbr_key = '<Tab>,' 				"in vim emmet, change the expandable key to Tab

let g:python2_host_prog = '/usr/local/bin/python' 	  	 	"set to use python with vim and vim plugins
let g:python3_host_prog = '/usr/local/bin/python3'

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"~ Ultisnips Options ~
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Directory to save snippets in
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

"~ PHP Documentor Options ~
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>ds :call pdv#DocumentWithSnip()<CR>

"~ Changing cursor shape and style depending on vim mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"---------Visuals--------"
colorscheme atom-dark 
set guifont=Fira_Code:h14

" Customize line number colors to blend in better
hi LineNr       guifg=#393939
hi LineNr       guibg=#1d1f21

"---------Search--------"
set hlsearch
set incsearch

"--------Split Management----------"
set splitbelow
set splitright

"Change key mappings to switch between splits"
"In this order Up / Down / Right / L
"Just like H J K L in VIM
"Can be buggy in iTerm with Neovim - solution here fixes that: https://github.com/neovim/neovim/issues/2048
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------Cabbrev---------"
"See here: http://stackoverflow.com/questions/6638290/how-to-make-shortcut-for-tabnew-tabn-tabp

"Shortcut for opening a file in new tab.
ca te tabedit

"Shortcut for opening a new tab.
ca tn tabnew

"---------Mappings--------"

"Maping the escape key to something different in various modes
"See here: http://stackoverflow.com/questions/397229/reaching-up-to-hit-the-escape-key-sucks-especially-in-vim
ino jj <esc>
cno jj <c-c>
vno v <esc>

"Copies the current filepath to my clipboard
nmap <Leader>fp :let @+ = expand("%")<cr>

"Select all shortcut
map <C-a> <esc>ggVG<cr>

"Create new, empty, tab
map <C-t> :tabnew<cr>

"Shortcut for toggling Nerd Tree which opens up a sidebar of the current
"directory and files
nmap <Leader>1 :NERDTreeToggle<cr>

"Shortcut for editing the vimrc plugin listings file.
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Shortcut for installing plugins that have been added to the plugins.vim file
nmap <Leader>pi :PluginInstall<cr>

"Shortcut for updating plugins - do after removing one for example
nmap <Leader>pu :PluginUpdate<cr>

"Shortcut for editing the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Create new snippet via UltiSnips
nmap <Leader>us :UltiSnipsEdit<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Switch to right tab...normally it's gT, this saves from having to capitilize anything
nmap <Leader>gt gT<cr>

"Shortcut for deleting without adding to the 'register' which messes up
"copying and pasting
nmap <Leader>dd "_d<cr>

"Shortcut for clearing the NERDTREE and CTRL + P caches and refreshing them 
nmap <Leader>cp :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

"Toggle between functions and variables in a file
nmap <Leader>r :CtrlPBufTag<cr>

"Open the most recently used files in the Ctrl P file browsing plugin
nmap <Leader>pp :CtrlPMRUFiles<cr>

"Shortcut for saving
nmap <Leader>ss :w<cr>

"Shorcut for creating horitzontal split
nmap <Leader>sp :sp<cr>

"Shorcut for creating vertical split
nmap <Leader>vp :vsp<cr>

"Shorcut for exiting file or pane
nmap <Leader>w :q<cr>

"Enter terminal mode...aka open up the terminal from NeoVim
nmap <Leader>t :terminal<cr>

"Shortcut for escaping from terminal mode
tnoremap <Esc> <C-\><C-n>

"Switching panes inside terminal mode
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-H> <C-\><C-n><C-W><C-H>
"Cant use <C-L> since thats what I use to clear my terminal
tnoremap <C-;> <C-\><C-n><C-W><C-L> 		

"--------Auto-Commands-----"

"Automatically unfold all folds when opening certain files
autocmd Syntax js,scss,css,vim,xml,html,xhtml,php normal zR

"Always start in insert mode when entering a terminal pane
autocmd BufWinEnter,WinEnter term://* startinsert

"Always be in normal mode when exiting a terminal pane
autocmd BufLeave term://* stopinsert

"Automatically source the Vimrc file on save.
augroup SOURCE_ON_SAVE
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END 
