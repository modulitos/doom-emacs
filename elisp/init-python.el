;;; elisp/init-python.el -*- lexical-binding: t; -*-
;;;

;; This use-package is giving errors, not sure why:
;; File mode specification error: (error Loading file /home/lucas/.config/emacs/.local/straight/build-29.1/org/org-loaddefs.elc failed to provide feature ‘org-loaddefs’)
;;
;; Other use-package modes are working fine.
;;
;; When uncommented, this breaks type checking. Not sure why/how.

;; (use-package python-mode
;;   :mode (("\\.py$" . python-mode))
;;   :config
;;   (defun my-python-mode-hook ()
;;     ;; (setq lsp-pylsp-plugins-isort-enabled t)
;;     (message "inside python hook!")
;;     (add-hook 'before-save-hook 'py-isort-before-save)
;;     )

;;   :hook ((python-mode . my-python-mode-hook))
;;   )

(provide 'init-python)
;;; init-python.el ends here
