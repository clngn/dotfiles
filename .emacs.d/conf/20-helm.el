;; helm
(when (require 'helm-config nil t)
  (global-set-key (kbd "C-x b") 'helm-for-files)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-r") 'helm-resume)

  ;; C-h をBackspaceに割当て
;  (define-key helm-map (kbd "C-h") 'delete-backward-char)
;  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

  ;; TABで補完
;  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
)
