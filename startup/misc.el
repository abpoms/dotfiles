(use-package scss-mode)
(use-package less-css-mode)
;; Scala
(use-package scala-mode2)
;; Editing
(use-package ace-window
  :bind ("M-p" . ace-window))
(use-package avy
  :bind ("C-:" . avy-goto-word-or-subword-1))
(use-package paredit)
(use-package auto-complete)
(use-package multiple-cursors)

;; Themes
(use-package solarized-theme)

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
