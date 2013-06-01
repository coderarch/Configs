;; change the default key bindings
(global-set-key (kbd "C-z")      'other-window)
(global-set-key (kbd "C-x k")    'kill-this-buffer)
(global-set-key (kbd "C-x C-k")  'kill-buffer-and-window)
(global-set-key (kbd "M-/")      'hippie-expand)

;; add key bindings
(global-set-key (kbd "C-c j")    'join-line)

(global-set-key (kbd "C-M-=")    'text-scale-increase)
(global-set-key (kbd "C-M--")    'text-scale-decrease)


(provide 'init-key-binding)
