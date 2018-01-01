" disable vi compatible
if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" XDG
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" {{{ dein
let s:dein_dir = s:cache_home . '/dein'

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = s:config_home . '/dein'
    "cache toml files
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

" path
let g:python_host_prog=$PYENV_ROOT.'/versions/2.7.14/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'
let g:ruby_host_prog=$RBENV_ROOT.'/versions/2.5.0/bin/neovim-ruby-host'
" }}} end dein

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso2022-jp,euc-jp,sjis
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
" 入力中のコマンドをステータスに表示する
set showcmd
"コマンド、検索パターンを50まで保存
set history=50
" クリップボード共有
set clipboard+=unnamedplus

" 表示系
" syntax有効化 (必ずdein#end()より後に書く)
syntax on
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
"ターミナルで256色表示を使う
set t_Co=256
"Unicodeで行末が変になる問題を解決
set ambiwidth=double
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" インデント系
" 行頭以外でのタブ文字の表示幅
set tabstop=4
" 行頭でのタブ文字の表示幅
set shiftwidth=4
" Tab文字を半角スペースにする
set expandtab
" 自動インデント
set autoindent
set smartindent

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 補完の際の大文字小文字の区別しない
set infercase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>

" 操作系
" キーマップ
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
noremap <Space>h  ^
noremap <Space>l  $
" jjでインサートモードを抜ける
inoremap <silent> jj <ESC>
" バックスペースキーで行頭を削除する
set backspace=indent,eol,start
" マウスホイールの有効化
set mouse=a

" 保存時に行末の空白を除去
function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    " 保存時にtabを4スペースに変換する
    %s/\t/    /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd MyAutoCmd BufWritePre * call <SID>remove_dust()

" Readonlyファイルの反転表示
function UpdateColorScheme()
    if &readonly && &buftype ==# ""
        colorscheme morning
    endif
endfunction
autocmd MyAutoCmd BufReadPost,BufEnter * call UpdateColorScheme()

" {{{ colorscheme
" line color for Iceberg
autocmd MyAutoCmd ColorScheme * highlight LineNr ctermfg=242
autocmd MyAutoCmd ColorScheme * highlight LineNr ctermbg=234

" background color for Iceberg
autocmd MyAutoCmd ColorScheme * highlight Normal ctermbg=none
autocmd MyAutoCmd ColorScheme * highlight EndOfBuffer ctermbg=none

" Constant for Iceberg
autocmd MyAutoCmd ColorScheme * highlight Constant ctermfg=179

" Function for Iceberg
autocmd MyAutoCmd ColorScheme * highlight Function ctermfg=180

" SpecialKey for Iceberg
autocmd MyAutoCmd ColorScheme * highlight SpecialKey ctermfg=21
autocmd MyAutoCmd ColorScheme * highlight Specialkey ctermbg=none

" Error for Iceberg
autocmd MyAutoCmd ColorScheme * highlight Error ctermbg=none

" colorscheme
colorscheme iceberg
hi clear CursorLine
" }}} end colorscheme

" 選択位置のSyntax情報を表示
"function! s:get_syn_id(transparent)
"  let synid = synID(line("."), col("."), 1)
"  if a:transparent
"    return synIDtrans(synid)
"  else
"    return synid
"  endif
"endfunction
"function! s:get_syn_attr(synid)
"  let name = synIDattr(a:synid, "name")
"  let ctermfg = synIDattr(a:synid, "fg", "cterm")
"  let ctermbg = synIDattr(a:synid, "bg", "cterm")
"  let guifg = synIDattr(a:synid, "fg", "gui")
"  let guibg = synIDattr(a:synid, "bg", "gui")
"  return {
"        \ "name": name,
"        \ "ctermfg": ctermfg,
"        \ "ctermbg": ctermbg,
"        \ "guifg": guifg,
"        \ "guibg": guibg}
"endfunction
"function! s:get_syn_info()
"  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
"  echo "name: " . baseSyn.name .
"        \ " ctermfg: " . baseSyn.ctermfg .
"        \ " ctermbg: " . baseSyn.ctermbg .
"        \ " guifg: " . baseSyn.guifg .
"        \ " guibg: " . baseSyn.guibg
"  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
"  echo "link to"
"  echo "name: " . linkedSyn.name .
"        \ " ctermfg: " . linkedSyn.ctermfg .
"        \ " ctermbg: " . linkedSyn.ctermbg .
"        \ " guifg: " . linkedSyn.guifg .
"        \ " guibg: " . linkedSyn.guibg
"endfunction
"command! SyntaxInfo call s:get_syn_info()
