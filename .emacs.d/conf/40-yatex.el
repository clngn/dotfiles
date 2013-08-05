;; YaTeX-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (setq auto-fill-function nil)
             ))
(setq tex-command "platex2pdf") ; スクリプトを使って直接pdfにコンパイル
(setq dvi2-command "open -a Preview.app")  ; プレビュー.appでpdfを開く
(setq bibtex-command "pbibtex")
(setq YaTeX-typeset-auto-rerun nil)
