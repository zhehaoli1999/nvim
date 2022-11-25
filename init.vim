" Author: @zhehaoli2000 Ref: 
"   https://github.com/theniceboy/nvim/blob/master/init.vim
"   https://www.ruanyifeng.com/blog/2018/09/vimrc.html

" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ============== Editor behavior ===============
let mapleader=" "

syntax on 
filetype on
filetype indent on 
filetype plugin on
filetype plugin indent on 

set mouse=a " enable mouse 
set encoding=utf-8 
let &t_ut=''
set clipboard=unnamed

let autosave=20

set expandtab " transform tab to whitespaces
set tabstop=2 " 2 whitespaces for tab 
set softtabstop=2
" set list
set shiftwidth=2
set nocompatible
set number 
set relativenumber 
set cursorline 
"set wrap " automatically wrap a long line to several lines 
set nowrap
"set linebreak
set wrapmargin=2
set laststatus=2
set showcmd 
set showmatch
set wildmenu 
set hlsearch
set incsearch
set ignorecase
set smartcase
filetype indent on " check file type and use corresponding indent, eg for python file
set autoindent " next line indent be the same with the last line
" set spell spelllang=en_us
" set undofile
set autoread

noremap S :wa<CR>
noremap Q :q<CR>
noremap T :source $MYVIMRC<CR>
inoremap jk <Esc>
vnoremap oo <Esc>
" press space to enter insert mode
" nnoremap <Tab> i
"
" merge multi-line to one line: <C-j>
noremap <C-j> J 
noremap J 5j
noremap K 5k
noremap L 5l
noremap H 5h

" for C++, add ; in end of a line 
noremap <leader>; <Esc>$a;<Esc>

" ======= copy and paste with system clipboard ====
nnoremap <C-y> "+y
xnoremap <C-y> "+y
nnoremap <C-p> "+p
xnoremap <C-p> "+p


" ======= delete without copy ======
nnoremap d "_d
nnoremap x "_x
xnoremap d "_d
xnoremap x "_x
nnoremap <leader>d d
nnoremap <leader>x x
xnoremap <leader>d d
xnoremap <leader>x x
xnoremap <leader>p "_dP
" ================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w  
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ================== Tab management ====================
noremap <C-t> :tabnew<CR>

noremap ZZ :quitall<CR>
" ==================== My Extensions ======================
call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_section_warning=0

"Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'

" easy comment
Plug 'scrooloose/nerdcommenter'

" parenthesis highlight 
"Plug 'luochen1990/rainbow'
"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'jiangmiao/auto-pairs'

"Plug 'dense-analysis/ale'

" show file git status in nerdtree
"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

"Plug 'AndrewRadev/switch.vim'
"Plug 'gerazov/vim-toggle-bool'

" color theme 
Plug 'glepnir/oceanic-material'
"Plug 'Mofiqul/vscode.nvim'

" Multi-cursor 
Plug 'mg979/vim-visual-multi' 

" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
" Note: need to install rg 
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim' 
Plug 'kkharji/sqlite.lua'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
"Plug 'nvim-telescope/telescope-file-browser.nvim'

"
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

" For view git diff
Plug 'sindrets/diffview.nvim'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0 "disable keys of gitgutter

"NOTE: need to install ctags 
 "Plug 'preservim/tagbar' 

 " to highlight TODO comments
 Plug 'folke/todo-comments.nvim'

" debugger
 "Plug 'mfussenegger/nvim-dap'
 "Plug 'rcarriga/nvim-dap-ui'
 Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}

 " bookmarks
 Plug 'MattesGroeger/vim-bookmarks'
 "Plug 'Pocco81/auto-save.nvim'

" Sessions 
Plug 'Shatur/neovim-session-manager'

" greetting 
Plug 'goolord/alpha-nvim'

"lua << EOF
  "require("auto-save").setup {
		"-- your config goes here:
		"-- or just leave it empty :)
	"}
"EOF
" Plug 'Shougo/defx.nvim', {'do' : ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-icons'
" Plug 'kristijanhusak/defx-git'
" Plug 'connorholyday/vim-snazzy'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'dhruvasagar/vim-table-mode'

Plug 'simrat39/symbols-outline.nvim'

Plug 'voldikss/vim-floaterm'
"Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

" =============================== COC =======================================
let g:coc_global_extensions = [
        \'coc-json', 
        \ 'coc-html',
        \'coc-clangd', 
        \'coc-cmake',
        \'coc-vimlsp']
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set signcolumn=auto:2

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> M :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('M', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

 "==================== NERDTree ============
"noremap tt :NERDTree<CR>
"noremap ty :NERDTreeClose<CR>
"let g:NERDTreeGitStatusIndicatorMapCustom = {
                "\ 'Modified'  :'✹',
                "\ 'Staged'    :'✚',
                "\ 'Untracked' :'✭',
                "\ 'Renamed'   :'➜',
                "\ 'Unmerged'  :'═',
                "\ 'Deleted'   :'✖',
                "\ 'Dirty'     :'✗',
                "\ 'Ignored'   :'☒',
                "\ 'Clean'     :'✔︎',
                "\ 'Unknown'   :'?',
                "\ }

" =============== nvim-tree ==========
noremap tt :NvimTreeFindFile<CR>
noremap to :NvimTreeOpen<CR>
noremap ty :NvimTreeClose<CR>
lua require('plugin-config/nvim-tree')

" ============= treesitter =============
lua require('plugin-config/nvim-treesitter')


"==================== NerdCommenter ============
"noremap <c-/> <leader>c<space> 

" ===== oceanic_material ====
 set background=dark
colorscheme oceanic_material"

" ======== vscode.vim colorscheme ======
"lua require('plugin-config/vscode-nvim')


" ===== vim surround ======
"nnoremap ss  ySS{<CR>


" ===== telescope =====
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>init
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fm <cmd>Telescope vim_bookmarks all<cr>
nnoremap <leader>fn <cmd>Telescope frecency<cr>
nnoremap <leader>fg <cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>


" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua require('plugin-config/telescope')
" ==== puremourning/vimspector ====
let g:vimspector_enable_mappings = 'HUMAN'

function! s:generate_vimspector_conf()
  if empty(glob( '.vimspector.json' ))
    if &filetype == 'c' || 'cpp' 
      !cp ~/.config/nvim/vimspector_conf/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.config/nvim/vimspector_conf/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()

nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval
noremap si <Plug>VimspectorStepInto
noremap so <Plug>VimspectorStepOut
noremap su <Plug>VimspectorStepOver
noremap sb <Plug>VimspectorToggleBreakpoint
noremap sn <Plug>VimspectorJumpToNextBreakpoint
noremap sr <Plug>VimspectorRunToCursor
noremap sc <Plug>VimspectorContinue

" ======== session-manager =======
lua require('plugin-config/neovim-session-manager')

" greetings
lua require("alpha").setup(require("alpha.themes.dashboard").config)

" ======== diffview =======
nmap td :DiffviewOpen<CR>

" ======== markdown preview & table mode ====
let g:table_mode_corner='|'
nmap <LEADER>mp <Plug>MarkdownPreview

" ====== symbols-outline ======
lua require("plugin-config/symbols-outline")
lua require("symbols-outline").setup()

" ====== float term ======
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'
let g:floaterm_keymap_kill = '<F12>'
"noremap <LEADER> :FloatermNew --autoclose=0 gcc % -o %< && ./%<
noremap <LEADER>py :FloatermNew --autoclose=0 python %<CR> 
