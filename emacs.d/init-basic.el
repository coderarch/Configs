(setq user-full-name "RickyHuang")
(setq user-mail-address "i.rickyhuang@gmail.com")

(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)
(setq inhibit-startup-message t)
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)
(setq shell-file-name "/bin/bash")

(prefer-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "•")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; disable mode
(menu-bar-mode       -1)
(tool-bar-mode       -1)
(scroll-bar-mode     -1)
(tooltip-mode        -1)

;; enable mode
(show-paren-mode      1)
(electric-pair-mode   1)
(cua-selection-mode   1)
(column-number-mode   1)

(defalias 'yes-or-no-p 'y-or-n-p)


(provide 'init-basic)
