(defun insert-info (info)
  (interactive "sInsert info: ")
  (cond
   ((string= info "name")       (insert user-full-name))
   ((string= info "email")      (insert user-mail-address))

   ((string= info "buffername") (insert (buffer-name)))
   ((string= info "filename")   (insert (buffer-file-name)))

   ((string= info "date")       (insert (format-time-string "%Y-%m-%d" (current-time))))
   ((string= info "time")       (insert (format-time-string "%T" (current-time))))
   ((string= info "datetime")   (insert (format-time-string "%Y-%m-%d %T" (current-time))))))

(global-set-key (kbd "C-c i")   'insert-info)


(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name)
      (error "No file is currently being edited"))
  (when (yes-or-no-p
         (format "Really delete '%s'?"
                 (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun operate-file (cmd)
  (interactive "sOperate file: ")
  (cond
   ((string= cmd "rename")       (rename-this-file-and-buffer (read-string "To: ")))
   ((string= cmd "delete")       (delete-this-file))))

(global-set-key (kbd "C-c f")    'operate-file)


(defun split-window-vertically-with-other-buffer ()
  (interactive)
  (split-window-vertically)
  (set-window-buffer (next-window) (other-buffer)))

(defun split-window-horizontally-with-other-buffer ()
  (interactive)
  (split-window-horizontally)
  (set-window-buffer (next-window) (other-buffer)))

(global-set-key (kbd "C-x 2")     'split-window-vertically-with-other-buffer)
(global-set-key (kbd "C-x 3")     'split-window-horizontally-with-other-buffer)


(defun clean-and-save-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

(global-set-key (kbd "C-x C-s")    'clean-and-save-buffer)
(add-hook 'makefile-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-x C-s") 'save-buffer)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-x C-r")     'eval-and-replace)


(provide 'init-defun)
