;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(inhibit-startup-screen t)
 '(rng-schema-locating-files (quote ("/home/kevin/opt/emacs-extras/SchemaAssocations.xml" "schemas.xml" "/usr/share/emacs/24.3/etc/schema/schemas.xml")))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(cond
 ((= 24 emacs-major-version)
  (add-to-list 'load-path "/home/kevin/opt/emacs-extras/scala-mode2-master")
  (require 'scala-mode2))
)
(add-to-list 'load-path "/home/kevin/opt/emacs-extras/selinux-modes")
(require 'selinux-te-mode)
(require 'selinuxpolicy-mode)
(add-to-list 'load-path "/home/kevin/opt/emacs-extras")
(require 'markdown-mode)

; Load multi-term. More friendly with zsh.
(require 'multi-term)

;; (add-to-list 'load-path "/home/kevin/opt/emacs-extras/polymode-master")
;; (require 'polymode)

(defun my-resize-window ()
  "Reset the COLUMNS environment variable to the current width of the window."
  (interactive)
  (let ((proc (get-buffer-process (current-buffer)))
        (str (format "export COLUMNS=%s" (window-width))))
    (funcall comint-input-sender proc str)))

(add-to-list 'load-path "/home/kevin/opt/emacs-extras")
(add-to-list 'load-path "emacs-extras/scala-mode2-master")
(require 'scala-mode2)

(require 'mz-comment-fix)
(add-to-list 'comment-strip-start-length (cons 'nxml-mode 3))

(setq auto-mode-alist (cons '("\\.prx$" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.xml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.te$" . selinux-te-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\._contexts$" . selinux-te-mode) auto-mode-alist))

; Remove the menubar
(menu-bar-showhide-tool-bar-menu-customize-disable)

(global-set-key (kbd "C-c !") 'multi-term)
(global-set-key (kbd "C-=") 'compile)
(fset 'kg-append-indent-slashes
   [?\C-e ?/ ?/ ?  ?/ ?/ ?  ?\C-a ?\C-s ?/ ?/ ?\C-b ?\C-b ?\C-6 ?\C-7 ?  ?\C-a ?\C-u ?\C-6 ?\C-7 ?\M-x ?m ?o ?v ?e ?- ?t ?o ?- ?c ?o ?l ?u ?m ?n return ?\C-  ?\C-s ?/ ?/ ?\C-b ?\C-b ?\C-w ?\C-s ?/ ?/ ?  ?\C-s ?\C-b ?\C-b ?\C-b ?\C-k])

(setq compile-command "build-it")


(defun nxml-mode-local ()
  "My customizations for `nxml-mode'."
  (local-set-key "\M-'" 'nxml-finish-element)  
)

(defun scala-mode-local ()
  "My customizations for `scala-mode'."
  (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region);
)

(add-hook 'scala-mode-hook 'scala-mode-local)
(add-hook 'nxml-mode-hook 'nxml-mode-local)
