HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
export HISTSIZE SAVEHIST HISTFILE

source ~/.vars # local exports

if [ "$ARCH" = "Linux" ]
then
  alias ls='ls -F --color=auto'
fi
if [ "$ARCH" = "FreeBSD" -o "$ARCH" = "Darwin" ]
then
  export CLICOLOR=1 # ls with colors
  alias ls='ls -F'
fi


alias x='xscreensaver-command -l'

###############################################################

bindkey -e

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt AUTO_CD

PS1=$'%{\e[0;33m%}%33<...<%~ %# '
RPS1=$'%(?,%{\e[0;35m%}%n%{\e[0;34m%}@%{\e[0;37m%}%m,%{\e[0;31m%}%BErr %?%b) %{\e[0;36m%}%B%T%b%{\e[0;0m%}'
case $TERM in
   xterm*)
     precmd () { print -Pn "\e]0;%(?,,!! %? )%m%# %~\a" }
     preexec () { print -Pn "\e]0;%m%# $1\a" }
       ;;  
  screen*)
     precmd () {
       err=$?
       if [ $err -ne 0 ]; then
         print -Pn "\033k!! $err %~\033\\" # screen
         print -Pn "\e]0;!! $err %m%# %~\a" # title
       else
         print -Pn "\033k%~\033\\" # screen
         print -Pn "\e]0;%m%# %~\a" # title
       fi
       unset err
     }
     preexec () {
       print -Pn "\e]0;%m%# $1\a"
       print -Pn "\033k$1\033\\"
     }
     ;;
esac

autoload compinit
compinit
autoload nslookup
setopt CORRECT
setopt MAGIC_EQUAL_SUBST
setopt AUTO_LIST
setopt MENU_COMPLETE
setopt COMPLETE_ALIASES
setopt AUTO_PARAM_SLASH
setopt AUTO_PARAM_KEYS
setopt COMPLETE_IN_WORD
setopt LIST_TYPES 
setopt LIST_PACKED
zstyle ':completion:*' menu select=10
zstyle ':completion:*' use-compctl false
hosts=( alpha.linkea.org ectoplasme.linkea.org voyager.linkea.org trololo.linkea.org taudis.cumulogranite.fr copilote.cumulogranite.fr pied-a-terre.cumulogranite.fr bacasable.cumulogranite.fr secouriste.cumulogranite.fr neuroexe.com host.neuroexe.com rocketpoets.net mail.linkea.org beta.linkea.org )
zstyle ':completion:*' hosts $hosts
zstyle ':completion:*' format $'%{\e[0;32m%}-=> %{\e[0;32m%}%B%d%b%{\e[0;0m%}'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' verbose true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*' 'r:|[ ._-]=* r:|=*'
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:processes' list-colors '=(#b)(?????)(#B)?????????????????????????????????([^ ]#/)#(#b)([^ /]#)*=00=01;31=01;33'

