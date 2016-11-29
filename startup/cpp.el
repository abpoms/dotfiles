(setq c-default-style "k&r")
(setq-default c-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))

(load "google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (kbd "C-M-\\") 'clang-format-region)))
