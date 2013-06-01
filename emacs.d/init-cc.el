(defun my-gdb-mode-hook ()
  (setq gdb-many-windows t)
  (setq gdb-use-separate-io-buffer t))

(add-hook 'gdb-mode-hook 'my-gdb-mode-hook)

(defun my-c-mode-common-hook ()
  (setq c-default-style "k&r")
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t)

  (setq compile-command ""
        compilation-ask-about-save nil
        compilation-auto-jump-to-first-error t)

  (local-set-key (kbd "C-c C-f") 'ff-find-other-file)

  (hs-minor-mode 1)
  (local-set-key (kbd "C-c -")   'hs-hide-block)
  (local-set-key (kbd "C-c =")   'hs-show-block)

  (local-set-key (kbd "C-c c")   'compile)
  (local-set-key (kbd "C-c g")   'gdb)
  (local-set-key (kbd "C-c C-c") 'recompile)

  (local-set-key [f5]   'gud-run)
  (local-set-key [f6]   'gud-cont)
  (local-set-key [f7]   'gud-until)
  (local-set-key [f8]   'gud-print)
  (local-set-key [f9]   'gud-break)
  (local-set-key [C-f9] 'gud-remove)
  (local-set-key [f10]  'gud-next)
  (local-set-key [f11]  'gud-step))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun my-c++-mode-hook ()
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inline-open '0)
  )

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(provide 'init-cc)
