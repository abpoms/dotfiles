(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("SC"  . "http://joseito.republika.pl/sunrise-commander/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Check emacs.d for elisp files
(add-to-list 'load-path "~/.emacs.d/")

(load "~/.emacs.d/init_packages")
(load "~/.emacs.d/init_settings")
(load "~/.emacs.d/init_keybindings")


;; Autoload defs
(load-file "~/.emacs.d/scripts/loaddefs.el")
(add-hook 'kill-emacs-hook '(lambda () (update-autoloads-in-package-area)))    

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.8)
 '(background-color "#042028")
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color "#708183")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#708183")
 '(js3-auto-indent-p t)
 '(js3-compact-case t)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-curly-indent-offset 0)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 0)
 '(js3-indent-dots t)
 '(js3-indent-level 4)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-dots t)
 '(js3-lazy-operators t)
 '(js3-square-indent-offset 0)
 '(js3-strict-cond-assign-warning t)
 '(mac-command-modifier nil)
 '(mac-option-modifier (quote meta))
 '(magit-revert-buffers 1)
 '(magit-use-overlays nil)
 '(org-export-backends (quote (ascii html icalendar latex md))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )









