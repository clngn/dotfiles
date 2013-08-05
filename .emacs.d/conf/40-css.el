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
