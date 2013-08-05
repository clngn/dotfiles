;; python-mode
(add-hook 'python-mode-hook
          '(lambda()
             (setq python-indent 4)
             (setq tab-width 4)
             ;(flymake-mode t)
             ))
