
# begin installing pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
print() {
  [ 0 -eq $# -a "prompt_pure_precmd" = "${funcstack[-1]}" ] || builtin print "$@";
}
prompt pure
precmd() {
  precmd() {
      echo
  }
}
# end installing pure

# begin configure prompt
RPROMPT="%D %T"
# end configure prompt

# begin configure auto completion
autoload -Uz compinit
# only regen cache once per day
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# end configure auto completion

# begin load take
fpath+=($HOME/.zsh/take)
autoload -Uz take
# end load take

# begin aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
# end aliases

# begin plugins
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-eza/zsh-eza.plugin.zsh
# end plugins

# begin configure zsh-eza
eza_params=(
  '--git' '--classify' '--group' '--header' '--all'
  '--group-directories-first' '--time-style=long-iso' '--color-scale'
  '-I=.DS_Store|.localized|.CFUserTextEncoding'
)

alias ls='eza $eza_params'
alias la='ls -lbhUmua --sort=modified -r'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'
# end configure zsh-eza
