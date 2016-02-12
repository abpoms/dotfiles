(defvar my-packages '(
                      ;; Style sheets
                      scss-mode
                      less-css-mode
                      ;; Scala
                      scala-mode2
                      ;; Clojure
                      clojure-mode
                      cider
                      slamhound
                      ac-nrepl
                      ensime
                      ;; Python
                      jedi
                      ;; Editing
                      ace-jump-mode
                      paredit
                      auto-complete
                      evil
                      ;; Themes
                      solarized-theme
                      ;; Misc
                      better-defaults
                      switch-window
                      exec-path-from-shell
                      buffer-move
                      idle-highlight-mode ;; ido-ubiquitous
                      yaml-mode
                      magit
                      smex
                      markdown-mode
                      multiple-cursors
                      sunrise-commander
                      sunrise-x-buttons
                      sunrise-x-loop

                      glsl-mode
                      auctex
                      auto-complete-auctex
                      matlab-mode
                      graphviz-dot-mode
                      lua-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
