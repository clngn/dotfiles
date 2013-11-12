;; html-mode
(add-hook 'html-mode-hook
          '(lambda ()
             (setq sgml-basic-offset 4)
             (electric-pair-mode t)
             ))

(require 'jinja2-mode)
