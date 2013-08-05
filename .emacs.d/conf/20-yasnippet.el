;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)
;; anything interface
;; http://d.hatena.ne.jp/sugyan/20120101/1325429637
;; (eval-after-load "anything-config"
;;   '(progn
;;      (defun my-yas/prompt (prompt choices &optional display-fn)
;;        (let* ((names (loop for choice in choices
;;                            collect (or (and display-fn (funcall display-fn choice))
;;                                        choice)))
;;               (selected (anything-other-buffer
;;                          `(((name . ,(format "%s" prompt))
;;                             (candidates . names)
;;                             (action . (("Insert snippet" . (lambda (arg) arg))))))
;;                          "*anything yas/prompt*")))
;;          (if selected
;;              (let ((n (position selected names :test 'equal)))
;;                (nth n choices))
;;            (signal 'quit "user quit!"))))
;;      (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
;;      (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))
;; helm-c-yasnippet
(require 'helm-c-yasnippet)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)
