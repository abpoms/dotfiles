(setq c-default-style "k&r")
(setq-default c-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
        (if (> tab-count space-count) (setq indent-tabs-mode t))))

(load "google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-hook
          (lambda ()
            (infer-indentation-style)
            (local-set-key (kbd "C-M-\\") 'clang-format-region)))
