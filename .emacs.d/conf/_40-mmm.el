;; mmm-mode
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(set-face-background 'mmm-default-submode-face nil)  ; 色分けしない
(mmm-add-mode-ext-class nil "\\.php\\'" 'html-php)
(mmm-add-classes
    '((html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>")))
