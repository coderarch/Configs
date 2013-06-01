(require 'org-latex)

(global-set-key (kbd "C-<f1>") 'org-agenda)
(setq org-agenda-files (list "~/Documents/org/todo.org"))

(setq org-src-fontify-natively t)

(setq org-latex-to-pdf-process '("xelatex -interaction nonstopmode %f"))
(add-to-list 'org-export-latex-classes
             '("org-latex-cn"
               "\\documentclass[a4paper]{article}
               \\usepackage{graphicx}
               \\usepackage[text={16cm,24cm}]{geometry}
               \\usepackage{xeCJK}
               \\setCJKmainfont{WenQuanYi Zen Hei}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(provide 'init-org)
