setopt nonomatch
#入力補完
autoload -Uz compinit && compinit
compinit

setopt auto_pushd # cd での移動を記録 (cd -[Tab])
setopt correct # コマンド修正
setopt nolistbeep # 消音

bindkey "^[[Z" reverse-menu-complete # Shift - Tab で逆順補完

#履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#alias
alias g="git"
alias grep="grep --color"
alias ls="ls -G"

alias github="open https://github.com"
alias emoji="open http://www.emoji-cheat-sheet.com"
alias diary="open http://d.hatena.ne.jp/shimosuk/"
alias mail="open https://mail.google.com/mail/u/0/?shva=1#inbox"

alias be='bundle exec'
alias rs="rspec"
alias ctags='/usr/local/bin/ctags'

#branch表示
autoload colors; colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#色の設定
local RED="%{[31m%}"
local GREEN="%{[32m%}"
local YELLOW="%{[33m%}"
local BLUE="%{[34m%}"
local PURPLE="%{[35m%}"
local AQUA="%{[36m%}"
local DF="%{[m%}"


#プロンプト
PROMPT=$PURPLE"%n@%m> "$DF # USER@HOST
RPROMPT=$AQUA"[%~"$GREEN"%1(v|%1v|)"$AQUA"]"$DF #ディレクトリー(R)
SPROMPT="correct:%R -> %r? [n,y,a,e]"

#環境変数
export CLICOLOR=true # lsコマンドに色がつく(= ls -G)
export POSTGRES=/Applications/Postgres.app/Contents/MacOS
export PATH=.:/usr/local/bin:$POSTGRES/bin:$PATH
## zstyle 補完の色
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' # 補完の大小文字の無視
zstyle ':completion:*:(processes|jobs)' menu yes select=2 # リスト選択
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # 補完の色設定

if [ -f .proxy.sh ]; then
  source .proxy.sh
fi

