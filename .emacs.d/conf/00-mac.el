;-------------------------------------------------------------------------------
; Mac設定
;-------------------------------------------------------------------------------

(when (eq system-type 'darwin)
  ;; optionキーをmeta
  (setq mac-option-modifier 'meta)

  ;; commandキーをsuper
  (setq mac-command-modifier 'super)

  ;; IMEの状態をモードラインに表示
  ;; 日本語設定の後に
  ;; *scratch*で(mac-get-current-input-source)をC-jすればわかる
  (setq default-input-method "MacOSX")
  ; ことえり
  (mac-set-input-method-parameter "com.apple.inputmethod.Kotoeri.Japanese" `title "[あ]"))
