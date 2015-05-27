
;;;Emacsサーバの立ち上げ　高速化
(require 'server)
(unless (server-running-p)
  (server-start))

;日本語環境
(set-language-environment "Japanese")

(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;;caskを使う
;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)

;; emacs24ではマウスの設定が必要
;; (1)マウス無効
;;(setq mouse-wheel-mode nil)
;; (2)マウススクロール可能
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)


;; ヘッダファイル(.h)をc++モードで開く
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
	      auto-mode-alist))

(require 'flycheck)
;;flycheckで文法チェック
(add-hook 'after-init-hook #'global-flycheck-mode)
;;(add-hook 'c-mode-common-hook 'flycheck-mode)
;;(add-hook 'python-mode-hook 'flycheck-mode)
;;flycheckのメッセージ表示スピード
(setq flycheck-display-errors-delay 0.01)

(add-hook 'c-mode-common-hook
          '(lambda ()
             ;; センテンスの終了である ';' を入力したら、自動改行+インデント
             ;;(c-toggle-auto-hungry-state 1)
             ;; RET キーで自動改行+インデント
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
			 )
		  ;;(lambda () (setq tab-width 4))
)

;;補完
(require 'auto-complete-config)
(ac-config-default)

;;pythonのインデント
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "\C-m") 'newline-and-indent)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)
			)
)

;;対応する括弧のハイライト
(show-paren-mode t)
;;行番号表示
(global-linum-mode t)
;;タブ幅設定
(setq default-tab-width 4)
;;インデント幅設定
(setq default-offset 4)
;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;;UTF-8でコーディング
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

;;コピーアンドペーストをクリップボードで行う
(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(provide 'init)

