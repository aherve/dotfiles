call plug#begin('~/.local/share/nvim/site/autoload')

Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'artoj/pgn-syntax-vim'
Plug 'blueyed/vim-diminactive'
Plug 'chrisbra/csv.vim'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'flazz/vim-colorschemes'
Plug 'github/copilot.vim'
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf.vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-velocity'
Plug 'lervag/vimtex'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'samoshkin/vim-mergetool'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'stevearc/vim-arduino'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'uarun/vim-protobuf'
Plug 'vickenty/vim-hive'
Plug 'vim-airline/vim-airline'
Plug 'vim-latex/vim-latex'
Plug 'vim-scripts/svg.vim'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'

call plug#end()

filetype plugin indent on

"" syntastic default settings:
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" colorsheme
set termencoding=utf8
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='soft'
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
"set nofoldenable
set foldmethod=syntax
set foldnestmax=2
autocmd! BufReadPost * :if line('$') < 60 | set foldlevel=1000 | endif

" ====================================== COC ==================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

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
nmap <leader>ta  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>tf  <Plug>(coc-fix-current)

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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

" This prevents go autofmt to refold everything after each save
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"
let g:go_mod_fmt_autosave = 1

let g:go_imports_mode = "goimports"
let g:go_imports_autosave = 1

" scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Terraform autoformat
autocmd BufWritePre *.tf execute ':TerraformFmt'

" Apache velocity
au BufNewFile,BufRead *.vm,*.shtml,*.stm,*.vtl set ft=velocity

" c++ autoformat
autocmd BufWritePre *.cpp execute ':Format'


let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

" use node 17 with copilot
let g:copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"

" remap copilot complete (tab is used by coc)
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true
imap <silent><script><expr> <C-k> copilot#Accept("\<CR>")

" mergetool
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
