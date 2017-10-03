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
