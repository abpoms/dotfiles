;; Always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq fill-column 79)
(global-display-fill-column-indicator-mode)

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(use-package tree-sitter
  :hook (treesitter-after-on-hook . tree-sitter-hl-mode)
  :init (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(web-mode . tsx)))

(use-package highlight-indent-guides
  :pin "melpa"
  :hook
  (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'fill)
  (highlight-indent-guides-responsive nil))

(use-package direnv
  :config
  (direnv-mode))

(use-package evil
  :config
  (evil-mode 1))

(use-package ivy :ensure t
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
        ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	    ;; allow input not in order
        '((t   . ivy--regex-ignore-order))))

(use-package projectile
  :after f
  :config
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  (projectile-auto-discover nil)
  (when (file-directory-p "~/repos/")
    (projectile-project-search-path (f-directories "~/repos")))
  ;; Open magit when switching project
  (projectile-switch-project-action
   (lambda ()
     (let ((magit-display-buffer-function
            'magit-display-buffer-same-window-except-diff-v1))
       (magit))))
  ;; Ignore emacs project (source codes)
  ;; (projectile-ignored-projects '("~/emacs/"))
  ;; Do not include straight repos (emacs packages) and emacs directory itself
  ;; to project list
  (projectile-ignored-project-function
   (lambda (project-root)
     (string-prefix-p (expand-file-name user-emacs-directory) project-root)))
  (setq projectile-completion-system 'ivy)
  ;;:bind
  ;;("C-M-t" . fk/projectile-vterm)
  :hook
  (after-init . projectile-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package treemacs
  :custom
  (treemacs-width 35)
  :bind
  ("M-0" . treemacs-select-window)
  :config
  (treemacs-git-mode 'deferred))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(when (display-graphic-p) 
  (use-package treemacs-all-the-icons
    :after treemacs
    :config
    (treemacs-load-theme "all-the-icons")))

(use-package company
  :custom
  (company-idle-delay 0.25)
  (company-minimum-prefix-length 1)
  (company-tooltip-align-annotations t)
  (company-selection-wrap-around t)
  ;; Disable `single-candidate' and `echo-area' frontends
  (when (display-graphic-p)
    (company-frontends '(company-box-frontend)))
  (company-backends '(company-capf))
  (company-dabbrev-other-buffers t) ; search buffers with the same major mode
  :bind
  ( :map company-active-map
    ("TAB" . company-complte-selection)
    ("<tab>" . company-complete-selection)
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous))
  :hook
  (after-init . global-company-mode)
  :config
  (bind-key (kbd "<remap> <evil-next-line>") 'evil-next-visual-line evil-normal-state-map)
  (add-to-list 'company-begin-commands 'backward-delete-char-untabify))

(when (display-graphic-p)
  (use-package company-box
    :custom
    (company-box-show-single-candidate t)
    ;;(company-box-frame-behavior 'point)
    (company-box-icon-right-margin 0.5)
    ;;(company-box-backends-colors '((company-yasnippet . (:annotation default))))
    :hook
    (company-mode . company-box-mode)))

(use-package lsp-mode
  ;;:custom (lsp-file-watch-ignored-directories (push "[/\\\\]\\.direnv\\'" lsp-file-watch-ignored-directories))
  :config 
  (setq lsp-clients-typescript-server "deno")
  (setq lsp-disabled-clients '(ts-ls))
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (python-mode . lsp)
            (rjsx-mode . lsp))
            ;; if you want which-key integration
            ;;(lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

(use-package lsp-ui)

(use-package lsp-ivy)

(use-package lsp-pyright
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(use-package magit
  :config
  (setq magit-revert-buffers 1)
  (setq magit-use-overlays nil))

;; Automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; Don't display visible bell because of graphical artifact
(setq ring-bell-function 'ignore)

(setq mac-command-modifier nil)
(setq mac-option-modifier (quote meta))

;; Themes
(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-night t))

;; TRAMP settings
(setq tramp-shell-prompt-pattern
      "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")
(setq tramp-auto-save-directory "~/.emacs.d/autosave")
(setq tramp-default-method "ssh")


(if (eq system-type 'darwin)
    (setq shell-file-name "zsh"))
(add-to-list 'exec-path "/usr/local/bin")


;; Whitespace mode settings
(require 'whitespace)
(setq whitespace-style
      '(face tabs trailing lines-tail empty indentation:space))
(global-whitespace-mode t)

(add-hook 'rst-mode-hook (lambda () (global-whitespace-mode -1)))
(add-hook 'markdown-mode-hook (lambda () (global-whitespace-mode -1)))
(add-hook 'latex-mode-hook (lambda () (global-whitespace-mode -1)))
(add-hook 'LaTeX-mode-hook (lambda () (global-whitespace-mode -1)))



(use-package electric
  :ensure t
  :init
  (progn
    (electric-pair-mode 1)))

;; Set default shell to bash
;; (setq shell-file-name "/bin/bash")
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

;; General emacs settings
(setq inhibit-startup-message t) ;; No splash screen
(setq initial-scratch-message nil) ;; No scratch message

;; Tab 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq-default fill-column 79)

;; Newline insert with C-n
(setq next-line-add-newlines t)

;; No more typing yes
(defalias 'yes-or-no-p 'y-or-n-p)

;; Dired
(setq dired-listing-switches "-alh")

;; IDO
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;; (use-package helm
;;   :init
;;   :config
;;   (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;         helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;         helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;         helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;         helm-ff-file-name-history-use-recentf t
;;         helm-echo-input-in-header-line t)

;;   (global-set-key (kbd "M-x") #'helm-M-x)
;;   (global-set-key (kbd "C-x C-f") #'helm-find-files)
  
;;   (helm-mode 1))

(use-package counsel
  :bind* ; load when pressed
  (("M-x"     . counsel-M-x)
   ("C-s"     . swiper)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-r" . counsel-recentf)  ; search for recently edited
   ("C-c g"   . counsel-git)      ; search for files in git repo
   ("C-c j"   . counsel-git-grep) ; search for regexp in git repo
   ("C-c /"   . counsel-ag)       ; Use ag for regexp
   ("C-x l"   . counsel-locate)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f"  . counsel-describe-function)
   ("<f1> v"  . counsel-describe-variable)
   ("<f1> l"  . counsel-find-library)
   ("<f2> i"  . counsel-info-lookup-symbol)
   ("<f2> u"  . counsel-unicode-char)
   ("C-c C-r" . ivy-resume))
  :config
  (counsel-mode +1))

;; For setting window width to 81 cols
(defun set-window-width (window n)
  "Set the a window's width."
  (adjust-window-trailing-edge window (- n (window-width window)) t))

(defun set-81-columns ()
  "Set the selected window to 81 columns."
  (interactive)
  (set-window-width (selected-window) 81))

(defun set-81-columns-all ()
  "Sets all windows to 81 columns."
  (interactive)
  (cl-loop for w being the windows do
           (set-window-width w 81)))

(defun replace-last-sexp ()
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (kill-sexp -1)
    (insert (format "%S" value))))

;; Global
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "C-x C-z") 'magit-status)

(global-set-key (kbd "C-x ~") 'set-81-columns-all)

(global-set-key (kbd "C-x r") 'replace-last-sexp)


(add-hook 'clojure-mode-hook
          (lambda ()
            (cljr-add-keybindings-with-prefix "C-c C-r")))

(add-hook 'graphviz-dot-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c t") 'dot2tex-buffer)))

;; Auto complete 
                                        ;(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop

(use-package anaconda-mode)
