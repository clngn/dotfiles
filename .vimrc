"行番号の表示
"set number

"ステータスラインの設定
set laststatus=2
set statusline=%<%F\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y
set statusline+=%=%l,%c\ %P

"不可視文字の表示
set list
set listchars=tab:^_,trail:_,extends:>,precedes:<

"シンタックスカラー
syntax on
"colorscheme koehler
"colorscheme molokai
colorscheme desert

"インデント幅
set expandtab  "インデントは半角スペース
set tabstop=4
set shiftwidth=4
set softtabstop=0 "0の場合はtabstopで指定した値

"括弧のハイライト
set showmatch

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"インクリメンタルサーチ
"set incsearch

