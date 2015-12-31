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

(global-set-key (kbd "C-x o") 'switch-window)

(global-set-key (kbd "C-x ~") 'set-80-columns)

(global-set-key (kbd "C-x r") 'replace-last-sexp)

(global-set-key (kbd "C-c C-x") 'sunrise)
(global-set-key (kbd "C-c X") 'sunrise-cd)

(add-hook 'clojure-mode-hook
          (lambda ()
            (cljr-add-keybindings-with-prefix "C-c C-r")))

(add-hook 'graphviz-dot-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c t") 'dot2tex-buffer)))

;; Auto complete 
;(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop





