"===========================================================
" Plugin Setup {{{
"===========================================================
" Autoinstall vim-plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
"}}}
call plug#begin('~/.config/nvim/plugged')

  " Generic plugins {{{
  Plug 'pbrisbin/vim-mkdir'
  Plug 'Yggdroot/indentLine'

  " " Async syntax checking
  let g:ale_linters = {
  \   'elixir': [],
  \}
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0

  Plug 'w0rp/ale'
  " Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " commenting stuff
  Plug 'tpope/vim-commentary'
  " Polyglot - all the languages!
  Plug 'sheerun/vim-polyglot'
  " }}}

  " Git status icons
  Plug 'airblade/vim-gitgutter'

  " Configure editor
  Plug 'editorconfig/editorconfig-vim'

  " Tab through coc
  Plug 'ervandew/supertab'

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Buffer line on the bottom
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  " Theme and coloring
  Plug 'morhetz/gruvbox'

  " Code completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Comment out lines
  Plug 'tpope/vim-commentary'

  " NERDTree
  Plug 'preservim/nerdtree'

  " Languages
  Plug 'elixir-editors/vim-elixir'
  Plug 'hashivim/vim-terraform'

  " Show error hints and highlights
  Plug 'vim-syntastic/syntastic'

  " Select multiple same items
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Terraform completion and syntax highlight
  Plug 'juliosueiras/vim-terraform-completion'

  " Git blamer
  Plug 'APZelos/blamer.nvim'

  " Dockerfile syntax
  Plug 'ekalinin/Dockerfile.vim'

  " Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  " Cheat.sh integration
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-cheat.sh'

  " NVIM reload
  Plug 'famiu/nvim-reload'
  Plug 'nvim-lua/plenary.nvim'

  " Icons for different file types
  Plug 'ryanoasis/vim-devicons'

" Ctrl Shift F search function
  Plug 'dyng/ctrlsf.vim'

  " Suda
  Plug 'lambdalisue/suda.vim'

  " Snazzy colorscheme
  Plug 'connorholyday/vim-snazzy'

  " Spaceduck colorscheme
  Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

  Plug 'nvim-lualine/lualine.nvim'
  " If you want to have icons in your statusline choose one of these
  Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Settings
let mapleader = "\<Space>"
filetype plugin on
set completeopt=longest,menuone
set mouse=a
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set number
set title
set wrap
setlocal wrap
setlocal modifiable
set encoding=UTF-8
set guifont=Hack\ Regular\ Nerd\ Font\ Complete\ Mono\ 8
" persist
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" SuperTab
let g:SuperTabMappingForward = '<S-tab>'
let g:SuperTabMappingBackward = '<tab>'

" Theme
syntax on
" colorscheme gruvbox
set background=dark
set cursorline
set hidden
set list
set listchars=tab:»·,trail:·

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme snazzy

" let buffers be clickable
let g:lightline#bufferline#clickable=1
let g:lightline#bfferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }


" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 200

" Remaps
nmap <Leader>p :Rg<CR>
nmap <Leader>h :History<CR>
nmap <Leader>n :NERDTreeToggle<CR>
imap jj <Esc>:w<CR>a
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nmap <Leader>t :NERDTreeFocus<CR>

" Give more space for displaying messages.
set cmdheight=2

" Reduce updatetime
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Allow saving of files as sudo when I forgot to start vim using sudo.
let g:suda_smart_edit = 1
let g:suda#prompt = 'Password: ' 

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Launch NERDTree on start-up
" autocmd VimEnter * NERDTree
let g:NERDTreeShowHidden=1

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}
