#!/bin/zsh
[[ -z "$PS1" ]] && return
# Username
export CAT="/Users/cat"
# Chinese environment
if [ -z "$DISPLAY" ] ; then
    export LANG="zh_CN.UTF-8"
else
    export LANG="en_US.UTF-8"
fi
date
# Path shrotcuts
hash -d S="$CAT/Source"
hash -d D="$CAT/Downloads"
hash -d GA="$CAT/Source/GoAgent"

# MacVim
if [[ -x "/usr/local/bin/mvim" ]]; then
	alias vim="mvim"
fi

# Shortcuts
alias sudo="sudo env PATH=$PATH"
alias s="sudo"
alias j="jobs -l"
alias v="vim"
alias e="emacs -nw --quick"
alias l="ls -CF"
alias ll="ls -alF"
alias la="ls -aF"
alias lq="ls -Q"
alias lh="ls -hF"
alias lr="ls -R"
alias lrs="ls -lrS"
alias lrt="ls -lrt"
alias lrta="ls -lrtA"
alias lm="la | more"
alias tf="tail -f"
# alias tree="tree -A -I 'CVS|*~'"

# modified commands
alias diff="colordiff"
alias more="less"
alias df="df -h"
alias du="du -c -h"
alias nano="nano -w"
alias ping="ping -c 5"
alias hideapp="echo 'NoDisplay=true' >> "
alias ax="axel -a -n 10"
alias vi="vim"
alias vis="s vim"
alias root="s su"
alias reboot="s reboot"
alias halt="s halt"
alias netcfg="s netcfg2"

# set files
alias rcc="vis /etc/rc.conf"
alias vrc="vis $CAT/.vimrc"
alias zrc="vis $CAT/.zshrc"
alias erc="vis $CAT/.emacs"
alias cdl="cd $CAT/Downloads"
alias cds="cd $CAT/Source"
alias cdg="cd $CAT/Source/Go-zh"
alias cdo="cd $CAT/Source/Go"
alias gdc="GOPATH='' godoc -http=:6060"
alias upenv=". ~/.zshrc"
alias enga="sudo launchctl load /Library/LaunchDaemons/org.goagent.macos.plist"
alias unga="sudo launchctl unload /Library/LaunchDaemons/org.goagent.macos.plist"
alias ga="/Users/cat/Source/GoAgent/local/goagent-osx.command"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -boolean true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -boolean false && killall Finder"
alias st='open -a "Sublime Text"'

# yum
alias yin="s yum install"
alias yrm="s yum remove"
alias yup="s yum upgrade"
alias ysh="s yum search"
alias yri="s yum reinstall"
alias ypv="s yum provides"
alias ycl="s yum clean"
alias yls="s yum list"
alias ymc="s yum makecache"

# apt-get
alias agin="s apt-get install"
alias agrm="s apt-get remove"
alias agup="s apt-get update && s apt-get upgrade"
alias agpg="s apt-get purge"
alias agac="s apt-get autoclean"
alias agar="s apt-get autoremove"
alias agsh="s apt-cache search"

# pacman & yaourt
alias pacup="s pacman -Syu"
alias yaoup="s yaourt -Syu"
alias pacrm="s pacman -Rsn"
alias yaorm="s yaourt -Rsn"
alias pacin="s pacman -S"
alias yaoin="s yaourt -S"
alias pacsh="s pacman -Ss"
alias yaosh="s yaourt -Ss"

# homebrew
alias brin="brew install"
alias brrm="brew remove"
alias brup="brew update && brew upgrade"
alias brsh="brew search"

# node npm
alias ndin="npm install -g"
alias ndrm="npm remove"
alias ndup="npm update"
alias ndsh="npm search"

# rp-pppoe
alias pc="s pppoe-start"
alias pd="s pppoe-stop"

# 文件打开
# Mac
alias -s html="open -a 'Google Chrome'"
alias -s pdf="open -a 'Adobe Reader'"
alias -s xml="open -a 'Google Chrome'"
alias -s texi="info"

# 全局别名
alias -g L="| less"
alias -g H="| head"
alias -g S="| sort"
alias -g T="| tail"
alias -g N="> /dev/null"
alias -g E="2> /dev/null"

# 自动补全
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# 补全缓存
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# 补全选项
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# 路径展开
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 3 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# 组匹配与描述
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

# 以下为compinstall添加
zstyle ':completion:*' completer _expand _complete _match
zstyle ':completion:*' completions 0
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 0
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+m:{a-z}={A-Z} r:|[._-]=** r:|=**' '' '' '+m:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' substitute 0
zstyle :compinstall filename "$CAT/.zshrc"

autoload -Uz compinit
compinit
# compinstall添加行结束

zstyle -d users
zstyle ':completion:*' users root cat
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
    named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs backup  bind  \
    dictd  gnats  identd  irc  man  messagebus  postfix  proxy  sys  www-data \
    avahi Debian-exim hplip list cupsys haldaemon ntpd proftpd statd

# zstyle ':completion:*' hosts $( cat $CAT/.hosts* )

zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:rmdir:*' file-sort time

# CD忽略上层目录
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# 环境变量
#[[ -z "$PS1" ]] && return

# Zsh 历史记录设置
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=$CAT/.zsh/hist
export SAVEHIST=10000
# setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# 命令提示符格式
PS1=$'%B%{\e[32m%}%n%{\e[31m%}@%{\e[35m%}%m %{\e[36m%}%~ %{\e[34m%}%# %{\e[33m%}> %b'

# 这些字符视为单词的一部分
WORDCHARS='*?_[]~=&;!#$%^(){}<>'

# 若命令执行时间超过30秒，则显示运行时间
export REPORTTIME=30

# less设置
if [[ -x $(which less) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    if [[ -x $(which lesspipe.sh) ]]
    then
	LESSOPEN="| lesspipe.sh %s"
	export LESSOPEN
    fi
fi

# 默认编辑器设置
if [[ -x $(which vim) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
else
    export EDITOR="emacs"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# 反馈其他用户的登录/注销
watch='notme'
export LOGCHECK=60

# 色彩设
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"

# zsh函数
# Quick ../../..
# rationalise-dot() {
#     if [[ $LBUFFER = *.. ]]; then
# 	LBUFFER+=/..
#     else
# 	LBUFFER+=.
#     fi
# }
# zle -N rationalise-dot
# bindkey . rationalise-dot

# 提供zz辅助
zz () {
    echo $*
    $* &> "/tmp/z-$1-$RANDOM" &!
}
alias 'z=echo $RANDOM > /dev/null; zz'

# 快速查找
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

# 当目录更改时将xterm标签置为“主机:目录”
chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
	sun-cmd) print -Pn "\e]l%~\e\\";;
        *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%m:%~\a";;
    esac
}

# 自动更改目录权限
chpwd () {
    case $PWD in
        $CAT/[Dd]ocuments*)
            if [[ $(umask) -ne 077 ]]; then
                umask 0077
                echo -e "\033[01;32mumask: private \033[m"
            fi;;
        */[Ww]eb*)
            if [[ $(umask) -ne 072 ]]; then
                umask 0072
                echo -e "\033[01;33mumask: other readable \033[m"
            fi;;
        /vol/nothing)
            if [[ $(umask) -ne 002 ]]; then
                umask 0002
                echo -e "\033[01;35mumask: group writable \033[m"
            fi;;
        *)
            if [[ $(umask) -ne 022 ]]; then
                umask 0022
                echo -e "\033[01;31mumask: world readable \033[m"
            fi;;
    esac
}
cd . &> /dev/null

# cd到当前目录下的随机目录
cdrand () {
	all=( *(/) )
	rand=$(( 1 + $RANDOM % $#all ))
	cd $all[$rand]
}

# extract
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1       ;;
      *.tar.gz)    tar xzf $1       ;;
      *.bz2)       bunzip2 $1       ;;
      *.gz)        gunzip $1        ;;
      *.rar)       unrar x $1       ;;
      *.tar)       tar xf $1        ;;
      *.tbz2)      tar xjf $1       ;;
      *.tgz)       tar xzf $1       ;;
      *.zip)       unzip -q $1      ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1          ;;
      *.xz)        unxz x $1        ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#ex() {
#    local c e i
#
#    (($#)) || return
#
#    for i; do
#        c=''
#        e=1
#
#        if [[ ! -r $i ]]; then
#            echo "$0: file is unreadable: \`$i'" >&2
#            continue
#        fi
#
#        case $i in
#        *.t(gz|lz|xz|b(2|z?(2))|a(z|r?(.(Z|bz?(2)|gz|lzma|xz)))))
#               c='tar xvf';;
#        *.7z)  c='7z x';;
#        *.Z)   c='uncompress';;
#        *.bz2) c='bunzip2';;
#        *.exe) c='cabextract';;
#        *.gz)  c='gunzip';;
#        *.rar) c='unrar x';;
#        *.xz)  c='unxz';;
#        *.zip) c='unzip';;
#        *)     echo "$0: unrecognized file extension: \`$i'" >&2
#               continue;;
#        esac
#
#        command $c "$i"
#        e=$?
#    done
#
#    return $e
#}

# color manuls
man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;37m") \
                LESS_TERMCAP_md=$(printf "\e[1;37m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[0;36m") \
                        man "$@"
}
# Proxy
gaproxy() {
	export all_proxy=http://127.0.0.1:8087/
	export ftp_proxy=$all_proxy
	export http_proxy=$all_proxy
	export https_proxy=$all_proxy
	export socks_proxy=$all_proxy
	export rsync_proxy=$all_proxy
}

ssproxy() {
	export all_proxy=http://127.0.0.1:1082/
	export ftp_proxy=$all_proxy
	export http_proxy=$all_proxy
	export https_proxy=$all_proxy
	export socks_proxy=$all_proxy
	export rsync_proxy=$all_proxy
}

unproxy() {
	unset all_proxy
	unset ftp_proxy
	unset http_proxy
	unset https_proxy
	unset socks_proxy
	unset rsync_proxy
}
# 打印一些素材
#if [[ -x `which fortune` ]]; then
#    echo
#    fortune -a 2> /dev/null
#fi
# zsh设置
#
# 关闭内核转储
limit coredumpsize 0
# 绑定为emacs风格按键
bindkey -e
# 设置DEL键为向后删除
bindkey "\e[3~" delete-char
# 历史补全
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
# C-x 列出序号
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu
# 帮助避免通配符错误删除
setopt RM_STAR_WAIT
# 当退出Shell时不结束后台运行任务
setopt AUTO_CONTINUE
# 输入目录自动进入
# setopt autocd
# 输入自动纠错
# setopt correctall
# 显示.文件
setopt globdots
# 不使用退出Shell
setopt ignoreeof
# 使用>!代替>重定向覆写已存在文件
setopt noclobber
# 不要精确的后台处理
setopt no_bg_nice

# 复制早期选中的命令
autoload copy-earlier-word
zle -N copy-earlier-word
bindkey '^[,' copy-earlier-word

# 在模糊补全间切换
autoload cycle-completion-positions
zle -N cycle-completion-positions
bindkey '^[z' cycle-completion-positions

# 增大整数参数值
autoload incarg
zle -N incarg
bindkey '^X+' incarg

# 写入全局文件到命令行
autoload insert-files
zle -N insert-files
bindkey '^Xf' insert-files

# 记录预定执行列表
autoload zsh/sched
autoload -U zargs
autoload zcalc
autoload zed
autoload zmv

# Java enviroments
export JAVAHOME="/usr/local/share/Java"
export PATH="$JAVAHOME/jre/bin:$JAVAHOME/bin:$PATH"
export CLASSPATH="$JAVAHOME/jre/lib:$JAVAHOME/lib"

# Intel Compiler Collection
#source /opt/intel/bin/compilervars.sh intel64

# Go enviroments
export GOROOT="$CAT/Source/Go-zh"
export GOPATH="$CAT/Source/Go-Path"
# export GOARCH_FINAL="$GOROOT"
# 386,amd64:darwin,linux,free/net/openbsd,windows|arm:linux|386:paln9
export GOARCH="amd64"
export GOOS="darwin"
# export GOHOSTARCH="$GOARCH"
# export GOHOSTOS="$GOOS"
# export GOARM="6"
export GOBIN="$GOROOT/bin"
export PATH="$GOPATH/bin:$GOBIN:$PATH"
# Go Building Test
Gobuildtest() {
	export GOROOT="$CAT/Source/Go"
	export GOARCH="amd64"
	export GOOS="darwin"
	export GOBIN=""
	export GOPATH=""
	cd $GOROOT/src
	./all.bash
	upenv
}

# Dart enviroments
export DART="/Users/cat/Source/Dart"
export PATH="$DART/dart-sdk/bin:$PATH"


# Racket enviroments
export RACKET="$CAT/.programs/racket"
export PATH="$RACKET/bin:$PATH"

# Eclipse enviroments
export PATH="$CAT/.programs/eclipse:$PATH"

# Texlive enviroments
export PATH="/usr/local/texlive/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/texmf/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/texmf/doc/info:$INFOPATH"

# Inferno mk enviroments
export PATH="$CAT/Source/inferno-os/MacOSX/386/bin:$PATH"

# Plan9port enviroments
export PLAN9="$CAT/Source/plan9port"
export PATH="$PATH:$PLAN9/bin"

# LLVM
export LLVM="$CAT/Source/LLVM"

# MMIX
export MMIX="$CAT/Source/mmix"
export PATH="$PATH:$MMIX"

# GAE
export GAE="$CAT/Source/GAE"
export APPDIR="$CAT/Source/Go-zh-cn"

# Homebrew
#export PATH="/usr/local/bin:$PATH"

# Ruby Gem
export PATH="$PATH:/usr/local/opt/ruby/bin"

# Depot Tools
export PATH="$CAT/Source/depot_tools:$PATH"

# Tmux
#test -z "$TMUX" && (tmux attach || tmux new-session)
