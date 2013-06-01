(setq url-proxy-services '(("http" . "127.0.0.1:8087")
                           ("https" . "127.0.0.1:8087")))
;; (setq url-proxy-services nil)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/init-packages")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq
 el-get-sources
 '((:name edit-server
          :after (progn (require 'edit-server)
                        (edit-server-start)))

   (:name color-theme-tangotango
          :after (progn (add-to-list 'custom-theme-load-path
                                     "~/.emacs.d/el-get/color-theme-tangotango")
                        (load-theme 'tangotango t)))

   (:name auto-complete
          :type git
          :url "https://github.com/auto-complete/auto-complete")
   (:name auto-complete-yasnippet)
   (:name auto-complete-clang)

   (:name ace-jump-mode
          :after (progn (global-set-key (kbd "C-;") 'ace-jump-mode)))

   (:name browse-kill-ring
          :after (progn (browse-kill-ring-default-keybindings)))

   (:name ido-ubiquitous)

   (:name smex
          :after (progn (setq smex-save-file "~/.emacs.d/.smex-items")
                        (global-set-key (kbd "M-x") 'smex)
                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name yasnippet
          :after (progn (setq yas-snippet-dirs '("~/.emacs.d/el-get/yasnippet/snippets"))
                        (yas-global-mode 1)))

   (:name magit
          :after (progn (global-set-key (kbd "C-<f2>") 'magit-status)))

   (:name xcscope)

   (:name htmlize)

   (:name paredit
          :after (progn (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
                        (add-hook 'lisp-mode-hook       'paredit-mode)))

   (:name rainbow-mode
          :after (progn (add-hook 'css-mode-hook (lambda () (rainbow-mode)))))

   (:name zencoding-mode)

   (:name markdown-mode)

   (:name yaml-mode)

   (:name go-mode)

   (:name graphviz-dot-mode)))

(el-get 'sync (mapcar 'el-get-source-name el-get-sources))


(provide 'init-el-get)
