;; Always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; Set theme
(load-theme 'solarized-dark t)

(setq mac-command-modifier nil)
(setq mac-option-modifier (quote meta))


;; TRAMP settings
(setq tramp-shell-prompt-pattern
      "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")
(setq tramp-auto-save-directory "~/.emacs.d/autosave")
(setq tramp-default-method "ssh")

(setq shell-file-name "zsh")
(add-to-list 'exec-path "/usr/local/bin")


;; Whitespace mode settings
(require 'whitespace)
(setq whitespace-style
    '(face tabs trailing lines-tail empty indentation:space))
(global-whitespace-mode t)

;; Set default shell to bash
;; (setq shell-file-name "/bin/bash")
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

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


;; Graphical switch window
(require 'switch-window)

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

;; Global
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-x C-z") 'magit-status)

(global-set-key (kbd "C-x ~") 'set-80-columns)

(global-set-key (kbd "C-x r") 'replace-last-sexp)


(add-hook 'clojure-mode-hook
          (lambda ()
            (cljr-add-keybindings-with-prefix "C-c C-r")))

(add-hook 'graphviz-dot-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c t") 'dot2tex-buffer)))

;; Auto complete 
;(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop
