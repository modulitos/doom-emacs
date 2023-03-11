;;; elisp/init-go.el -*- lexical-binding: t; -*-
;;;


(use-package go-mode
  :mode (("\\.org$" . org-mode))
  :config
  (defun my-go-mode-hook ()
    ;; Use goimports instead of gofmt:
    ;; https://pkg.go.dev/golang.org/x/tools/cmd/goimports
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    )

  :hook ((go-mode . my-go-mode-hook))
  )

(provide 'init-go)
;;; init-go.el ends here
