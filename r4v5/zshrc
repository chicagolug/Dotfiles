#.zshrc, created by r4v5 having ripped off a significant chunk from blcknight,
# who took a significant chunk from someone else, and fucked with by compinstall.

# i like color
autoload colors zsh/terminfo
autoload -Uz vcs_info
colors
setopt promptsubst
[ -d /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)

[ -z $HOSTNAME ] && HOSTNAME=`hostname -s`
# prompt colors, whut!
case $HOSTNAME in
  lenin)
	  HOSTCOLOR=green
	  ;;
  cubie*)
	  HOSTCOLOR=grey
	  ;;
  udoo)
	  HOSTCOLOR=white
	  ;;
  hippocampus)
	  HOSTCOLOR=cyan
	  ;;
  cortex*)
	  HOSTCOLOR=magenta
    ;;
  *)
    HOSTCOLOR=yellow
    ;;
esac

[[ $LOGNAME == "root" ]] && HOSTCOLOR=red

zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f'

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
      echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

PS1="%{$fg_bold[$HOSTCOLOR]%}%h%(?..(%?%)) %m %{$fg_bold[blue]%}%1d %#%b%o %{$terminfo[sgr0]%}"
RPS1=%B%(1j.%j|.)$'$(vcs_info_wrapper)'%t%b

# Keychain goodies
[ -f "$(which keychain)" ] && keychain -q $HOME/.ssh/*_[dr]sa
[ -f "${HOME}/.keychain/`hostname`-sh" ] && source $HOME/.keychain/`hostname`-sh

# if we've got lesspipe, it sure is nice to have
[[ -f lesspipe.sh ]] && export LESSOPEN="|lesspipe.sh %s"

alias -g '...'='../..'
alias -g '....'='../../..'
alias -g '.....'='../../../..'
alias -g '......'='../../../../..'
alias -g '.......'='../../../../../..'

alias -g L='|less'
alias -g G='|grep'
alias -g T='|tail'
alias -g H='|head'
alias -g N='&>/dev/null&'

[[ -f $(which screen) ]] && alias sc='screen -Ux'
[[ -f $(which tmux) ]] && alias sc='tmux attach'
alias psaux='ps -aux G'
alias cl='clear'
alias cls=cl
alias mv='nocorrect mv -i'      # no spelling correction on mv
[[ -f $(which rsync) ]] && alias cp='rsync --progress'
alias mkdir='nocorrect mkdir'	# no spelling correction on mkdir
[[ -f $(which vim) ]] && alias vi='vim'
[[ -f $(which mvim) ]] && alias vim='mvim -v'
alias pks='source ~/.zshrc'     # make .zshrc into function instantly
alias sl=ls

# LS Options.
alias ls="ls --color -F -b -h"
 alias ls="ls -F"

function ir { ps aux | grep $1 | grep -v grep }
function killit { killall -9 $1 }
function tz { tar -xzvf "$1" }
function bz { tar -xjvf $1 }

# AUTOMATIC ls on chpwd *if* directly isn't too big.
function chpwd {
	integer ls_lines="$(ls -C | wc -l)"
	if [ $ls_lines -eq 0 ]; then
	elif [ $ls_lines -le 18 ]; then
		ls
		echo "\e[1;32m} --[ Items: `ls | wc -l` \e[1;32m]--"
	fi
	}

bindkey -e

# ITYOOL 2014 I still need to define this
bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history

setopt nonomatch
setopt nohup

zstyle -e ':completion:*:ssh:*' hosts \
	'reply=($(sed -e "/^#/d" -e "s/ .*\$//" -e "s/,/ /g" \
			~/.ssh/known_hosts 2>/dev/null))'
zstyle -e ':completion:*:scp:*' hosts \
        'reply=($(sed -e "/^#/d" -e "s/ .*\$//" -e "s/,/ /g" \
	                        ~/.ssh/known_hosts 2>/dev/null))'

		
# Functions for displaying good stuff in a terminal title
case $TERM in
	xterm*|screen*|tmux*)
	precmd () {
		print -Pn "\033]0;%n@%m%#  %~ %l  %w :: %T\a" 
	}
	preexec () {
		print -Pn "\033]0;%n@%m%#  <$1>  %~ %l  %w :: %T\a" 
	}
	;;
esac

# Pyenv stuffs

[ -d "${HOME}/.pyenv" ] && export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

# golang
[ -d /usr/local/opt/go/libexec/bin ] && export PATH=$PATH:/usr/local/opt/go/libexec/bin

# The following lines were added by compinstall

# This is a lot of disk usage and time when you spawn a term in order to
# tab-complete man pages. Whether this is worthwhile is up to you.
[[ $HOSTNAME != "cubieboard" ]] || [[ $HOSTNAME != "udoo" ]] && {

compctl -f -x 'S[1][2][3][4][5][6][7][8][9]' -k '(1 2 3 4 5 6 7 8 9)' \
  - 'R[[1-9nlo]|[1-9](|[a-z]),^*]' -K 'match-man' \
  - 's[-M],c[-1,-M]' -g '*(-/)' \
  - 's[-P],c[-1,-P]' -c \
  - 's[-S],s[-1,-S]' -k '( )' \
  - 's[-]' -k '(a d f h k t M P)' \
  - 'p[1,-1]' -c + -K 'match-man' \
  -- man
}	      

zstyle ':completion:*' completer _list _complete _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=8
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/r4v5/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -f "$HOME/.rake_completion.zsh" ]] && source $HOME/.rake_completion.zsh

if [ $HOSTNAME == "mdonahue" ]
then
export DYLD_LIBRARY_PATH="/Applications/Oracle"
export SQLPATH="/Applications/Oracle"
export TNS_ADMIN="/Applications/Oracle"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH=$PATH:$DYLD_LIBRARY_PATH
export RC_ARCHS=i386
export INSTANT_CLIENT_DIRECTORY="/Applications/Oracle"
fi

# GNURadio/PyBOMBS initiation
[[ -f "$HOME/code/target/setup_env.sh" ]] && source "$HOME/code/target/setup_env.sh"

#this exists solely to clean up after failed resques
alias workerkill='ps -ef | grep "resque\|god\|server.pid" | grep -v grep | awk '"'"'{print $2}'"'"' | xargs kill -9'

## Friggin' TRAMP
[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
TZ="US/Central"
export TZ
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
