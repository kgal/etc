(add-to-list 'load-path "/home/kevin/opt/emacs-extras")
;; (add-to-list 'load-path "emacs-extras/scala-mode2-master")
;; (require 'scala-mode2)

(require 'mz-comment-fix)
(add-to-list 'comment-strip-start-length (cons 'nxml-mode 3))
(menu-bar-showhide-tool-bar-menu-customize-disable)
(global-set-key (kbd "C-=") 'compile)
(defun nxml-mode-local ()
  "My customizations for `nxml-mode'."
  (local-set-key "\M-'" 'nxml-finish-element)  
)
(add-hook 'nxml-mode-hook 'nxml-mode-local)
