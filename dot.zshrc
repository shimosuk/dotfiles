setopt nonomatch
#入力補完
autoload -U compinit
compinit

#先攻予測
autoload predict-on
predict-on

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

alias zac="open https://esm.jp.oro.com/esm/"
alias github="open https://github.com"
alias emoji="open http://www.emoji-cheat-sheet.com"
alias diary="open http://d.hatena.ne.jp/shimosuk/"
alias mail="open https://mail.google.com/mail/u/0/?shva=1#inbox"
alias pivotal="open https://www.pivotaltracker.com/projects/513695"
alias cppe="open https://esminc.copi.pe/"
alias idobata="open https://idobata.io/#/organization/esminc/room/kogei"
alias doc="open http://docs.oracle.com/javase/jp/6/api/index.html"

#MacVim.appのVimを使用するためのalias
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'

alias be='bundle exec'
alias rs="rspec"
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
#RPROMPT="[%~]""%1(v|%1v|)"

#色の設定
local RED="%{[31m%}"
local GREEN="%{[32m%}"
local YELLOW="%{[33m%}"
local BLUE="%{[34m%}"
local PURPLE="%{[35m%}"
local AQUA="%{[36m%}"
local DF="%{[m%}"


#プロンプト
#PROMPT="%/%%"	#ディレクトリーの表示
#PROMPT2="%_%%"
#SPROMPT="%r is correct? [n,y,a,e]:"

PROMPT=$PURPLE"%m:%n%% "$DF
RPROMPT=$AQUA"[%~"$GREEN"%1(v|%1v|)"$AQUA"]"$DF #ディレクトリー(R)
SPROMPT="correct:%R -> %r?"



#環境変数
export LANG=ja_JP.UTF-8

#ctags
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'


PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
