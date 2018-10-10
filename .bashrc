# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi


alias ls='ls --color=auto'
alias ll="ls -l --color=auto"
alias blh="bl hight"
alias bll="bl low"
alias blm="bl middle"
alias grep='grep --colour=auto'
alias clock='date'

# 打开bluetooth
alias blue='service bluetooth restart'

# 刻意练习-英语
alias dp='/root/lib/deiliberate_practice/english/word.rb'
alias lex='/root/lib/deiliberate_practice/english/lex.rb'

# Aio
alias aio='/root/lib/aio/aio_setup.rb'

# Shadowsock 科学上网
alias surfing='nohup sslocal -c ~/.shandowsocks_sslocl_config.json >/dev/null 2>&1 &'

# 自己的回收站
alias rm='sh /etc/trash.sh trash'
alias r='sh /etc/trash.sh trash'
alias rl='sh /etc/trash.sh ls'
alias rls='sh /etc/trash.sh ls'
alias rll='sh /etc/trash.sh ll'
alias ru='sh /etc/trash.sh undelfile'
alias rd='sh /etc/trash.sh delfile'
alias cleartrash='sh /etc/trash.sh cleartrash'
alias cleartrash_direct='sh /etc/trash.sh cleartrash_direct'

# 关闭vim Ctrl+q 挂起功能
stty -ixon
# rvm 启动工具
source /etc/profile.d/rvm.sh

# rvm gem 编码问题
# https://stackoverflow.com/questions/4975973/gem-update-unable-to-convert-xe7-to-utf-8-in-conversion-from-ascii-8bit-to-u
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
unset LC_ALL

export PS1="\[\e]0;\u@\h: \w\a\]\${debian_chroot:+(\$debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]# "
