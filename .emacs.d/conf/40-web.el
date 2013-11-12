;;;;
;; web-mode
(require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\" . web-mode))

(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 4)  ; HTML offset indentation
  (setq web-mode-css-indent-offset 4)  ; CSS offset indentation
  (setq web-mode-code-indent-offset 4)  ; Script offset indentation (for JavaScript, Java, PHP, etc.)

  (setq web-mode-style-padding 4)  ; For <style> parts padding
  (setq web-mode-script-padding 4)  ; For <script> parts padding

  (setq web-mode-comment-style 2))
(add-hook 'web-mode-hook 'web-mode-hook)

(add-hook 'web-mode-hook 'whitespace-turn-off)

(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))               ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))  ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))               ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "#82AE46"))))               ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))               ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))               ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))               ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))               ; css疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))               ; cssのタグ
)


;;;;
;; html-mode
(add-hook 'html-mode-hook
          '(lambda ()
             (setq sgml-basic-offset 4)
             (electric-pair-mode t)
             ))

;;;;
;; css-mode
(autoload 'css-mode "css-mode" nil t)
;; (setq auto-mode-alist
;;       (cons '("\\.css\\'" . css-mode) auto-mode-alist))
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

;;;;
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

;;;;
;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
;; (setq auto-mode-alist
;;       (cons '("\\.js$" . js2-mode) auto-mode-alist))
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

             (setq yas/mode-symbol 'js-mode)
             ))


;;;;
;; coffee-mode
(autoload 'coffee-mode "coffee-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.coffee$" . coffee-mode) auto-mode-alist))
(add-hook 'coffee-mode-hook
          '(lambda ()
             ))


;;;;
;; php-mode
(autoload 'php-mode "php-mode" nil t)
;; (setq auto-mode-alist
;;       (cons '("\\.php$" . php-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.php$" . html-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (setq c-basic-offset 4)
             (setq tab-width 4)
             ))


;;;;
;; jinja2-mode
(require 'jinja2-mode)
