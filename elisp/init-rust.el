;;; elisp/init-rust.el -*- lexical-binding: t; -*-


(use-package rustic
  :mode (("\\.rs$" . rustic-mode))
  :config
  (defun my-rust-mode-hook ()
    (local-set-key (kbd "M-b") 'better-jumper-jump-backward)
    (local-set-key (kbd "M-RET") '+lookup/definition)
    )

  :hook ((rustic-mode . my-rust-mode-hook))
  )

(provide 'init-rust)
;;; init-rust.el ends here
