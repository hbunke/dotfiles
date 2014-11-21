###startup Z-Shell

#autocompletion
setopt AUTOLIST
autoload -U compinit
compinit

autoload -U colors
colors

setopt extended_glob
setopt prompt_subst

# hidden from github; in addition getting platform infos
source $HOME/.zshrc_local


### VCS at prompt
autoload -Uz vcs_info
#zstyle ':vcs_info:*' debug true
zstyle ':vcs_info:*' enable hg svn git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
###example from zshcontrib(1)
#zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '

zstyle ':vcs_info:*' unstagedstr "%F{1}+%f"
#zstyle ':vcs_info:*' stagedstr "%F{1}+%f"
zstyle ':vcs_info:*' actionformats "%B%F{2}[%s|%F{1}%a%f]%%b%c%u "
zstyle ':vcs_info:*' formats '%B%F{2}[%s %b]%%b%c%u '
zstyle ':vcs_info:hg:*' hgrevformat '%r'
zstyle ':vcs_info:hg-git:*' hgrevformat '%r'

#export PS1='%B[%n@%m]:%~ $%b ${vcs_info_msg_0_}'
#export PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '

export PS1='%B[%n@%m]:%~ $%b ${vcs_info_msg_0_}'
#export PS1='%{$fg[green]%}%B[%n@%m]:%~ $%b ${vcs_info_msg_0_}'
#export PS1='%B[%n@%m]:%~ $%b '


#history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

case $TERM in
    xterm*)
    precmd () {
        print -Pn "\e]0;[%n@%m]: %~\a"
        vcs_info
    }
     ;;
esac

#setopt correct
setopt auto_cd
zstyle ':completion:*' menu select=2


### Roxterm can change color presets ###########################
#
#ROX_SERVER="dbus-send --session /net/sf/roxterm/Options \
#                    net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:HB"

ROX_TANGO="dbus-send --session /net/sf/roxterm/Options \
                    net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Tango"

ROX_SOLARIZED="dbus-send --session /net/sf/roxterm/Options \
                    net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:hb_solarized-dark"

ROX_SOLARIZED_LIGHT="dbus-send --session /net/sf/roxterm/Options \
                       net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:solarized-light"


alias rox-tango=$ROX_TANGO
alias rox-solarize=$ROX_SOLARIZED
alias rox-solarize-light=$ROX_SOLARIZED_LIGHT


############### Environment ####################################
export LANG=en_US.UTF-8
#export LANG=de_DE.UTF-8
export LC_COLLATE=POSIX

export PATH=$PATH:$HOME'/bin':$HOME'/.nix-profile/bin'

export EDITOR=vim
export HGEDITOR=vim

#PAGER
export PAGER="most -C"

# less can do colors ;-)
export LESS="-RSM~gIsw"

#export PYTHONSTARTUP=~/.pythonrc
export VISUAL=vim
export DATE=`date "+%Y%m%d.%H%M"`


################## ALIAS #######################################
alias ll='ls -lpaFh | most'
alias dir='ls -lLa | grep "^d"'
#alias su='su -m'
alias ping='ping -v'
alias gvim='gvim -p'
alias mutt='cd ~/mail && mutt'
alias vv='vim -M'
alias grep="grep --line-number --exclude-dir=.git --color=auto"
export GREP_COLOR="1;39"

#don't wanna modify pacman.conf for this
alias pacman='pacman --color auto'
alias top='htop'


########################OS Spezifika############################

OS=`uname`

if [[ $OS = Linux ]]; then
    alias ls='ls -p --color=always'
fi

if [[ $OS = FreeBSD ]]; then
    alias ls='ls -Gp'
fi

# hidden from github
source ~/.zshrc_local

#zsh highligting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

