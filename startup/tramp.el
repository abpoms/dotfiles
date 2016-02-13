(use-package tramp ; Access remote files
  :defer t
  :config
  (setq tramp-shell-prompt-pattern
        "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")
  ;; Faster tramp
  (setq tramp-default-method "ssh")
  ;; Store auto-save files locally
  (setq tramp-auto-save-directory
        (locate-user-emacs-file "temp/tramp-auto-save")))
