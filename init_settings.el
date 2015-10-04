(require 'evil)
(evil-mode 1)

;; Whitespace mode settings
(require 'whitespace)
(setq whitespace-style
    '(face tabs trailing lines-tail empty indentation:space))
(global-whitespace-mode t)

;; Set default shell to bash
(setq shell-file-name "/bin/bash")

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

; No more typing yes
(defalias 'yes-or-no-p 'y-or-n-p)

;; TRAMP settings
(setq tramp-shell-prompt-pattern
      "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")
(setq tramp-auto-save-directory "~/.emacs.d/autosave")
(setq tramp-default-method "ssh")

;; Set theme
(load-theme 'solarized-dark t)

;; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; For setting window width to 80 cols
(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 80))

(defun replace-last-sexp ()
    (interactive)
    (let ((value (eval (preceding-sexp))))
      (kill-sexp -1)
      (insert (format "%S" value))))

;; TODO(abp): fix env variables in fish to propagate to bash 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs Lisp 

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook
    '(lambda () (define-key clojure-mode-map "\M-[" 'paredit-wrap-square)))
(add-hook 'cider-repl-mode-hook
    '(lambda () (define-key clojure-mode-map "\M-{" 'paredit-wrap-curly)))
(setq cider-repl-popup-stacktraces t)


(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(require 'clj-refactor)

;;;;;;;;;;;;;;;;;;;;;
;; Clojure ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;

(add-hook 'clojure-mode-hook 'paredit-mode)

(add-hook 'clojure-mode-hook
    '(lambda () (define-key clojure-mode-map "\M-[" 'paredit-wrap-square)))
(add-hook 'clojure-mode-hook
    '(lambda () (define-key clojure-mode-map "\M-{" 'paredit-wrap-curly)))

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))


; ac-nrepl-popup for doc's instead of cider-doc
(eval-after-load "cider" 
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; Graphical switch window
(require 'switch-window)
    
;; Rainbow parens
(require 'rainbow-delimiters)

;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))

;;;;;;;;;;;;;;;;;;;;;
;; JavaScript     ;;;
;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
;; HTML            ;;
;;;;;;;;;;;;;;;;;;;;;

(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-basic-offset) 4)
            (sgml-guess-indent)))

;;;;;;;;;;;;;;;;;;;;;
;; LESS           ;;;
;;;;;;;;;;;;;;;;;;;;;

(setq css-indent-offset 2)

;;;;;;;;;;;;;;;;;;;;;
;; ClojureScript ;;;;
;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; nrepl hooks
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)


;;;;;;;;;;;;;;;;;;;;;
;; Plaintext       ;;
;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode 'visual-line-mode)
(setq sentence-end "\\.[:space:]")

;;;;;;;;;;;;;;;;;;;;;
;; GLSL Mode       ;;
;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\.glsl" . glsl-mode))
(add-to-list 'auto-mode-alist '("\.frag" . glsl-mode))
(add-to-list 'auto-mode-alist '("\.vert" . glsl-mode))
(add-to-list 'auto-mode-alist '("\.geom" . glsl-mode))

;;;;;;;;;;;;;;;;;;;;;
;; AucTeX          ;;
;;;;;;;;;;;;;;;;;;;;;
(add-hook 'plain-TeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "\\(" "\\)"))))
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/bin:"))
(setq exec-path (append exec-path '("/usr/texbin" "/usr/local/bin")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)

;;;;;;;;;;;;;;;;;;;;;
;; Dot-mode        ;;
;;;;;;;;;;;;;;;;;;;;;
(defun dot2tex-file (file)
  "Run dot2tex on the current buffer"
  (set-process-sentinel
   (start-process-shell-command
    "dot2tex" nil
    (format (concat "dot2tex --figonly --preproc -ftikz %s "
                    "| dot2tex --figonly > %s.tex")
            file (file-name-sans-extension file)))
   (lambda (process event)
     (minibuffer-message "dot2tex finished"))))

(defun dot2tex-buffer ()
  "Run dot2tex on the current buffer"
  (interactive)
  (dot2tex-file (buffer-file-name)))

;; EVIL Mode
(loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                              (nrepl-mode . insert)
                              (pylookup-mode . emacs)
                              (comint-mode . normal)
                              (shell-mode . insert)
                              (git-commit-mode . insert)
                              (git-rebase-mode . emacs)
                              (term-mode . emacs)
                              (help-mode . emacs)
                              (helm-grep-mode . emacs)
                              (grep-mode . emacs)
                              (bc-menu-mode . emacs)
                              (magit-branch-manager-mode . emacs)
                              (rdictcc-buffer-mode . emacs)
                              (dired-mode . emacs)
                              (wdired-mode . normal))
      do (evil-set-initial-state mode state))

;; Processing Mode
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
(setq processing-location "/usr/bin/processing-java")

;; Cuda mode
(autoload 'cuda-mode "cuda-mode" "Cuda mode" t)

;; Python
(autoload 'python-mode "~/.emacs.d/plugins/emacs-for-python/epy-init.el" "" t)
(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
