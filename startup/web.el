(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq-default indent-tabs-mode nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-style-indent-offset 2)
    (setq web-mode-code-indent-offset 2))
  (add-hook 'web-mode-hook  'my-web-mode-hook))
