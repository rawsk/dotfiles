# 日本語を使用
export LANG=ja_JP.UTF-8

# ヒストリーに重複を表示しない
setopt hist_ignore_all_dups

# コマンドミスを修正
setopt correct

# 補完
autoload -Uz compinit
compinit

## 補完侯補をハイライトして、メニューから選択
### select=2: 補完候補を一覧から選択 ただし、補完候補が2つ以上なければすぐに補完
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける
### "": 空文字列はデフォルト値を使うという意味
zstyle ':completion:*:default' list-colors ""

# 色を使用出来るようにする
autoload -Uz colors
colors

# プロンプト
# 2行表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%F{white}%K{green}%s%f%k)-[%F{white}%K{blue}%b%f%k]'
zstyle ':vcs_info:*' actionformats '(%F{white}%K{green}%s%f%k)-[%F{white}%K{blue}%b%f%k|%F{white}%K{red}%a%f%k]'

precmd() {
  local left='\-[%B%n%b%F{cyan}@%f%B%m%b]'
  # バージョン管理されてた場合、ブランチ名
  vcs_info
  local right="${vcs_info_msg_0_}-[%K{magenta}%d%k]"

  local invisible='%([BSUbfksu]|([FK]|){*})'
  local leftwidth=${#${(S%%)left//$~invisible/}}
  local rightwidth=${#${(S%%)right//$~invisible/}}
  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth)))

  print -P $left${(r:$padwidth::-:)}$right-
}
PROMPT='-%# '
#RPROMPT='[%K{magenta}%d%k]'

# lsの設定
case ${OSTYPE} in
    darwin*)
        # setting for mac
        alias ls="ls -lhAFG"
        ;;
    linux*)
        # setting for linux
        alias ls="ls -lhAF --color=auto"
        ;;
esac

# rmするときは確認
alias rm="rm -i"
