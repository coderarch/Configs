(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete/lib/popup")
(require 'auto-complete-config)
(ac-config-default)

(setq ac-auto-start 4)
(setq ac-ignore-case 'smart)

(define-key ac-complete-mode-map (kbd "C-h") 'ac-help)
(define-key ac-complete-mode-map (kbd "M-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "M-n") 'ac-next)

(require 'auto-complete-clang)

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)


(provide 'init-auto-complete)
