;; C-hでバックスペース
(global-set-key (kbd "C-h") 'delete-backward-char)

;; C-tでウインドウ移動
(global-set-key (kbd "C-t") 'next-multiframe-window)

;; 折り返しトグルコマンド
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; ヘルプ
(global-set-key (kbd "C-x ?") 'help-command)

;; C-x b でiswitchb -> anythingへ
;; (iswitchb-mode 1)
;; (add-hook 'iswitchb-define-mode-map-hook
;;           (lambda ()
;;             ;; C-n/p/f/bで選択
;;             (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
;;             (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
;;             (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
;;             (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))
