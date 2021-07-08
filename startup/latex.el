(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))

(add-hook 'plain-TeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "\\(" "\\)"))))
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'writeroom-mode)
(setq whitespace-global-modes '(not LaTeX-mode))

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin:/usr/local/bin:"))
(setq exec-path (append exec-path '("/usr/texbin" "/usr/local/bin")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)

;; Dot2tex
(defun dot2tex-file (file)
  "Run dot2tex on the current buffer"
  (set-process-sentinel
   (start-process-shell-command
    "dot2tex" nil
    (format (concat "dot2tex --figonly --preproc -ftikz %s "
                    "| dot2tex --figonly > %s.tex")
            file (file-name-sans-extension file)))
   (lambda (process event)
     (minibuffer-message "dot2tex finished"))))

(defun dot2tex-buffer ()
  "Run dot2tex on the current buffer"
  (interactive)
  (dot2tex-file (buffer-file-name)))
