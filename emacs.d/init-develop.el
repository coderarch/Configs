(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun turn-on-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|WARN\\|BUG\\(S\\)?\\)"
          1 font-lock-warning-face t))))

(defun my-prog-mode-hook ()
  (turn-on-watchwords)
  (local-set-key (kbd "RET") 'electrify-return-if-match))

(add-hook 'prog-mode-hook 'my-prog-mode-hook)


(provide 'init-develop)
