;; c-mode
(add-hook 'c-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (c-set-offset 'arglist-close 0)
             ))

;; c++-mode
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (c-set-offset 'arglist-close 0)  ; 関数の引数リストの閉じ括弧はインデントしない
             ))
