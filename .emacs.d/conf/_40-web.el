;; web-mode
(require 'web-mode)
;(autoload 'web-mode "web-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

(add-hook 'web-mode-hook
          '(lambda ()
             (setq web-mode-markup-indent-offset 4)
             (setq web-mode-css-indent-offset 4)
             (setq web-mode-code-indent-offset 4)

             (setq web-mode-engines-alist
                   '(("html" . "\\.html$"))
                   ; '(("php"    . "\\.ctp\\'"))
                   )
             ))
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
