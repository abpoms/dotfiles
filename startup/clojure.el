(use-package clojure-mode
  :init
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook
    '(lambda () (define-key clojure-mode-map "\M-[" 'paredit-wrap-square)))
(add-hook 'clojure-mode-hook
    '(lambda () (define-key clojure-mode-map "\M-{" 'paredit-wrap-curly))))

;; (use-package cider)
;; (use-package slamhound)
;; (use-package ac-nrepl)
;; (use-package ensime)

;; ;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; ; ac-nrepl-popup for doc's instead of cider-doc
;; (eval-after-load "cider" 
;;   '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
