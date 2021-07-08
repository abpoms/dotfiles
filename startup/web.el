(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (if (equal web-mode-content-type "javascript")
        (web-mode-set-content-type "jsx"))
    (setq-default indent-tabs-mode nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-attr-indent-offset 2)
    (setq web-mode-style-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-enable-css-colorization t))
  (add-hook 'web-mode-hook  'my-web-mode-hook))
