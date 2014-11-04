;; メニューバーの表示切り替え
(if (window-system)
    (menu-bar-mode t)
  (menu-bar-mode 0))

;; スクロールを1行ずつに
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 対応するカッコをハイライト表示
(show-paren-mode t)

;; リージョンに色をつける
(setq transient-mark-mode t)

;; 右端で折り返し
(setq truncate-partial-width-windows nil)

;; 現在の関数名をモードラインに表示
(which-function-mode t)

;; 行列数表示
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

;; 不可視文字の表示
;; (when (>= emacs-major-version 23)
;;   (require 'whitespace)
;;   (setq whitespace-style
;;         '(face tabs tab-mark spaces space-mark))
;;   (setq whitespace-space-regexp "\\( +\\|\u3000+\\)")
;;   (setq whitespace-display-mappings
;;         '((space-mark ?\u3000 [?\u25a1])
;;           (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
;;   (global-whitespace-mode 1)
;;   )

;; 行末スペースの表示
(setq-default show-trailing-whitespace t)

;; 色の設定
(custom-set-faces
 '(default
   ((t (:background "black" :foreground "white"))))
 '(cursor
   ((t (:background "gray"))))
 '(region
   ((t (:background "LightSteelBlue" :foreground "black"))))
 '(whitespace-tab
   ((t (:background nil :foreground "gray32" :underline t))))
 '(whitespace-space
   ((t (:foreground "yellow" :weight bold))))
 '(trailing-whitespace
   ((t (:background nil :foreground "gray32" :underline t))))
 )

;; mode-line
(set-face-attribute 'mode-line nil
                    :background "#2a729a"
                    :foreground "#fff"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :background "#334d66"
                    :foreground "#adadad"
                    :box nil)
(setq-default mode-line-format
              '((:eval (if (display-graphic-p) " " "-"))
                mode-line-mule-info  ; 文字コードやIME
                ;; mode-line-client
                mode-line-modified  ; 変更済みかどうか
                "  "
                ;; mode-line-frame-identification
                mode-line-buffer-identification  ; ファイル名
                " "
                mode-line-modes  ; モード名
                " "
                (vc-mode vc-mode)  ; VCS
                "  "
                mode-line-position  ; 位置
                ))
