# p10k setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# EXPORTS
# updating HOME path
export PATH=$HOME/bin:$HOME/bin/shellscripts:$HOME/bin/pythonscripts:$HOME/bin/goscripts:$HOME/bin/luascripts:$PATH
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME=$HOME/.config
export PAGER="nvim +Man!"

# Dev Env
export APP_ENV="local"

# ALIASES
# vim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

alias ls='exa'
alias l='exa -a'
alias src='source ~/.zshrc'
export TASKRC=~/.config/task/.taskrc 
export TASKDATA=~/.config/task/.task_data

# general
alias py='python3'
alias python='python3'
alias pip='pip3'
alias sed='gsed'
alias cat='bat'


# config files
alias ezsh='nvim ~/.zshrc'
alias envim='nvim ~/.config/nvim/'
alias etmux='nvim ~/.tmux.conf'

# use rbenv
eval "$(rbenv init -)"

# utils
alias projects='cd /Users/antonsuprun/Projects && cd $(ls | fzf-tmux -w 40% -h 50%)'
alias learn='cd /Users/antonsuprun/Learn && cd $(ls | fzf-tmux -w 40% -h 50%)'
alias activatevenv='source venv/bin/activate'
alias create_venv='python3 -m venv'

#nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Configs
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(git history-substring-search)

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

source $ZSH/oh-my-zsh.sh

# Vi mode
bindkey -v
KEYTIMEOUT=1

# Bindigs
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# previews a file via bat
preview() {
    fzf-tmux \
        -w 85% \
        -h 85% \
        --preview 'bat --color=always {}'  \
        --preview-window 'right,75%,border-bottom,+{2}+3/3,~3' \
        --print0 \
        --multi \
        | \
        xargs -0 -o nvim
}

# shows history of visited direcroties in current session
back() {
    selected=$(dirs | tr ' ' '\n' | sed "s|~|$HOME|g" | fzf-tmux -w 70% -h 60%)
    if [[ -n $selected ]]; then
       cd $selected
    fi
}

# fzf bindings
bindkey "^F" fzf-cd-widget

# fzf defaults
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!{.npm,node_modules,.git,.cache,.rustup,.oh-my-zsh,.gradle,.idea,.Trash,Photos\ Library.photoslibrary}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --hidden --files --null -g '!{.npm,node_modules,.git,.cache,.rustup,.oh-my-zsh,.gradle,.idea,.Trash,Photos\ Library.photoslibrary}' | xargs -0 dirname | uniq"
export FZF_DEFAULT_OPTS="--border --color fg:#ebdbb2,bg:#1d2021,bg+:#1d2021,gutter:#1d2021,hl:#ffffff,fg+:#ebdbb2,border:#f9f5d7 --margin 0% --padding 0%"
export FZF_PREVIEW_COLUMNS="30%"

# pnpm
export PNPM_HOME="/Users/antonsuprun/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm end
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(atuin init zsh --disable-up-arrow)"
