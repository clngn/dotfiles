;; elscreen
;; (require 'elscreen)
(when (>= emacs-major-version 24)
  (elscreen-start)
  (setq elscreen-tab-display-kill-screen nil)  ; タブ左端のxを非表示
  (setq elscreen-display-screen-number nil)  ; モードラインでの表示を非表示
  (global-set-key (kbd "M-t") 'elscreen-create)  ; 新規タブ
  (global-set-key (kbd "M-T") 'elscreen-clone)   ; 新規タブでカレントバッファ引継ぎ
  (global-set-key (kbd "C-<tab>") 'elscreen-next)        ; タブ移動
  (global-set-key (kbd "C-S-<tab>") 'elscreen-previous)  ; タブ移動
  )
