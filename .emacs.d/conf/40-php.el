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
