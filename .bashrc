# .bashrc
PS1='${PWD#"${PWD%/*/*}/"} \$ '
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#### barko BEGIN
export EDITOR='nano'
export VISUAL='nano'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias free="free -mt"
alias wget="wget -c"
alias userlist="cut -d: -f1 /etc/passwd"
alias merge="xrdb -merge ~/.Xresources"
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-fc='sudo fc-cache -fv'
alias hw="hwinfo --short"
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
alias katalog='echo "Iščem..." && tree -I "Android" -I "LOST.DIR" -I "System Volume Information" --prune > katalog.txt && echo "Datoteka katalog.txt je pripravljena."'
alias makeiso='mkisofs -iso-level 3 -o makeiso.iso .'
alias top='htop'
alias itop='sudo iotop'
alias updatedb='sudo updatedb'
alias reboot='sudo reboot.sh'
alias tar='tar -cvzf'
alias untar='tar -xvzf'
alias arhiv='sudo 7z u -up0q3r2x2y2z1w2 arhiv.7z $1'
alias dnf='sudo dnf'
alias update='dnf upgrade --refresh -y'
alias upgrade='update'
alias upg='upgrade'
alias upd='dnf system-upgrade download --allowerasing --release=%1'
alias updd='dnf system-upgrade reboot'
alias cleanup='dnf clean all'
alias fpm='sudo fpm'
alias deb2rpm='fpm --no-depends -s deb -rpm $1'
alias update-grub='sudo grub2-mkconfig -o /etc/grub2.cfg'
neofetch
#### barko END
