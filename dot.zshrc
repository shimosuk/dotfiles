setopt nonomatch
#入力補完
autoload -Uz compinit && compinit
compinit

setopt auto_pushd # cd での移動を記録 (cd -[Tab])
setopt correct # コマンド修正
setopt nolistbeep # 消音
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 履歴をインクリメンタルに追加
setopt inc_append_history

#色の設定
local RED="31"
local GREEN="32"
local YELLOW="33"
local BLUE="34"
local PURPLE="35"
local AQUA="36"
local DF="00"
# ls 色関連
export CLICOLOR=true # lsコマンドに色がつく(= ls -G)
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS='di=01;'$AQUA':ln=00;'$PURPLE':so=01;'$GREEN':ex=01;'$RED':bd=46;'$BLUE':cd=43;'$BLUE':su=41;30:sg=46;30:tw=42;30:ow=43;30' ## zstyle 補完の色

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
# 補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' # 補完の大小文字の無視(一致優先)
zstyle ':completion:*:(processes|jobs)' menu yes select=2 # リスト選択
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # 補完の色設定
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f' # type表示
zstyle ':completion:*:*:*:*:*' menu select=2 # 選択補完の配色
bindkey "^[[Z" reverse-menu-complete # Shift - Tab で逆順補完
#プロンプト
PROMPT="%{["$PURPLE"m%}%n@%m> %{["$DF"m%}" # USER@HOST
RPROMPT="%{["$AQUA"m%}[%~%{["$GREEN"m%}%1(v|%1v|)%{["$AQUA"m%}]%{["$DF"m%}" #ディレクトリー(R)
SPROMPT="correct:%R -> %r? [n,y,a,e]"
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

#環境変数
export POSTGRES=/Applications/Postgres.app/Contents/MacOS
export PATH=.:/usr/local/bin:$POSTGRES/bin:$PATH

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

if [ -f .proxy.sh ]; then
  source .proxy.sh
fi

