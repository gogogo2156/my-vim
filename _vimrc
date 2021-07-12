"关闭兼容模式
set nocompatible

"模仿快捷键，如：Ctrl+A全选，Ctrl+C复制，Ctrl+V粘贴等
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"gvim字体设置
set guifont=新宋体:h16:cGB2312
"gvim内部编码 Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等。
set encoding=utf-8
"当前编辑的文件编码 Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也会将文件保存为这种字符编码方式 (不管是否新文件都如此)。
set fileencoding=utf-8
"gvim打开支持编码的文件
"Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。因此最好将 Unicode 编码方式放到这个列表的最前面，将拉丁语系编码方式 latin1 放到最后面
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latinl
"set langmenu=zh_CN                 "设置菜单语言
"let $LANG='zh_CN.UTF-8'
"解决consle输出乱码
language messages zh_CN.utf-8          "设置提示信息语言
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim    "导入删除菜单脚本，删除乱码的菜单
source $VIMRUNTIME/menu.vim          "导入正常的菜单脚本
"Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码方式。这个选项在 Windows 下对我们常用的 GUI 模式的 gVim 无效，而对 Console 模式的 Vim 而言就是 Windows 控制台的代码页，并且通常我们不需要改变它。
"设置终端编码为gvim内部编码encoding
let &termencoding=&encoding
"防止特殊符号无法正常显示
set ambiwidth=double
"缩进尺寸为4个空格
set shiftwidth=4
"tab宽度为4个字符
set tabstop=4
"编辑时将所有tab替换为空格
set expandtab
"按一次backspace就删除4个空格
set smarttab
"不生成备份文件
set nobackup
"开启行号标记
set number
"配色方案
colo desert
"关闭上侧工具栏
set guioptions-=T
"关闭右侧滚动条
"set guioptions-=r
"开启自动缩进
set autoindent

set softtabstop=4 
"set nrformats=

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g'):
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

