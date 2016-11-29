(use-package writeroom-mode
  :init
  (setq evil-cross-lines t)
  :config
  (bind-key (kbd "<remap> <evil-next-line>") 'evil-next-visual-line evil-normal-state-map)
  (bind-key (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line evil-normal-state-map)
  (bind-key (kbd "<remap> <evil-next-line>") 'evil-next-visual-line evil-normal-state-map)
  (bind-key (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line evil-normal-state-map))
