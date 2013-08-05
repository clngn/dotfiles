;-------------------------------------------------------------------------------
; 日本語設定
;-------------------------------------------------------------------------------

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)

;; フォントの設定
(when (and (window-system) (>= emacs-major-version 23))
  ;; asciiフォントの設定
  (set-face-attribute 'default nil
                      :family "monaco"
                      :height 140)
  ;; ;; 日本語フォントの設定
  ;; (set-fontset-font
  ;;  nil 'japanese-jisx0208
  ;;  (font-spec :family "MigMix 1M"))
  ;; ;; フォントの横幅を調整
  ;; (setq face-font-rescale-alist
  ;;       '(("^-apple-hiragino.*" . 1.2)
  ;;         (".*osaka-bold.*" . 1.2)
  ;;         (".*osaka-medium.*" . 1.2)
  ;;         (".*courier-bold-.*-mac-roman" . 1.0)
  ;;         (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
  ;;         (".*monaco-bold-.*-mac-roman" . 0.9)
  ;;         ("-cdac$" . 1.3)
  ;;         (".*MigMix.*" . 1.2))))
  ;; プライマリーに日本語フォントを指定するとフレーム幅が2倍になるバグ
  ;; (set-face-attribute 'default nil
  ;;                     :family "Migu 1M"
  ;;                     :height 180)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Migu 1M")))
