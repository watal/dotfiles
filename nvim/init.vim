" disable vi compatible
if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

augroup RemoveDust
  autocmd!
augroup END

" Leader
let mapleader = "\<Space>"

" Path
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let g:python_host_prog = expand('$PYENV_ROOT/shims/python2')
let g:python3_host_prog = expand('$PYENV_ROOT/shims/python3')
let g:loaded_perl_provider = 0

" {{{ dein
let s:dein_dir = s:cache_home . '/dein'

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = s:config_home . '/dein'
    " Cache Toml files
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}} end dein

" golang PATH
let g:go_bin_path = $GOPATH.'/bin'

filetype plugin indent on
syntax enable

" encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
scriptencoding utf-8
" ファイルフォーマットの識別
set fileformats=unix,dos,mac

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開く
set hidden
" 入力中のコマンドをステータスに表示
set showcmd
" コマンド、検索パターンを50まで保存
set history=50
" クリップボード共有
"let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard=unnamedplus

" 表示系
" 行番号を表示
set number
" 行末の一文字先までカーソルを移動可能に
set virtualedit=block,onemore
" 長い行を折り返して表示
set wrap
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest,full
set nowildmenu
" タイトルの表示
set title
" ルーラーの表示
set ruler
" タブや改行の表示
set nolist
"コマンドラインの高さ
set cmdheight=1
" 選択行のハイライト
set cursorline
"ターミナルで256色表示を使用
set t_Co=256
set termguicolors
" テキスト挿入中の自動折り返しを日本語に対応
set formatoptions+=mM
" filetypeをtexに
let g:tex_flavor = 'latex'
" 起動メッセージoff
set shortmess+=I

" インデント系
" 行頭以外でのタブ文字の表示幅
"set tabstop=4
" 行頭でのタブ文字の表示幅
"set shiftwidth=4
" 特定のファイル形式のみタブ設定を2文字に
"autocmd MyAutoCmd FileType javascript set tabstop=2 shiftwidth=2
"autocmd MyAutoCmd FileType ruby set tabstop=2 shiftwidth=2
"autocmd MyAutoCmd FileType html set tabstop=2 shiftwidth=2
"autocmd MyAutoCmd FileType css set tabstop=2 shiftwidth=2
"autocmd MyAutoCmd FileType yaml set tabstop=2 shiftwidth=2
" 自動インデント
set autoindent
set smartindent
" helpの日本語化
set helplang=ja,en
" helpを画面分割で開く
autocmd MyAutoCmd BufRead,BufEnter */doc/* if &buftype == 'help' | wincmd L | setl number | setl winfixwidth | vertical resize 86 | endif

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" 補完の際の大文字小文字の区別しない
set infercase
" 検索文字列入力時に順次対象文字列をハイライト
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>
" 置換対象を表示
if has('nvim')
    set inccommand=nosplit
endif
" 補完設定
set completeopt=menuone,longest

" 操作系
" キーマップ
inoremap <C-c> <Esc>
" nnoremap , \
noremap <Leader>h ^
noremap <Leader>l $
nnoremap <Leader>w :<C-u>w<CR>
nnoremap <Leader>q :<C-u>q<CR>
nnoremap Y y$
" 貼り付けたテキストの末尾へ移動
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" 画面分割関係
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
" terminalでESCによりNormalモードへ遷移
if has('terminal') || has('nvim')
    tnoremap <silent> <ESC> <C-\><C-n>
endif
" バックスペースキーで行頭を削除
set backspace=indent,eol,start
" マウスホイールの有効化
set mouse=a

" Quickfixのみならば終了
autocmd MyAutoCmd WinEnter * if (winnr('$') == 1 && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix') | quit | endif
" NERDTreeのみならば終了
autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | quit | endif

"" 保存時に行末の空白を除去
"function! s:remove_dust()
"    let cursor = getpos('.')
""     保存時に行末の空白を除去
"    keeppatterns %s/\s\+$//ge
""     保存時にtabを4スペースに変換
"    keeppatterns %s/\t/    /ge
"    call setpos('.', cursor)
"    unlet cursor
"endfunction
"autocmd RemoveDust BufWritePre * call <SID>remove_dust()
"autocmd MyAutoCmd filetype markdown autocmd! RemoveDust

autocmd MyAutoCmd QuickFixCmdPost *grep* cwindow

" 選択位置のSyntax情報を表示
" function! s:get_syn_id(transparent)
"   let synid = synID(line('.'), col('.'), 1)
"   if a:transparent
"     return synIDtrans(synid)
"   else
"     return synid
"   endif
" endfunction
" function! s:get_syn_attr(synid)
"   let name = synIDattr(a:synid, 'name')
"   let ctermfg = synIDattr(a:synid, 'fg', 'cterm')
"   let ctermbg = synIDattr(a:synid, 'bg', 'cterm')
"   let guifg = synIDattr(a:synid, 'fg', 'gui')
"   let guibg = synIDattr(a:synid, 'bg', 'gui')
"   return {
"        \ 'name': name,
"        \ 'ctermfg': ctermfg,
"        \ 'ctermbg': ctermbg,
"        \ 'guifg': guifg,
"        \ 'guibg': guibg}
" endfunction
" function! s:get_syn_info()
"   let baseSyn = s:get_syn_attr(s:get_syn_id(0))
"   echo 'name: ' . baseSyn.name .
"        \ ' ctermfg: ' . baseSyn.ctermfg .
"        \ ' ctermbg: ' . baseSyn.ctermbg .
"        \ ' guifg: ' . baseSyn.guifg .
"        \ ' guibg: ' . baseSyn.guibg
"   let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
"   echo 'link to'
"   echo 'name: ' . linkedSyn.name .
"        \ ' ctermfg: ' . linkedSyn.ctermfg .
"        \ ' ctermbg: ' . linkedSyn.ctermbg .
"        \ ' guifg: ' . linkedSyn.guifg .
"        \ ' guibg: ' . linkedSyn.guibg
" endfunction
" command! SyntaxInfo call s:get_syn_info()
