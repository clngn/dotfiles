;; ツールバーを表示しない
(tool-bar-mode 0)

;; ファイルをD&Dで開く
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;; タイトルバーに今開いてるファイル名を表示
(setq frame-title-format "%f - emacs")

;; スクロールバーを右側に表示
;; (set-scroll-bar-mode 'right)
;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; フリンジ表示
(setq-default indicate-buffer-boundaries 'right)

;; 起動時のメッセージを消す
;(setq inhibit-startup-message t)

;; 起動時の画像変更
(setq fancy-splash-image "~/.emacs.d/splash.png")

;; マウスホイールの設定
;; マウスホイールでのスクロール速度の設定
;; 通常 1、+Shift 5、+Control 1画面
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control) . nil)))
;; マウスホイールでのスクロールを加速しない
(setq mouse-wheel-progressive-speed nil)

;; 透過
(setq default-frame-alist
      (append (list '(alpha . (100 85)))
              default-frame-alist))

;; フレームサイズ
;; 高さをディスプレイ解像度に合わせて最大化
;; Mac用(メニューバーを考慮)
;; (when (window-system)
;;   (defvar myleft (- (x-display-pixel-width) (frame-pixel-width))
;;     "左端にフレームをセット")
;;   (defvar myheight (- (/ (- (x-display-pixel-height) 22) (frame-char-height)) 2)
;;     "ディスプレイ解像度に合わせた高さを設定")
;;   (setq initial-frame-alist
;;         (append (list
;;                  (cons 'width 80)
;;                  (cons 'height myheight)
;;                  (cons 'top 1)
;;                  (cons 'left myleft)
;;                  ) initial-frame-alist)))
