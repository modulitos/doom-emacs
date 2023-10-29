;;; elisp/init-js.el -*- lexical-binding: t; -*-
;;;
;;;
;;;
;;;
(use-package typescript-mode
  :config
  (defun my-ts-mode-hook ()
    ;; (local-set-key (kbd "M-b") 'tide-jump-back)
    ;; (local-set-key (kbd "M-RET") 'tide-jump-to-definition)
    ;;
    (local-set-key (kbd "M-b") 'xref-go-back)
    (local-set-key (kbd "M-RET") '+lookup/definition)
    )

  :hook ((typescript-mode . my-ts-mode-hook))
  )

(use-package web-mode
  :config
  (defun my-web-mode-hook ()
    (message "inside web mode hook!")
    (local-set-key (kbd "M-b") 'xref-go-back)
    (local-set-key (kbd "M-RET") '+lookup/definition)

    ;; for aphelia formatting
    ;; https://github.com/doomemacs/doomemacs/blob/986398504d09e585c7d1a8d73a6394024fe6f164/modules/editor/format/README.org#disabling-the-lsp-formatter
    (setq +format-with-lsp nil)
    )

  :hook ((web-mode . my-web-mode-hook))
  )

(provide 'init-js)
;;; init-js.el ends here
