;;; elisp/init-lsp.el -*- lexical-binding: t; -*-


;; https://github.com/flycheck/flycheck/issues/1762#issuecomment-749789589
;; Add buffer local Flycheck checkers after LSP for different major modes.
(defvar-local my-flycheck-local-cache nil)

(defun my-flycheck-local-checker-get (fn checker property)
  ;; Only check the buffer local cache for the LSP checker, otherwise we get
  ;; infinite loops.
  (if (eq checker 'lsp)
      (or (alist-get property my-flycheck-local-cache)
          (funcall fn checker property))
    (funcall fn checker property)))

(advice-add 'flycheck-checker-get
            :around 'my-flycheck-local-checker-get)

(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'python-mode)
              (setq my-flycheck-local-cache '((next-checkers . (python-mypy)))))))

;; https://hungyi.net/posts/doom-emacs-ergonomic-flycheck/
(after! flycheck
  (map! :leader
        ;; "c x" flycheck-command-map)
        "x" flycheck-command-map)
  )

;; (add-hook 'lsp-managed-mode-hook
;;           (lambda ()
;;             (when (derived-mode-p 'haskell-mode)
;;               (setq my-flycheck-local-cache '((next-checkers . (haskell-hlint)))))))
;; (add-hook 'lsp-managed-mode-hook
;;           (lambda ()
;;             (when (derived-mode-p 'sh-mode)
;;               (setq my-flycheck-local-cache '((next-checkers . (sh-shellcheck)))))))
;; (add-hook 'lsp-managed-mode-hook
;;           (lambda ()
;;             (when (derived-mode-p 'tex-mode)
;;               (setq my-flycheck-local-cache '((next-checkers . (tex-chktex)))))))

(provide 'init-lsp)
;;; init-lsp.el ends here
