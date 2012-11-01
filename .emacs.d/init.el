;-------------------------------------------------------------------------------
; 日本語設定
;-------------------------------------------------------------------------------

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)


;-------------------------------------------------------------------------------
; Mac設定
;-------------------------------------------------------------------------------

;; フォントの設定
(when (and (window-system) (>= emacs-major-version 23))
  ;; asciiフォントの設定
  (set-face-attribute 'default nil
                      :family "monaco"
                      :height 140)
  ;; 日本語フォントの設定
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "MigMix 1M"))
  ;; フォントの横幅を調整
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.2)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9)
          ("-cdac$" . 1.3)
          (".*MigMix.*" . 1.2))))

;; optionキーをmeta
(setq mac-option-modifier 'meta)

;; commandキーをsuper
(setq mac-command-modifier 'super)

;; IMEの状態をモードラインに表示
;; 日本語設定の後に
(setq default-input-method "MacOSX")
(mac-set-input-method-parameter "com.justsystems.inputmethod.atok25.Japanese" `title "[ON]")  ; ATOK2012


;-------------------------------------------------------------------------------
; 一般設定
;-------------------------------------------------------------------------------

;; elispパスの追加
;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp")

;; PATHの設定
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")  ; 絶対パスに展開
              (expand-file-name "~/.emacs.d/bin")
              ))
  ;; PATHとexec-pathに同じものを追加
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;; インデントを半角スペースに、幅は4
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq-default tab-width 4)

;; 自動インデント
(setq-default tab-always-indent t)

;; コメントアウトの設定
(setq comment-style 'multi-line)

;; C-hでバックスペース
(global-set-key (kbd "C-h") 'delete-backward-char)

;; C-tでウインドウ移動
(global-set-key (kbd "C-t") 'next-multiframe-window)

;; 折り返しトグルコマンド
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; ヘルプ
(global-set-key (kbd "C-x ?") 'help-command)

;; タイトルバーに今開いてるファイル名を表示
(setq frame-title-format "%f - emacs")

;; ツールバーを表示しない
(tool-bar-mode 0)

;; メニューバーを表示
(menu-bar-mode t)

;; スクロールバーを右側に表示
(set-scroll-bar-mode 'right)

;; バックアップファイルの無効
(setq make-backup-files nil)

;; 終了時に自動保存ファイルを削除
(setq delete-auto-save-files t)

;; 保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ファイルの最後に改行を入れる
(setq require-final-newline t)

;; 対応するカッコをハイライト表示
(show-paren-mode t)

;; リージョンに色をつける
(setq transient-mark-mode t)

;; 起動時のメッセージを消す
;(setq inhibit-startup-message t)

;; 起動時の画像変更
(setq fancy-splash-image "~/.emacs.d/splash_azu.png")

;; ファイルをD&Dで開く
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;; enable to pop `mark-ring' repeatedly like C-u C-SPC C-SPC ...
(setq set-mark-command-repeat-pop t)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)  ; C-xでkill-regionになってしまうので無効化

;; スクロールを1行ずつに
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 右端で折り返し
(setq truncate-partial-width-windows nil)

;; マウスホイールの設定
;; マウスホイールでのスクロール速度の設定
;; 通常 1、+Shift 5、+Control 1画面
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control) . nil)))
;; マウスホイールでのスクロールを加速しない
(setq mouse-wheel-progressive-speed nil)

;; 現在の関数名をモードラインに表示
(which-function-mode t)

;; 行列数表示
(line-number-mode t)
(column-number-mode t)

;; 不可視文字の表示
(when (>= emacs-major-version 23)
  (require 'whitespace)
  (setq whitespace-style
        '(face tabs tab-mark spaces space-mark))
  (setq whitespace-space-regexp "\\( +\\|\u3000+\\)")
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
  (global-whitespace-mode 1)
  )

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
 '(elscreen-tab-background-face
   ((t (:background "gray10"))))
 '(elscreen-tab-control-face
   ((t (:background "gray10" :foreground "gray60"))))
 '(elscreen-tab-current-screen-face
   ((t (:background "gray75" :foreground "black"))))
 '(elscreen-tab-other-screen-face
   ((t (:background "gray30" :foreground "gray80"))))
 '(whitespace-tab
   ((t (:background nil :foreground "gray32" :underline t))))
 '(whitespace-space
   ((t (:foreground "yellow" :weight bold))))
 '(trailing-whitespace
   ((t (:background nil :foreground "gray32" :underline t))))
 )
(setq default-frame-alist
      (append (list '(alpha . (100 85)))
              default-frame-alist))

;; フレームサイズ
;; 高さをディスプレイ解像度に合わせて最大化
;; Mac用(メニューバーを考慮)
(when (window-system)
  (defvar myleft (- (x-display-pixel-width) (frame-pixel-width))
    "左端にフレームをセット")
  (defvar myheight (- (/ (- (x-display-pixel-height) 22) (frame-char-height)) 2)
    "ディスプレイ解像度に合わせた高さを設定")
  (setq initial-frame-alist
        (append (list
                 (cons 'width 80)
                 (cons 'height myheight)
                 (cons 'top 1)
                 (cons 'left myleft)
                 ) initial-frame-alist)))

;; C-x b でiswitchb
(iswitchb-mode 1)
(add-hook 'iswitchb-define-mode-map-hook
          (lambda ()
            ;; C-n/p/f/bで選択
            (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
            (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;; tramp
(require 'tramp)
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))  ; 自動でバックアップファイルをつくらない

;; 閉じ括弧の補完
(when (>= emacs-major-version 24)
    (electric-pair-mode t))


;-------------------------------------------------------------------------------
; elisp設定
;-------------------------------------------------------------------------------

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; elscreen
(require 'elscreen)
(elscreen-start)
(global-set-key (kbd "M-t") 'elscreen-create)  ; 新規タブ
(global-set-key (kbd "M-T") 'elscreen-clone)   ; 新規タブでカレントバッファ引継ぎ
(global-set-key (kbd "C-<tab>") 'elscreen-next)        ; タブ移動
(global-set-key (kbd "C-S-<tab>") 'elscreen-previous)  ; タブ移動

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

;; auto-install
(setq load-path (cons "~/.emacs.d/auto-install/" load-path))
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/auto-install/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)  ; 互換性確保

;; auto-insert
(require 'autoinsert)
(setq auto-insert-directory "~/.emacs.d/auto-insert/")
(setq auto-insert-alist
      (append '(("\\.py$"   . ["template.py" my-template])
                ("\\.html$" . ["template.html" my-template])
                ("\\.css$"  . ["template.css" my-template])
                ) auto-insert-alist))
(defun my-template ()
  (message "done."))
(add-hook 'find-file-not-found-hooks 'auto-insert)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; anything interface
;; http://d.hatena.ne.jp/sugyan/20120101/1325429637
(eval-after-load "anything-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (anything-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*anything yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
     (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))

;; anything
(require 'anything-startup)
(global-set-key (kbd "C-;") 'anything-command-map)
(global-set-key (kbd "C-x b") 'anything-for-files)

;; org-remember
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
        ("Bug" ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
        ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")
        ))

;; twittering-mode
(require 'twittering-mode)
(setq twittering-use-master-password t)  ; マスターパスワードを使う
(setq twittering-status-format "%i @%s %S %p:\n %T\n  [%@]%r %R %f%L\n----------------------------------------")  ; 表示する書式


;-------------------------------------------------------------------------------
; 各種モード設定
;-------------------------------------------------------------------------------

;; c-mode
(add-hook 'c-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (c-set-offset 'arglist-close 0)
             ))

;; c++-mode
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (c-set-offset 'arglist-close 0)  ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; python-mode
(add-hook 'python-mode-hook
          '(lambda()
             (setq python-indent 4)
             (setq tab-width 4)
             ;(flymake-mode t)
             ))

;; html-mode
(add-hook 'html-mode-hook
          '(lambda ()
             (setq sgml-basic-offset 4)
             ))

;; html-helper-mode
;; (autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;; (setq auto-mode-alist
;;   (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;; (setq html-helper-basic-offset 4)

;; psgml-mode
;; (autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;; (autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
;; (setq auto-mode-alist
;;   (append
;;    '(("\\.html$" . xml-mode)
;;      ("\\.xhtml$" . xml-mode))
;;    auto-mode-alist))
;; (setq sgml-catalog-files '("~/.emacs.d/sgml/xhtml1-20020801/DTD/xhtml1.cat"))
;; (setq sgml-custom-dtd
;;       '(
;;         ("XHTML 1.0"
;;          "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"
;;                       \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">")
;;         ))
;; (add-hook 'sgml-mode-hook
;;   '(lambda()
;; ;     (sgml-indent-step 4)
;; ))
;; (add-hook 'xml-mode-hook
;;   (function (lambda()
;;     (make-face 'sgml-comment-face)
;;     (make-face 'sgml-start-tag-face)
;;     (make-face 'sgml-end-tag-face)
;;     (make-face 'sgml-doctype-face)

;;     (set-face-foreground 'sgml-comment-face "blue4")
;;     (set-face-foreground 'sgml-start-tag-face "steelblue")
;;     (set-face-foreground 'sgml-end-tag-face "steelblue")
;;     (set-face-foreground 'sgml-doctype-face "blue4")

;;     (setq sgml-set-face t)
;;     (setq sgml-markup-faces
;;       '((comment   . sgml-comment-face)
;;         (start-tag . sgml-start-tag-face)
;;         (end-tag   . sgml-end-tag-face)
;;         (doctype   . sgml-doctype-face)))
;;     )))

;; css-mode
(autoload 'css-mode "css-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(add-hook 'css-mode-hook
          '(lambda ()
             (define-key css-mode-map "{" 'css-electric-pair)
             (setq css-indent-offset 4)
             ))
(defun css-electric-pair ()
  ;; http://d.hatena.ne.jp/CortYuming/20120110/p1
  (interactive)
  (insert "{")
  (newline-and-indent)
  (newline-and-indent)
  (insert "}")
  (indent-for-tab-command)
  (previous-line)
  (indent-for-tab-command))

;; less-css-mode
(autoload 'less-css-mode "less-css-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.less\\'" . less-css-mode) auto-mode-alist))
(setq exec-path (append (list (expand-file-name "~/.nodebrew/current/bin")) exec-path))
(add-to-list 'ac-modes 'less-css-mode)  ; ac-mode
(add-hook 'less-css-mode-hook 'ac-css-mode-setup)
(add-hook 'less-css-mode-hook
          '(lambda()
             (add-to-list 'ac-user-dictionary-files "~/.emacs.d/elisp/auto-complete/dict/css-mode")
             ))

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(setq auto-mode-alist
      (cons '("\\.js$" . js2-mode) auto-mode-alist))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 4)
             (setq js2-cleanup-whitespace nil)  ; 行末の空白を保存時に削除しない
             (setq js2-mirror-mode nil)         ; 入力時に括弧を自動で閉じない
             (setq js2-bounce-indent-flag nil)  ; TABのたびにインデントを変えない
             (setq js2-mode-escape-quotes nil)
             ; TABでインデントを跨ぐ
             (defun indent-and-back-to-indentation ()
               (interactive)
               (indent-for-tab-command)
               (let ((point-of-indentation
                      (save-excursion
                        (back-to-indentation)
                        (point))))
                 (skip-chars-forward "\s " point-of-indentation)))
             (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
             ; インデントの修正
             (require 'js)
             (setq js-indent-level 4)
             (setq js-expr-indent-offset 4)
             (setq indent-tabs-mode nil)
             (set (make-local-variable 'indent-line-function) 'js-indent-line)
             ))


;; php-mode
(autoload 'php-mode "php-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.php$" . php-mode) auto-mode-alist))
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (setq c-basic-offset 4)
             ))

;; YaTeX-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (setq auto-fill-function nil)
             ))
(setq tex-command "platex2pdf") ; スクリプトを使って直接pdfにコンパイル
(setq dvi2-command "open -a Preview.app")  ; プレビュー.appでpdfを開く


;; powerline
(require 'powerline)
(set-scroll-bar-mode 'right)  ;; スクロールバー表示
(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".     c %s\",
\"      c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \"};"  color1 color2))

(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".     c %s\",
\"      c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\"};"  color2 color1))

(defconst color1 "#8b7258")
(defconst color2 "#6f5b46")
(defconst color3 "#544535")
(defconst color4 "#372d23")

(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color3) 'xpm t :ascent 'center))
(defvar arrow-right-3 (create-image (arrow-right-xpm color3 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm color3 color2) 'xpm t :ascent 'center))
(defvar arrow-left-3  (create-image (arrow-left-xpm "None" color3) 'xpm t :ascent 'center))

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)

(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground "#fff"
                    :background color3)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background color4
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background color4
                    :box nil)

(setq-default mode-line-format
              (list
               '(:eval (concat (propertize " %Z%* " 'face 'mode-line-color-1)
                               (propertize " " 'display arrow-right-1)))
               '(:eval (concat (propertize " %b " 'face 'mode-line-color-2)
                               (propertize " " 'display arrow-right-2)))
               '(:eval (concat (propertize " %m" 'face 'mode-line-color-3)
                               (powerline-minor-modes 'left color3)
                               (propertize " " 'face 'mode-line-color-3)
                               (propertize " " 'display arrow-right-3)))

               ;; Justify right by filling with spaces to right fringe - 16
               ;; (16 should be computed rahter than hardcoded)
               '(:eval (propertize " " 'display '((space :align-to (- right-fringe 20)))))

               '(:eval (concat (propertize " " 'display arrow-left-3)
                               (propertize " " 'face 'mode-line-color-3)
                               (powerline-vc 'center color3)
                               (propertize " " 'face 'mode-line-color-3)))
               '(:eval (concat (propertize " " 'display arrow-left-2)
                               (propertize " %p " 'face 'mode-line-color-2)))
               '(:eval (concat (propertize " " 'display arrow-left-1)
                               (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
               ))
