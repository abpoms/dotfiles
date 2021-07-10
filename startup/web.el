(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-style-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  :hook ((web-mode . (lambda ()
                       (if (equal web-mode-content-type "javascript")
                           (web-mode-set-content-type "jsx"))))))

(use-package tide
  :ensure t
  :after (evil web-mode company flycheck)
  :hook ((web-mode . (lambda ()
                       (when (string-equal "tsx" (file-name-extension buffer-file-name))
                         (tide-mode)
                         (tide-setup)
                         (tide-hl-identifier-mode))))
         (typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)
         (tide-mode . (lambda()
                        (progn
                          (message "hi")
                          (evil-make-overriding-map tide-mode-map 'normal)
                          (evil-normalize-keymaps))))))
