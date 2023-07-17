# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"

#WEB_GATEWAY STUFF
export HOMEBREW_GITHUB_API_TOKEN="64bc83d4ed0c07024ab915ae3e03b073530402fe"

#FOR_BUNDLE_INSTALL
export GITHUB_TOKEN="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"

#Stop homebrew from cleaning up libraries still being used
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE

plugins=(
  git
  zsh-syntax-highlighting
)

# Highlighters (zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'

ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="/usr/local/opt/postgresql/bin:$PATH"

# installed by cultureamp/big-frontend-repo
bfr() {
  ${HOME}/code/cultureamp/big-frontend-repo/tools/cli/run.sh $@
}

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export NODE_ENV=development

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVM
 export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ALIASES
alias vim=/usr/local/bin/vim #use 8.1
alias vim="TERM=screen-256color nvim" # set TERM for colors to work in tmux. Figure out better way to set TERM globally
alias greenpush='~/tools/github-push-automation/main.sh'
alias keychain='ssh-add --apple-use-keychain ~/.ssh/id_ed25519'

# Adds ssh key to keychain. Issue may be fixed in future
# ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Suppress console log warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
echo " [o_0] 起動成功。頑張れ。"
