"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _
" __ | \
" / | /
" \__ | \
" by Amix - http://amix.dk/
"
" Maintainer: Amir Salihefendic <amix3k at gmail.com>
" Version: 2.7
" Last Change: 12/10/06 00:09:21
"
" Sections:
" ----------------------
" *> General
" *> Colors and Fonts
" *> Fileformats
" *> VIM userinterface
" ------ *> Statusline
" *> Visual
" *> Moving around and tabs
" *> General Autocommands
" *> Parenthesis/bracket expanding
" *> General Abbrevs
" *> Editing mappings etc.
" *> Command-line config
" *> Buffer realted
" *> Files and backups
" *> Folding
" *> Text options
" ------ *> Indent
" *> Spell checking
" *> Plugin configuration
" ------ *> Yank ring
" ------ *> File explorer
" ------ *> Minibuffer
" ------ *> Tag list (ctags) - not used
" ------ *> LaTeX Suite things
" *> Filetype generic
" ------ *> Todo
" ------ *> VIM
" ------ *> HTML related
" ------ *> Ruby & PHP section
" ------ *> Python section
" ------ *> Cheetah section
" ------ *> Vim section
" ------ *> Java section
" ------ *> JavaScript section
" ------ *> C mappings
" ------ *> SML
" ------ *> Scheme bindings
" *> Snippets
" ------ *> Python
" ------ *> javaScript
" *> Cope
" *> MISC
"
" Tip:
" If you find anything that you can't understand than do this:
" help keyword OR helpgrep keywords
" Example:
" Go into command-line mode and type helpgrep nocompatible, ie.
" :helpgrep nocompatible
" then press <leader>c to see the results, or :botright cw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Myself
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"屏蔽s功能键
nnoremap s <nop>

"Set mapleader
"映射快捷键开始命令为,号 g:表示表示全局设置
let mapleader = ","
let g:mapleader = ","

nmap W  b

"add F3 for split current buffer to two window
"add F4 foe open a new tab for current buffer
map <F3> <esc>:split<cr>
"map <F4> <esc>:tabnew %<cr>
map <F4> <esc>:tabnew %<cr>:buffers<cr>:buffer
map <F2> <esc>:tabnew<cr>

"解决菜单乱码
set langmenu=zh_CN.UTF-8                 "设置菜单语言
source $VIMRUNTIME/delmenu.vim    "导入删除菜单脚本，删除乱码的菜单
source $VIMRUNTIME/menu.vim          "导入正常的菜单脚本
language messages zh_CN.utf-8          "设置提示信息语言


" adb logcat
au BufRead,BufNewFile *.logcat set filetype=logcat


let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth = 40
"let Tlist_Show_Menu=1
set tags=tags;

set autochdir



"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
"sm 打开wmtoggle窗口
nmap sm :WMToggle<cr>

"sl 打开taglist窗口
nmap <silent>sl :TlistOpen<cr>
nmap <silent>sk :TlistClose<cr>

"sc 关闭窗口
nmap sc :close<cr>

"sh 取消高亮显示搜索关键字
nmap <silent>sh :noh<cr>

"sj 打开ckfix窗口
"nmap <silent>sj :bot copen<cr>

"sk 关闭quickfix窗口
"nmap <silent>sk :cclose<cr>

"sp 上一个窗口
nmap sp :tabp<cr>

"sn 下一个窗口
nmap sn :tabn<cr>

"save use ctrl-s
inoremap <C-S> <esc>:w<cr>
nnoremap <C-S> :w<cr>

"设置tab键占4个位置显示为>---
set listchars=tab:>-,trail:-
set tabstop=4
set shiftwidth=4
set softtabstop=4


"设置vi在关闭后显示缓存内容，在vi中执行shell命令时特别有用
"set t_ti= t_te=

"-- omnicppcomplete setting --
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
let OmniCpp_DefaultNamespaces=["std"]

":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>



function! ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf


" Cut
vnoremap <C-X> "+x
vnoremap <BS> s

" Copy, use CTRL-Break to cancel an operation
vnoremap <C-C> "+y
inoremap <C-C> <Nop>

" Use CTRL-Q to do what CTRL-V used to do
noremap <unique><C-Q> <C-V>

" Paste, use CTRL-V
nnoremap <C-V> "+p
vnoremap <C-V> "+p
nnoremap ,<C-V> "+P
" Use Paste() to toggle 'paste' option, or the indent of the paste content
" will be a mess.
inoremap <C-V> <C-O>:call Paste("beforePaste")<CR>
      \<C-R>+<C-O>:call Paste("afterPaste")<CR>
cnoremap <C-V> <C-R>+

" Indent last pasted contents
nnoremap <F9> '[v']=']
inoremap <F9> <ESC>'[v']=']a

" Select all
noremap <C-A> ggVG
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Undo && Redo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Toggle paste options, make insert mode paste(Ctrl-V) behaves correctly.
function! Paste(mode)
  if a:mode == "beforePaste"
    let b:pasteOpt = &paste
    set paste
  elseif a:mode == "afterPaste"
    if !exists("b:pasteOpt")
      return
    endif
    let &paste = b:pasteOpt
    unlet b:pasteOpt
  endif
endfunction

nnoremap x "_x

set fileformat=unix

"auto load cscope.out file
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

if has("cscope")
	set cscopetagorder=0
	set cscopetag

	au BufEnter /* call LoadCscope()
endif

"no match case when auto complete
"set noignorecase

"let g:AutoComplePop_lgnoreCaseOption=0
"set ignorecase
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode.
"nocompatible是为了和VI保持最大的兼容，除非你经常用于远程终端，或者调试
"陌生的机械，否则就禁用掉好了，单机用户直接禁用好了.
set nocompatible

"Sets how many lines of history VIM har to remember
"保留历史命令个数，你用过什么命令，可以查到到
set history=50

"Enable filetype plugin
"为特定的文件类型允许插件文件的载入，比如代码识别，函数自动补全
filetype plugin on
"下面这个是文件缩进的支持，打开不同类型的文件会自动匹配不同的格式
"如果已经作了设置的话
filetype indent on

"Set to auto read when a file is changed from the outside
"如果文件在外部被其他程序修改了，那么vim会自动读入这种修改，而不用关闭再打开
set autoread

"Have the mouse enabled all the time:
"允许使用鼠标
set mouse=a

"Fast saving
",w命令替换:w!命令
",f命令替换:find命令
"nmap 表示在普通状态下
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
nmap <leader>q :q!<cr>
nmap <leader>e :e!<cr>

"Fast reloading of the .vimrc
"VIM的配置文件名字就是vimrc,位于你的磁盘的某个位置,一般
""来说,Windows位于安装位置或者你的个人配置文件夹,比如我的配置
"文件所在的绝对路径就是
map <leader>s :source ~/.vimrc<cr>

"Fast editing of .vimrc
",这是快速打开配置文件
"map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
"autocmd bufwritepost .vimrc source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"Set font to Monaco 10pt
"这段是个小脚本,针对不同的系统,使用不同的字体,如果你使用了
""不同的操作系统,这段脚本很有用,或者需要经常带着配置文件,调试不同
"的机器,也有用,否则,就不需要了,GUI版本可以直接在菜单里设置:
"if MySys() == "mac"
"set gfn=Bitstream\ Vera\ Sans\ Mono:h14
"set nomacatsui
"set termencoding=macroman
"elseif MySys() == "linux"
set gfn=Monospace\ 11
"endif


"在GUI界面下,set guioptions-=T表示不显示工具栏,工具栏
"确实没有什么大用处.psc_style没有查到是什么东东,看名字也应该是
""个自定义的参数.colorscheme是配色方案,配色方案名称是ps_color
"如果你想更多配色方案选择,可以至官网下载
""最后两句是默认设置的配色方案和背景.配色的选择,自己喜欢就好了,
"不需要用作者的
if has("gui_running")
set guioptions-=T
let psc_style='cool'
"colorscheme ron
else
set background=dark
"colorscheme torte
endif
colorscheme desert         " 设定配色方案



"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
""根据不同的文件类型,配置不同的语法文件.还记得吗?<leader>前面
"设置为","号的.syntax表示语法.syncbind这个比较有趣,它表示强
""制所有 'scrollbind' 窗口具有相同的相对偏移。即：当一个窗口滚
"屏到了它缓冲区的顶部时，所有的 'scrollbind'窗口都会滚屏到它们
""缓冲区的顶部。这段设置,请根据你使用的程序做设置
"fromstart我没有查到这个功能,根据意思,我估计为作者留下的给用户
""算定配置的地方
map <leader>1 :set syntax=cpp<cr>
map <leader>2 :set syntax=java<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart "自动匹配用户读入的程序文件

"Highlight current
if has("gui_running")
set cursorline
hi cursorline guibg=#333333
set cursorcolumn
hi CursorColumn guibg=#333333
endif  "保存一下,是不是超酷的效果啊,颜色请自行配置,一定要和背景色有反差

"Omni menu colors
""译注:这两句我自己都没有加,没有什么用,设置菜单项颜色的,我还是觉得
"原装色好.喜欢的兄弟,自己调着玩吧
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos,mac "设置文件类型,是UNIX文件,DOS文件还是Mac文件

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" 设置文件支持DOS文件格式或者UNIX文件格式,
"和上面的放在一起说,如果只是用Windows系统,那就可以无视这一小节
""了.如果你需要经常调试不同的系统,那么就需要这个了


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
"scrolloff光标上下两侧最少保留的屏幕行数,简单来说,就是把光标始终
""固定在屏幕大概约中间的位置,上下至少留七行,这样翻页的时候不会混乱,很实用的功能
set scrolloff=3

"Turn on WiLd menu
"命令行补全以增强模式运行.就是屏幕下方的命令行状态里,不设置时
"“命令补全需要按Tab键,设置后不需要按Tab键,也会尽可能多的匹配对应项.
set wildmenu

"Always show current position
set ruler

"The commandbar is 1 high
set cmdheight=2

"Show line number
set number

"Do not redraw, when running macros.. lazyredraw
set lazyredraw

"Change buffer - without saving
set hidden

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
let curdir = substitute(getcwd(), '/home/xu', "~", "g")
return curdir
endfunction

"Format the statusline
"状态栏的格式化.
"“F    缓冲区的文件完整路径。
"“m    修改标志位，若开始修改文本显示为 "[+]"；若 'modifiable' 关闭则是 "[-]"。’modifialbe’也是一个选项.表示如果关闭，缓冲区的内容不能修改。
"“r    只读标志位，文本是 "[RO]"
"“h    帮助缓冲区标志位，文本是 "[help]"
"“w    预览窗口标志位，文本是 "[Preview]"。
"“%{CurDir()}调用前面的getcwd(),用于显示前面的完整路径,如果上一段舍弃了,这里
"“直接用%{getcwd()}来代替.PS:我就是这样用的.
"“l    行号
"“c    列号。
"“L    缓冲区里的行数
"“数量繁多的”/ “是转义符,转义空格的.
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c



""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
let l:saved_reg = @"
execute "normal! vgvy"
let l:pattern = escape(@", '\\/.*$^~[]')
let l:pattern = substitute(l:pattern, "\n$", "", "")
if a:direction == 'b'
execute "normal ?" . l:pattern . "^M"
else
execute "normal /" . l:pattern . "^M"
endif
let @/ = l:pattern
let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
"map <c-space> ?

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Actually, the tab does not switch buffers, but my arrows
"Bclose function ca be found in "Buffer related" section
"map <leader>bd :Bclose<cr> "bd命令快速关闭当前缓冲区文件
"map <down> <leader>bd "向下的方向键映射,bd也就是把上一个命令进一步简化
"Use the arrows to something usefull
"map <right> :bn<cr> "右方向键切换到下一个缓冲区文件
"map <left> :bp<cr>  "左方向键切换到上一个缓冲区文件

"Tab configuration
"将当前内容在新标签中打开
map <leader>tn :tabnew %<cr>

"打开空白新标签
map <leader>te :tabedit<cr>

"关闭当前标签
map <leader>tc :tabclose<cr>

":移动当前标签,使用方法为
":tabmove [N]把当前标签页移到第N个标签页之后.
"用0使用当前标签页成为首个标签页.如果没有N,
"当前标签页成为最后一个.
map <leader>tm :tabmove


"try和endtry是成对出现的,可以简单理解为循环命令,
""主要功能是用来做错误处理的.
"set switchbuf=usetab
""这里表示不断尝试在编译时跳到打开的包含指定缓冲区
"的窗口(如果有的话)。
""具体的使用方法,请参照quickfix.
"set showtabline=2
""这里表示永远显示带有标签页标签的行
"        本选项的值指定何时显示带有标签页标签的行:
"        "                0: 永远不会
"        "                1: 至少有两个标签页时才会
"        "                2: 永远会
"
"try
"set switchbuf=usetab
"set stal=2
"catch
"endtry

"set tabstop=4

"Moving fast to front, back and 2 sides Wink
"编辑模式下,使用Alt+$,可以立刻跳到编辑行的尾部继续编辑
imap <m-$> <esc>$a

"编辑模式下,使用ALT+0,可以立刻跳到编辑行的首部继续编辑
" <esc>0i是Mac下的,意义相同""imap  <esc>$a和imap
imap <m-0> <esc>0i

imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
"切换到当前目录
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a><esc>`<i<<esc>

"Map auto complete of (, ", ', [
"inoremap $1 ()<esc>:let leavechar=")"<cr>i
"inoremap $2 []<esc>:let leavechar="]"<cr>i
"inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
"inoremap $3 {}<esc>:let leavechar="}"<cr>i
"inoremap $q ''<esc>:let leavechar="'"<cr>i
"inoremap $w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Amir Salihefendic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
"用0来替换^号,使跳到行首使用0命令
"map 0 ^

"Move a line of text using control
"普通模式下,<M-j>调整当前行往下一行,<M-k>调整当前行往上一行
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z

"可视模式下,<M-j>调整当前行往下一行,<M-k>调整当前行往上一行
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if MySys() == "mac"
"nmap <D-j> <M-j>
"nmap <D-k> <M-k>
"vmap <D-j> <M-j>
"vmap <D-k> <M-k>
"endif

func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"使用弹出菜单来显示可能的补全,命令行下<C-i>弹出
set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
let cwd = getcwd()
return "e " . cwd
endfunc

func! DeleteTillSlash()
let g:cmd = getcmdline()
if MySys() == "linux" || MySys() == "mac"
let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
else
let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
endif
if g:cmd == g:cmd_edited
if MySys() == "linux" || MySys() == "mac"
let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
else
let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
endif
endif
return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
"map <c-q> :sb

"Open a dummy buffer for paste
"在指定目录下创建一个临时文件
"map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
"恢复文件到上次编辑时的位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Buffer - reverse everything ... Smile
" 对全文使用Rot13进行简单加密
"map <F9> ggVGg?

" Don't close window, when deleting a buffer
" 删除一个缓冲区文件时,不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif

if bufnr("%") == l:currentBufNum
new
endif

if buflisted(l:currentBufNum)
execute("bdelete! ".l:currentBufNum)
endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
""译注:backup或者bk,使用备份,nobackup或者nobk关闭备份.
"覆盖文件前创建一个备份。文件成功写入后保留该备份。
""如果你不想保留备份文件，但希望写入期间能有备份，
"复位该选项并置位 'writebackup' 选项(这是缺省行为)。
""如果你完全不想要备份文件，同时复位两个选项 (如果你的文 "件系统差不多满了，这会有用)。
set nobackup

"wb就是writebackup见上
set nowb

"缓冲区不使用交换文件
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
":关闭折叠,这个功能,个人的看法不同,有人觉得折叠特别有用,
"  "有人觉得这就是个废柴功能(比如作者),具体大家自己斟酌吧.
set nofen
set foldmethod=indent
"设置折叠级别: 高于此级别的折叠会被关闭。
""设置此选项为零关闭所有的折叠。更高的数字关闭更少的折叠。
set fdl=10


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插入模式里: 插入 <Tab> 时使用合适数量的空格。
""如果 'autoindent' 打开，'>' 和 '<' 命令使用空格进行缩进。
"'expandtab' 打开时，要插入实际的制表，可用 CTRL-V<Tab>。
"set expandtab

"设置自动缩进为4
"set shiftwidth=4

"设置<leader>t2为自动缩进2格
"map <leader>t2 :set shiftwidth=2<cr>

"设置<leader>t4为自动缩进4格
"map <leader>t4 :set shiftwidth=4<cr>

":类似于:set，但只设置局部于当前缓冲区或者窗口的值。
""本句表示设置以下文件html,python,vim,javacript的自动缩进为2
"au FileType html,python,vim,javascript setl shiftwidth=2
"au FileType html,python,vim,javascript setl tabstop=2
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4

"设置java的自动缩进为4
au FileType java setl shiftwidth=4

"设文件里的 <Tab> 代表的空格数为4.tabstop默认设置为8
au FileType java setl tabstop=4

set smarttab
set lbr
set tw=500

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

"Wrap lines
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Vim Grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
let Grep_Cygwin_Find = 1

""""""""""""""""""""""""""""""
" => Yank Ring
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>

""""""""""""""""""""""""""""""
" => File explorer
""""""""""""""""""""""""""""""
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=35

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0


""""""""""""""""""""""""""""""
" => Minibuffer
""""""""""""""""""""""""""""""
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 2
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

"let g:bufExplorerSortBy = "name"

"autocmd BufRead,BufNew :call UMiniBufExplorer




""""""""""""""""""""""""""""""
" => LaTeX Suite things
""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='xpdf'

"Bindings
autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

"Auto complete some things Wink
autocmd FileType tex inoremap $i \indent
autocmd FileType tex inoremap $* \cdot
autocmd FileType tex inoremap $i \item
autocmd FileType tex inoremap $m \[<cr>\]<esc>O


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Todo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

""""""""""""""""""""""""""""""
" => VIM
""""""""""""""""""""""""""""""
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>


""""""""""""""""""""""""""""""
" => HTML related
""""""""""""""""""""""""""""""
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1


""""""""""""""""""""""""""""""
" => Ruby & PHP section
""""""""""""""""""""""""""""""
autocmd FileType ruby map <buffer> <leader><space> :w!<cr>:!ruby %<cr>
autocmd FileType php compiler php
autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
"Run the current buffer in python - ie. on leader+space
"au FileType python so ~/vim_local/syntax/python.vim
"autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
"autocmd FileType python so ~/vim_local/plugin/python_fold.vim

"Set some bindings up for 'compile' of python
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"Python iMaps
au FileType python set cindent
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $s self
au FileType python inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $d """<cr>"""<esc>O

"Run in the Python interpreter
function! Python_Eval_VSplit() range
let src = tempname()
let dst = tempname()
execute ": " . a:firstline . "," . a:lastline . "w " . src
execute ":!python " . src . " > " . dst
execute ":pedit! " . dst
endfunction
au FileType python vmap <F7> :call Python_Eval_VSplit()<cr>

""""""""""""""""""""""""""""""
" => Cheetah section
"""""""""""""""""""""""""""""""
autocmd FileType cheetah set ft=xml
autocmd FileType cheetah set syntax=cheetah

"""""""""""""""""""""""""""""""
" => Vim section
"""""""""""""""""""""""""""""""
autocmd FileType vim set nofen

"""""""""""""""""""""""""""""""
" => Java section
"""""""""""""""""""""""""""""""
"au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi

"Java comments
"autocmd FileType java source ~/.vim/plugin/jcommenter.vim
"autocmd FileType java let b:jcommenter_class_author='Amir Salihefendic (amix@amix.dk)'
"autocmd FileType java let b:jcommenter_file_author='Amir Salihefendic (amix@amix.dk)'
"autocmd FileType java map <buffer> <F2> :call JCommentWriter()<cr>

"Abbr'z
autocmd FileType java inoremap <buffer> $pr private
autocmd FileType java inoremap <buffer> $r return
autocmd FileType java inoremap <buffer> $pu public
autocmd FileType java inoremap <buffer> $i import
autocmd FileType java inoremap <buffer> $b boolean
autocmd FileType java inoremap <buffer> $v void
autocmd FileType java inoremap <buffer> $s String

"Folding
function! JavaFold()
setl foldmethod=syntax
set foldlevel=100
syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

function! FoldText()
return substitute(getline(v:foldstart), '{.*', '{...}', '')
endfunction
setl foldtext=FoldText()
endfunction
au FileType java call JavaFold()
au FileType java setl fen

au BufEnter *.sablecc,*.scc set ft=sablecc

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"au FileType javascript so ~/.vim/plugin/javascript.vim
function! JavaScriptFold()

setl foldmethod=syntax
setl foldlevelstart=100
syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

function! FoldText()
return substitute(getline(v:foldstart), '{.*', '{...}', '')
endfunction
setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi
au FileType javascript setl nocindent
au FileType javascript inoremap <buffer> $r return

au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka


""""""""""""""""""""""""""""""
" => HTML
"""""""""""""""""""""""""""""""
au FileType html,cheetah set ft=xml
au FileType html,cheetah set syntax=html


""""""""""""""""""""""""""""""
" => C mappings
"""""""""""""""""""""""""""""""
"autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>


"""""""""""""""""""""""""""""""
" => SML
"""""""""""""""""""""""""""""""
autocmd FileType sml map <silent> <buffer> <leader><space> <leader>cd:w<cr>:!sml %<cr>


""""""""""""""""""""""""""""""
" => Scheme bidings
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scm map <buffer> <leader><space> <leader>cd:w<cr>:!petite %<cr>
autocmd BufNewFile,BufRead *.scm inoremap <buffer> <C-t> (pretty-print )<esc>i
autocmd BufNewFile,BufRead *.scm vnoremap <C-t> <esc>`>a)<esc>`<i(pretty-print <esc>


""""""""""""""""""""""""""""""
" => SVN section
"""""""""""""""""""""""""""""""
"map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg


""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""
"You can use <c-j> to goto the next <++> - it is pretty smart Wink

"""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""
autocmd FileType python inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<cr>
autocmd FileType python inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<cr>
autocmd FileType python inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<cr>
autocmd FileType python inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<cr>
autocmd FileType python inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<cr>


"""""""""""""""""""""""""""""""
" => JavaScript
"""""""""""""""""""""""""""""""
autocmd FileType cheetah,html,javascript inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("function <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
autocmd filetype cheetah,html,javascript inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
autocmd FileType cheetah,html,javascript inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
autocmd FileType cheetah,html,javascript inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>


"""""""""""""""""""""""""""""""
" => HTML
"""""""""""""""""""""""""""""""
autocmd FileType cheetah,html inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<cr>
autocmd FileType cheetah,html inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<cr>
autocmd FileType cheetah,html inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<img src="<++>" alt="<++>" />')<cr>
autocmd FileType cheetah,html inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<cr>
autocmd FileType cheetah,html inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<cr>
autocmd FileType cheetah,html inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><cr><++><cr></<++>>")<cr>


"""""""""""""""""""""""""""""""
" => Java
"""""""""""""""""""""""""""""""
autocmd FileType java inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("public<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
autocmd FileType java inorea <buffer> cfunpr <c-r>=IMAP_PutTextWithMovement("private<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
autocmd FileType java inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
autocmd FileType java inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
autocmd FileType java inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>
autocmd FileType java inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++> <++> {\n<++>\n}")<cr>
autocmd FileType java inorea <buffer> cmain <c-r>=IMAP_PutTextWithMovement("public static void main(String[] argv) {\n<++>\n}")<cr>


"Presse c-q insted of space (or other key) to complete the snippet
"imap <C-q> <C-]>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
map <silent> <leader>h :noh<cr>

"Orginal for all
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>
"map <leader>c :botright cw 10<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>

""""""""""""""""""""""""""""""""""""""
"相当于grep 功能的插件
""""""""""""""""""""""""""""""""""""""
"递归查询
let Grep_Default_Filelist = '*.[chS]'
nnoremap <silent><F5> :Rgrep<CR>

"在当前文件夹下面查找
"nnoremap <silent><F6> :GrepBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
"set pastetoggle=<F3>

"Remove indenting on empty lines
"map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
" *> Link
" => Anchor
function! SmartTOHtml()
TOhtml
try
%s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
%s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
%s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
catch
endtry
exe ":write!"
exe ":bd"
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"self configration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"让vim显示和删除行尾的空格
highlight WhitespaceEOL term=standout
match WhitespaceEOL /\s\+$/

let s:end_space_flag = 0
function LineEndSpaceShowTrrige()
	if s:end_space_flag == 0
		let s:end_space_flag = 1
		exe ":highlight WhitespaceEOL ctermbg=red guibg=red"
		echo "show line end space!"
	else
		let s:end_space_flag = 0
		exe ":highlight clear WhitespaceEOL"
		echo "hide line end space!"
	endif
endfunction

nnoremap <silent><F7> :call LineEndSpaceShowTrrige()<CR>
nnoremap <F8> :%s/\s\+$//g<CR>


"sj 开关quickfix窗口
"let s:quickfix_flag = 0
"function QuickfixTrrige()
"	if s:quickfix_flag == 0
"		let s:quickfix_flag = 1
"		exe ":bot copen"
"	else
"		let s:quickfix_flag = 0
"		exe ":cclose"
"	endif
"endfunction
"nnoremap <silent>sj :call QuickfixTrrige()<cr>
nnoremap <silent>sj :bot copen<cr>

"use tab and shift tab for indent
vnoremap <tab> ><esc>
vnoremap <S-tab> <<esc>

"use ctrl+f to find keyword in all opend buferr
noremap <silent><C-f> :GrepBuffer<CR>

"use F6 to ctags the current file
noremap <F6> :!ctags --c++-kinds=+p --fields=+iaS --extra=+q %<CR><CR>

