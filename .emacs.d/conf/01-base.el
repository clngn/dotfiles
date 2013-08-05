;; インデントを半角スペースに、幅は4
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq-default tab-width 4)

;; 自動インデント
(setq-default tab-always-indent t)

;; コメントアウトの設定
(setq comment-style 'multi-line)

;; バックアップファイルの無効
(setq make-backup-files nil)

;; 終了時に自動保存ファイルを削除
(setq delete-auto-save-files t)

;; 保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ファイルの最後に改行を入れる
(setq require-final-newline t)


;; enable to pop `mark-ring' repeatedly like C-u C-SPC C-SPC ...
(setq set-mark-command-repeat-pop t)

;; 閉じ括弧の補完
(when (>= emacs-major-version 24)
    (electric-pair-mode t))

;; VCSの設定
;; VCSのシンボリックリンクの読み込みを許可
;; (setq vc-follow-symlinks t)
;; VCSによる変更をチェック
;; (setq auto-revert-check-vc-info t)
;; バッファ自動更新
;; (global-auto-revert-mode t)
;; バッファ更新頻度(秒)
;; (setq auto-revert-interval 1)
