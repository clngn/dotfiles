;;;;
;; coffee-mode
(autoload 'coffee-mode "coffee-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.coffee$" . coffee-mode) auto-mode-alist))
(add-hook 'coffee-mode-hook
          '(lambda ()
             ))
