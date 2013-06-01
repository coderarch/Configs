(add-to-list 'load-path "~/.emacs.d")

(require 'init-basic)
(require 'init-key-binding)
(require 'init-defun)

(require 'init-el-get)
(require 'init-ido)
(require 'init-auto-complete)
;;; TODO: flymake flyspell spelling

(require 'init-gnus)
(require 'init-org)

(require 'init-develop)
(require 'init-cc)
(require 'init-python)                  ;TODO: jedi
(require 'init-lisp)                    ;TODO: slime common lisp
(require 'init-web)                     ;TODO: mmm javascript nxml css haml yaml less scss


(setq custom-file "custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
