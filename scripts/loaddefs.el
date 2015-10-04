;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cuda-mode) "cuda-mode" "cuda-mode.el" (21646 19044
;;;;;;  0 0))
;;; Generated autoloads from cuda-mode.el

(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))

(autoload 'cuda-mode "cuda-mode" "\
Major mode for editing CUDA Cuda is a C like language extension
for mixed native/GPU coding created by NVIDA
 
The hook `c-mode-common-hook' is run with no args at mode
initialization, then `cuda-mode-hook'.

Key bindings:
\\{cuda-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (update-autoloads-for-file-in-package-area update-autoloads-in-package-area)
;;;;;;  "update-auto-loads" "update-auto-loads.el" (21116 46762))
;;; Generated autoloads from update-auto-loads.el

(setq load-path (cons (file-name-directory load-file-name) load-path))

(autoload 'update-autoloads-in-package-area "update-auto-loads" "\
Update autoloads for files in the diretory containing this file.

\(fn &optional FILE)" t nil)

(autoload 'update-autoloads-for-file-in-package-area "update-auto-loads" "\


\(fn FILE)" t nil)

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
