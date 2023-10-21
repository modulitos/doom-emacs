;;; elisp/init-go.el -*- lexical-binding: t; -*-
;;;


(use-package go-mode
  :mode (("\\.go$" . go-mode))
  :config
  (defun my-go-mode-hook ()
    ;; Use goimports instead of gofmt:
    ;; https://pkg.go.dev/golang.org/x/tools/cmd/goimports
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key (kbd "M-b") 'better-jumper-jump-backward)
    (local-set-key (kbd "M-RET") '+lookup/definition)
    )

  :hook ((go-mode . my-go-mode-hook))
  )

(provide 'init-go)
;;; init-go.el ends here
