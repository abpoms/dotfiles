(defvar my-packages '(ace-jump-mode
                      better-defaults
                      clojure-mode
                      paredit
                      cider
                      slamhound
                      scala-mode2
                      ensime
                      switch-window
                      exec-path-from-shell
                      auto-complete
                      ac-nrepl
                      switch-window
                      buffer-move
                      solarized-theme
                      jedi
                      idle-highlight-mode ;; ido-ubiquitous
                      yaml-mode
                      magit
                      smex
                      markdown-mode
                      multiple-cursors
                      sunrise-commander
                      sunrise-x-buttons
                      sunrise-x-loop
                      less-css-mode
                      evil
                      glsl-mode
                      auctex
                      auto-complete-auctex
                      matlab-mode
                      graphviz-dot-mode
                      lua-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
