call plug#begin('~/.local/share/nvim/site/autoload')

" tools
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bling/vim-bufferline'
Plug 'blueyed/vim-diminactive'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'flazz/vim-colorschemes'
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'nikvdp/ejs-syntax'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vickenty/vim-hive'
Plug 'vim-airline/vim-airline'
Plug 'vim-latex/vim-latex'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'derekwyatt/vim-scala'

" languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/svg.vim'

call plug#end()

filetype plugin indent on

" syntastic default settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" colorsheme
set termencoding=utf8
let g:gruvbox_italic=1
set termguicolors
colorscheme gruvbox
set cursorline
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
"hi CursorLine cterm=none ctermbg=234

" mouse
set mouse=r "Use mouse (all)

" fancy mappings
map Y y$
map - <c-w>w
map H ^
map L $
nmap * *zz
nmap <Tab> :bn<cr>
nmap <S-Tab> :bprevious<cr>
nmap <space> <pagedown>

" commenting behavior
set formatoptions+=ln "See :h 'formatoptions' :)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set so=4 "When moving vertical, start scrolling 4 lines before reaching bottom
set expandtab
set autoindent "Indent (based on above line) when adding a line
set linebreak
set ts=2 "A tab is 2 spaces
set softtabstop=2 "See 2 spaces per tab
set sw=2 "Indent is 2
set number "Show lines
set showmode "Show mode in status (insertion, visual...)
set showcmd "Show beginning of normal commands (try d and see at bottom-right)
set ruler "Show line,col in statusbar

" Windows
set splitright " Vsplit at right
"set previewheight=8 "Height of preview menu (Omni-completion)

" Search
set wrapscan "Continue to top after reaching bottom
set nohlsearch "Highlight search
set incsearch "See results of search step by step
set showmatch "Parenthesis matches
set matchtime=2 "Show new matching parenthesis for 2/10th of sec

" vim-projectionist quickey (ag: alternate go)
nnoremap <Leader>ag :A<CR>

" vim-bufferline
let g:bufferline_fname_mod = ':.'

" use home directory for swap files
set dir=$HOME/.config/nvim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" fzf
set rtp+=~/.fzf
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>

" auto-folding
set foldenable
set foldmethod=syntax
set foldnestmax=2
autocmd! BufReadPost * :if line('$') < 60 | set foldlevel=1000 | endif

" ====================================== COC ==================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <c-]> <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
" Remap for do codeAction of current line
nmap <leader>Ta  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>Ti  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'cocstatus': 'coc#status'
      "\ },
      "\ }



"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" =============================================================================


" golang
nmap <leader>gr <Plug>(go-run)
nmap <leader>gc <Plug>(go-build)
nmap <leader>gt :GoTest!<cr>
nmap <leader>gl <Plug>(go-lint)
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

" scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Terraform autoformat
autocmd BufWritePre *.tf execute ':TerraformFmt'
