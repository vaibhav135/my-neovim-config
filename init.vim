
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'puremourning/vimspector'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

"" Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" --------------------------------------------------------------------------------------------------------------------------------
" ---------------------------------------------  Default configuration -----------------------------------------------------------
" enable termguicolors
if (has("termguicolors"))
  set termguicolors
endif

filetype off
filetype plugin indent on
filetype plugin on

"let g:onedark_termcolors=256

" Change <leader> to be comma
let mapleader=","
let g:mapleader=","

set encoding=UTF-8
set nocompatible|              " be iMproved, required
set number
set hidden
set switchbuf=useopen,usetab
set relativenumber
set t_Co=256
set backspace=indent,eol,start|  "more powerful backspacing
set nowrap
set tabstop=4
set shiftwidth=4
set noswapfile
set autoindent
set smartindent
set cindent
set showcmd
set ma
set nocompatible| "Limit search to your project
set path+=** "Search all subdirectories and recursively
set wildmenu "Shows multiple matches on one line
set background=dark
set scrolloff=8
set updatetime=50
set colorcolumn="80"
set statusline+=%{get(b:,'gitsigns_status','')}

hi Visual term=reverse cterm=reverse guibg=Grey

"Per default netrw leaves unmodified buffers open. This autocommand
"delets netrw's buffer once it's hidden (using ' :q,for example)
autocmd FileType netrw setl bufhidden=delete| "or use :qa!
"autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'setup.ini', 'pyproject.toml', 'pyrightconfig.json']

" configuration for sass or scss
autocmd FileType scss setl iskeyword+=@-@

"Ref: https://akhatib.com/auto-save-load-views-in-vim/
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview


"fonts and colorschemes
"syntax on
"colorscheme onedark
"let g:molokai_original = 1

"buffer splitting
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eh :split $MYVIMRC<cr>

"source vimrc or inti.vim
nnoremap <leader>sv :source $MYVIMRC<cr>

"buffer control
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>

" comments in vimrc start with
" in normal mode
nnoremap <Left>  : echoe "Use h" <CR>
nnoremap <Right> : echoe "Use l" <CR>
nnoremap <Up>    : echoe "Use k" <CR>
nnoremap <Down>  : echoe "Use j" <CR>
" " in insert mode
 "inoremap <Left>  : echoe "Use h" <CR>
 "inoremap <Right> : echoe "Use l" <CR>
 "inoremap <Up>    : echoe "Use k" <CR>
 "inoremap <Down>  : echoe "Use j" <CR>
"Sidebar
"settings for netrw

" Shortcut to use blackhole register by default
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X


" Shortcut to use clipboard with <leader>
nnoremap <leader>d d
vnoremap <leader>d d
nnoremap <leader>D D
vnoremap <leader>D D
nnoremap <leader>c c
vnoremap <leader>c c
nnoremap <leader>C C
vnoremap <leader>C C
nnoremap <leader>x x
vnoremap <leader>x x
nnoremap <leader>X X
vnoremap <leader>X X


" path for python2 and python3 in neovim
let g:python3_host_prog = '/usr/bin/python3'
let g:python2_host_prog = '/usr/bin/python2'

" enable and disable for certain file extensions
"let s:my_coc_file_types = ['c', 'cpp', '*js', '*ts', 'rs', 'go', 'py']

"function! s:disable_coc_for_type()
	"if index(g:my_coc_file_types, &filetype) == -1
			"let b:coc_enabled = 0
	"endif
"endfunction

"augroup CocGroup
	"autocmd!
	"autocmd BufNew,BufEnter * call s:disable_coc_for_type()
"augroup end
"

"let g:coc_global_extensions = [
  "\ 'coc-tsserver'
  "\ ]

"autocmd FileType scss setl iskeyword+=@-@

"set re=0
"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  "let g:coc_global_extensions += ['coc-prettier']
"endif

"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  "let g:coc_global_extensions += ['coc-eslint']
"endif

" disabling coc for python files
"autocmd FileType python,venv,ASCII text,vim let b:coc_suggest_disable = 1

"disabling deoplete for certain file types
"autocmd FileType tex,javascript,typescript,dart
	"\ call deoplete#custom#buffer_option('auto_complete', v:false)


"COC flutter configuration <leader>aap for current paragraph, <leader>aw for
"the current word
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"let dart_html_in_string=v:true
"let g:lsc_server_commands = {'dart': 'dart_language_server'}
"let g:lsc_auto_map = {'defaults': v:true,'PreviousReference': '<C-l>',}
"let g:dart_style_guide = 2
"let g:dart_format_on_save = 1

"let g:lsc_auto_map = v:true
"let g:dartfmt_options

"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

""performing code-action
"nmap <leader>do <Plug>(coc-codeaction)
"nmap <leader>rn <Plug>(coc-rename)

"jedi-vim keybindings
"let g:jedi#goto_command = "<leader>cd"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_stubs_command = "<leader>s"
"let g:jedi#goto_definitions_command = "<leader>gd"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"

" --------------------------------------------------------------------------------------------------------------------------------

" ---------------------------------------------  NerdTree configuration ----------------------------------------------------------------

" nerdtree keybindings
let NERDTreeShowHidden=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle %<CR>
nnoremap <leader>r :NERDTreeFind<cr>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif





" --------------------------------------------------------------------------------------------------------------------------------

" ---------------------------------------------  FZF configuration ----------------------------------------------------------------

"let g:fzf_layout = { 'down': '20%' }
"autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
  "\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler



"" PLUGIN: FZF
"nnoremap <silent> <Leader>bf :Buffers<CR>
"nnoremap <silent> <C-f> :Files<CR>
"nnoremap <silent> <Leader>f :Rg<CR>
"nnoremap <silent> <Leader>/ :BLines<CR>
"nnoremap <silent> <Leader>' :Marks<CR>
"nnoremap <silent> <Leader>g :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR>
"nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR>

"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

			
" ---------------------------------------------------------------------------------------------------------------------------------

" ---------------------------------------------  Vimspector configuration ---------------------------------------------------------

fun! GotoWindow(id)
    call win_gotoid(a:id)
    "MaximizerToggle
endfun


" keymappings for Vimspector
" vimspector configuration
let g:vimspector_enable_mappings = 'HUMAN'

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Space>db <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Space>db <Plug>VimspectorBalloonEval

nmap <Space>dd :call vimspector#Launch()<CR>
nmap <Space>dgc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nmap <Space>dgt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nmap <Space>dgv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nmap <Space>dgw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nmap <Space>dgs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nmap <Space>dgo :call GotoWindow(g:vimspector_session_windows.output)<CR>
nmap <Space>dx :VimspectorReset<CR>
nmap <Space>de :VimspectorEval
nmap <Space>dw :VimspectorWatch
nmap <Space>do :VimspectorShowOutput
nmap <Space>dso <Plug>VimspectorStepOver
nmap <Space>dsi <Plug>VimspectorStepInto
nmap <Space>dss <Plug>VimspectorStepOut


" -----------------------------------------------------------------------------------------------------------------------------------------

" ---------------------------------------------  Vim-Lua configuration --------------------------------------------------------------------

lua << EOF
require "vaibhav135"
EOF
