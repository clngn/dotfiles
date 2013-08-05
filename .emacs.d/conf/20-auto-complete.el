;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/dict")
(global-auto-complete-mode t)
(ac-config-default)
;; 補完時にTABをRETの挙動に
(setq ac-dwim t)
;; 3文字以上入力で補完開始
(setq ac-auto-start 3)
;; メニュー表示時のみ有効なキーマップを設定
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
