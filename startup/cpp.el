(setq c-default-style "k&r")
(setq-default c-basic-offset 2)
(c-set-offset 'innamespace 0) ; No indent in namespace
(c-set-offset 'arglist-intro '+)
(c-set-offset 'arglist-close 0)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
