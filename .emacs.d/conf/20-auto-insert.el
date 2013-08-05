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
