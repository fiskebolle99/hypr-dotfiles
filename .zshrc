export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:*' aliases no

autoload -U colors && colors	
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

alias vim="nvim"

alias update="sudo pacman -Syu"

alias h="history"
alias hs="history | grep"

alias icat="kitten icat"

alias .zshrc="vim ~/.zshrc"

chpwd() eza -lAh --icons --color=always --group-directories-first

# l/la/ll/ls replacements and fancifications
alias l="eza -lah --icons --color=always"
alias la="eza -lAh --icons --color=always --group-directories-first"
alias ll="eza -ll --icons --color=always"
alias ls="eza -x --icons --color=always"

# fast command to edit hyprland
alias hyprcfg="vim ~/.config/hypr/hyprland.conf"

plugins=(git)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export PATH=$PATH:~/.local/bin
export EDITOR=nvim
source $ZSH/oh-my-zsh.sh


#plugins
source $HOME/.config/zsh/plugins/zsh-dirhistory/dirhistory.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
eval "$(zoxide init zsh)"


# christitus extract thing
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
            *.tar.bz2) tar xvjf $archive ;;
            *.tar.gz) tar xvzf $archive ;;
            *.bz2) bunzip2 $archive ;;
            *.rar) rar x $archive ;;
            *.gz) gunzip $archive ;;
            *.tar) tar xvf $archive ;;
            *.tbz2) tar xvjf $archive ;;
            *.tgz) tar xvzf $archive ;;
            *.zip) unzip $archive ;;
            *.Z) uncompress $archive ;;
            *.7z) 7z x $archive ;;
            *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}
