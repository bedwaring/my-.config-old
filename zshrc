# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
)

GITSTATUS_LOG_LEVEL=DEBUG
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Aliases:
alias cls=clear
alias vim="nvim"
alias ix.io="curl -F 'f:1=<-' ix.io"
alias close=exit
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mkinit="sudo mkinitcpio -P linux"
alias sy="sudo pacman -Syy"
alias syu="sudo pacman -Syyu"
alias del="rm -rf"
alias delete="rm -rf"
alias quit=exit
alias dotfetch="neofetch --config ~/.config/neofetch/dotfetch.conf"


# PowerSaving

cpu-off() {
	for ((i=4;i<$(nproc);i++));
	do echo 0 > /sys/devices/system/cpu/cpu"$i"/online;
	done
}

cpu-on() {
	for ((i=4;i<$(nproc);i++));
	do echo 1 > /sys/devices/system/cpu/cpu"$i"/online;
	done
}

# Flutter:
#User specific environment
#PATH="$HOME/.local/bin:$HOME/bin:$PATH"
#PATH="$PATH:$HOME/development/flutter/bin"
#export ANDROID_HOME="$HOME/development/Android/SDK"
#export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.2.7-0.fc29.x86_64"
#export PATH
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
# Add JAVA bin directory to the PATH variable
#export PATH=$PATH:$JAVA_HOME/bin

# Sources:
source /home/cat/powerlevel10k/powerlevel10k.zsh-theme
source /home/cat/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/cat/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
