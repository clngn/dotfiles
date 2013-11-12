;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
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

             (setq yas/mode-symbol 'js-mode)
             ))

;; coffee-mode
(autoload 'coffee-mode "coffee-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.coffee$" . coffee-mode) auto-mode-alist))
(add-hook 'coffee-mode-hook
          '(lambda ()
             ))
