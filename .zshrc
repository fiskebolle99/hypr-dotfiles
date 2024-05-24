#░█▀▀░▀█▀░█▀▀░█░█░█▀▀░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀
#░█▀▀░░█░░▀▀█░█▀▄░█▀▀░░░▄▀░░▀▀█░█▀█░█▀▄░█░░
#░▀░░░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀
# https://github.com/fiskebolle99/hypr-dotfiles/
# ascii using https://www.asciiart.eu/text-to-ascii-art (FONT: Pagga, SIZE: 6 pt)

# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

export ZSH="$HOME/.oh-my-zsh"

# disable zsh default keybinds (such as ll/la etc.)
zstyle ':omz:*' aliases no

# prompt prettification
autoload -U colors && colors	
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
#░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
#░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

alias vim="nvim"

# pacman
alias update="sudo pacman -Syu"
alias search="pacman -Ss"

alias icat="kitten icat"

# l/la/ll/ls replacements and fancifications
alias l="eza -lah --icons --color=always"
alias la="eza -lAh --icons --color=always --group-directories-first"
alias ll="eza -ll --icons --color=always"
alias ls="eza -x --icons --color=always"

# fast command to edit hyprland
alias hyprcfg="vim ~/.config/hypr/hyprland.conf"
alias .zshrc="vim ~/.zshrc"

alias history="history 1"

alias untar="tar -xvf"
                                                                                       
#░█▀▀░█░█░█▀█░█▀█░█▀▄░▀█▀░█▀▀
#░█▀▀░▄▀▄░█▀▀░█░█░█▀▄░░█░░▀▀█
#░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀

export PATH=$PATH:~/.local/bin
export EDITOR=nvim
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

#░█▀▀░█▀█░█░█░█▀▄░█▀▀░█▀▀░█▀▀
#░▀▀█░█░█░█░█░█▀▄░█░░░█▀▀░▀▀█
#░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

# have to source this after COMPDUMP or else it will throw garbage in ~
source $ZSH/oh-my-zsh.sh

# plugins
source $HOME/.config/zsh/plugins/zsh-dirhistory/dirhistory.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# enables zoxide
eval "$(zoxide init zsh)"

#░█▄█░▀█▀░█▀▀░█▀▀
#░█░█░░█░░▀▀█░█░░
#░▀░▀░▀▀▀░▀▀▀░▀▀▀

# does 'l' after every change of directory
chpwd() eza -lAh --icons --color=always --group-directories-first

# fast tar extract tool so i dont have to remember commands
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
