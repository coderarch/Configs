(ido-mode 1)
(ido-ubiquitous-mode 1)

(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")

(defun ido-sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x F") 'ido-sudo-edit)


(provide 'init-ido)
