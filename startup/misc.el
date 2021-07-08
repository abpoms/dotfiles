(use-package scss-mode)
(use-package less-css-mode)

(use-package cmake-mode)
;; Editing

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package avy
  :bind ("C-:" . avy-goto-word-or-subword-1))

(use-package paredit
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook
            '(lambda () (define-key clojure-mode-map "\M-["
                          'paredit-wrap-square)))
  (add-hook 'clojure-mode-hook
            '(lambda () (define-key clojure-mode-map "\M-{"
                          'paredit-wrap-curly))))

(use-package auto-complete)
(use-package multiple-cursors)

;; Misc
(use-package better-defaults)
(use-package exec-path-from-shell)
(use-package buffer-move)
(use-package idle-highlight-mode) ;; ido-ubiquitous
(use-package yaml-mode)
(use-package smex)
(use-package markdown-mode)
(use-package glsl-mode)

;; (use-package auctex
;;   :config
;;   (use-package auto-complete-auctex))

(use-package matlab-mode)
(use-package graphviz-dot-mode)
(use-package lua-mode)

(use-package toml-mode)
(use-package protobuf-mode)

(setq ac-delay 0.5)
