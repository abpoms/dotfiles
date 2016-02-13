(require 'tramp) ;; Need to require for use-package packages


;; Set path to dependencies
(setq startup-dir
      (expand-file-name "startup" user-emacs-directory))

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path startup-dir)
(add-to-list 'load-path site-lisp-dir)

(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'package)
(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("SC"  . "http://joseito.republika.pl/sunrise-commander/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Always install packages if not present
(setq use-package-always-ensure t)

(dolist (startup-script (directory-files startup-dir t "\\w+"))
  (load startup-script))
