;; tramp
(require 'tramp)
(setq tramp-auto-save-directory "/tmp")
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))  ; 自動でバックアップファイルをつくらない
