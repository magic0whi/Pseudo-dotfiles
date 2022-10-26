#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom alias start
alias ls='ls --color=auto -v'
alias ll='ls -l --color=auto -v'
alias la='ls -la --color=auto -v'
alias lh='ls -lah --color=auto -v'
alias grep='grep --color=auto'

alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias restart="sudo systemctl restart"
alias status="sudo systemctl status"
alias cp="cp -i --reflink=auto"
alias ssh="TERM=xterm-256color ssh"

# -l load math lib, -q is quiet
alias bc="bc -lq"
# Custom alias end

# -R print the control symbol in raw, -N show line number
export LESS="-R -N"

# Compress
alias tarxz='_tarxz(){ tar -cvf - $1 | xz -z -T4 - > $2; }; _tarxz'
alias targz="tar -Ipigz -cvf"

# -2 Force tmux to assume the terminal supports 256 colours.
alias tmux="tmux -2"

alias Rcs="sudo pacman -Rcs"
alias Ss="pacman -Ss"
alias Si="pacman -Si"
alias Sl="pacman -Sl"
alias Sg="pacman -Sg"
alias Qs="pacman -Qs"
alias Qi="pacman -Qi"
alias Qo="pacman -Qo"
alias Ql="pacman -Ql"
alias Qlp="pacman -Qlp"
alias Qm="pacman -Qm"
alias Qn="pacman -Qn"
alias U="sudo pacman -U"
alias Fo="pacman -Fo"
alias Fl="pacman -Fl"
alias Fy="sudo pacman -Fy"
alias Sy="sudo pacman -Sy"

# Clipboard
alias clipboard="xclip -selection clipboard"
alias Ci="clipboard -i"
alias Co="clipboard -o"
alias Copng="Co -target image/png"

# MPV
alias mpv='mpv --player-operation-mode=pseudo-gui'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Bash Shell coloring start
# Reset
Color_Off="\[\e[m\]"       # Text Reset

# Regular Colors
Black="\[\e[0;30m\]"        # Black
Red="\[\e[0;31m\]"          # Red
Green="\[\e[0;32m\]"        # Green
Yellow="\[\e[0;33m\]"       # Yellow
Blue="\[\e[0;34m\]"         # Blue
Purple="\[\e[0;35m\]"       # Purple
Cyan="\[\e[0;36m\]"         # Cyan
White="\[\e[0;37m\]"        # White

# Bold
BBlack="\[\e[1;30m\]"       # Black
BRed="\[\e[1;31m\]"         # Red
BGreen="\[\e[1;32m\]"       # Green
BYellow="\[\e[1;33m\]"      # Yellow
BBlue="\[\e[1;34m\]"        # Blue
BPurple="\[\e[1;35m\]"      # Purple
BCyan="\[\e[1;36m\]"        # Cyan
BWhite="\[\e[1;37m\]"       # White

# Underline
UBlack="\[\e[4;30m\]"       # Black
URed="\[\e[4;31m\]"         # Red
UGreen="\[\e[4;32m\]"       # Green
UYellow="\[\e[4;33m\]"      # Yellow
UBlue="\[\e[4;34m\]"        # Blue
UPurple="\[\e[4;35m\]"      # Purple
UCyan="\[\e[4;36m\]"        # Cyan
UWhite="\[\e[4;37m\]"       # White

# Background
On_Black="\[\e[40m\]"       # Black
On_Red="\[\e[41m\]"         # Red
On_Green="\[\e[42m\]"       # Green
On_Yellow="\[\e[43m\]"      # Yellow
On_Blue="\[\e[44m\]"        # Blue
On_Purple="\[\e[45m\]"      # Purple
On_Cyan="\[\e[46m\]"        # Cyan
On_White="\[\e[47m\]"       # White

# High Intensty
IBlack="\[\e[0;90m\]"       # Black
IRed="\[\e[0;91m\]"         # Red
IGreen="\[\e[0;92m\]"       # Green
IYellow="\[\e[0;93m\]"      # Yellow
IBlue="\[\e[0;94m\]"        # Blue
IPurple="\[\e[0;95m\]"      # Purple
ICyan="\[\e[0;96m\]"        # Cyan
IWhite="\[\e[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\e[1;90m\]"      # Black
BIRed="\[\e[1;91m\]"        # Red
BIGreen="\[\e[1;92m\]"      # Green
BIYellow="\[\e[1;93m\]"     # Yellow
BIBlue="\[\e[1;94m\]"       # Blue
BIPurple="\[\e[1;95m\]"     # Purple
BICyan="\[\e[1;96m\]"       # Cyan
BIWhite="\[\e[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\e[0;100m\]"   # Black
On_IRed="\[\e[0;101m\]"     # Red
On_IGreen="\[\e[0;102m\]"   # Green
On_IYellow="\[\e[0;103m\]"  # Yellow
On_IBlue="\[\e[0;104m\]"    # Blue
On_IPurple="\[\e[10;95m\]"  # Purple
On_ICyan="\[\e[0;106m\]"    # Cyan
On_IWhite="\[\e[0;107m\]"   # White
# Bash Shell coloring end

function _git_prompt() {
    # Git prompt
    source /usr/share/git/completion/git-prompt.sh
    PS1=${BGreen}'\u'${Color_Off}${BGreen}'@\h'${Color_Off}' '${BBlue}'\w'${Color_Off}' '${BCyan}' $(__git_ps1 "(%s)")'${Color_Off}' '${BGreen}'\$'${Color_Off}' '
}

[[ "${SHELL}" != "/bin/zsh" ]] && _git_prompt

export EDITOR=vim

# Using ripgrep in fzf
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m'
fi
