(defun my-elisp-mode-hook ()
  (turn-on-eldoc-mode))

(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)


(defun my-lisp-mode-hook ()
  (setq inferior-lisp-program "sbcl"))

(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)


(provide 'init-lisp)
