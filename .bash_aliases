# mkdir and cd to it
mcd() { mkdir -pv "$1" && cd "$1"; }
mvdir()
{
    dir="$2" # include a / at the end to indicate directory (not filename)
    tmp="$2"; tmp="${tmp: -1}"
    [ "$tmp" != "/" ] && dir="$(dirname "$2")"
    [ -a "$dir" ] ||
    mkdir -p "$dir" &&
    mv "$@"
}

# allow sudo commands to use .basrhc aliases
alias sudo='sudo '

if [ $UID -ne 0 ]; then
  alias reboot='sudo reboot'
  alias shutdown='sudo shutdown'
  alias dmesg='sudo dmesg -H -L'
  alias snap='sudo snap'
  alias dpkg='sudo dpkg'
  alias apt='sudo apt'
  alias apt-get='sudo apt-get'
  alias fdisk='sudo fdisk'
fi

# docker
# show docker container names, ips and ports
alias dcips=$'docker inspect -f \'{{.Name}}-{{range  $k, $v := .NetworkSettings.Networks}}{{$k}}-{{.IPAddress}} {{end}}-{{range $k, $v := .NetworkSettings.Ports}}{{ if not $v }}{{$k}} {{end}}{{end}} -{{range $k, $v := .NetworkSettings.Ports}}{{ if $v }}{{$k}} => {{range . }}{{ .HostIp}}:{{.HostPort}}{{end}}{{end}} {{end}}\' $(docker ps -aq) | column -t -s-'
alias dcp='docker-compose -f ~/docker-compose.yml '
# tail last 50 lines of docker logs
alias dtail='docker logs -tf --tail=50 '
# remove unused images (useful after an upgrade)
alias dprune='docker image prune'
alias dc='docker-compose'

alias untar='tar -xzvf'
alias wget='wget -c'
alias lsblk='lsblk -e7' # exclude loop (snap) device
alias ls='ls -h'
alias getpass='openssl rand -base64 20'
alias count='ls | wc -l'
alias sha='shasum -a 256 '
alias ping='ping -c 3'
alias ports='netstat -tulanp'
alias www='python3 -m RangeHTTPServer 8000'
alias ipe='curl ipinfo.io/ip'
alias ipi='ip -4 addr show eno1 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"'
alias woman='man'

alias df='df -H'
alias du='du -ch'
alias grep='grep -i --color=auto'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias update='sudo apt-get update && sudo apt-get upgrade'

alias h='history'
alias hgrep='history | grep'
alias lgrep='ls | grep'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias cmatrix='cmatrix -a -b'
alias rd="cd $(pwd)"

# system info
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# set vim as default editor
alias vi='vim'
alias svi='sudo vi'
alias edit='vim'

# python
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

alias top='atop'

alias cpp='rsync -ah --info=progress2'
alias mvp='rsync -ah --info=progress2 --remove-source-files'

# do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'
# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# parenting changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# equality under unix
alias woman='man'

# cd aliases
alias cd..='cd ..'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
#alias cd ...='cd ../../'
#alias cd ....='cd ../../../'

# clear
alias c='clear'
alias cl='clear'
alias claer='clear'
alias clera='clear'

# python
alias py='python3'
alias python='python3'
alias pycrvenv='python3 -m venv venv'
alias pyacvenv='source venv/bin/activate'

# git

alias bat='batcat'

# make mv move hidden files as well
shopt -s dotglob
