;;; -*- lexical-binding: t; -*-


;; (with-eval-after-load 'markdown-mode-map
;;   (message "evaling markdown!")
;;   (define-key markdown-mode-map (kbd "M-j") nil)
;;   (define-key markdown-mode-map (kbd "M-k") nil)
;;   )

;; (map! :after markdown
;;       :map markdown-mode-map
;;       [M-j] nil
;;       [M-k] nil
;;       )


;; (use-package markdown
;;   :mode (("\\.md$" . markdown-mode))
;;   :config
;;   (defun my-markdown-mode-hook ()
;;     "Hooks for markdown mode."
;;     (message "use package markdown")
;;     ;; allow jumping between windows:
;;     (local-unset-key (kbd "M-j"))
;;     (local-unset-key (kbd "M-k"))
;;     (define-key markdown-mode-map (kbd "M-j") nil)
;;     (define-key markdown-mode-map (kbd "M-k") nil)

;;     ;; evil-markdown-mode-map <normal-state> M-k
;;     ;; evil-markdown-mode-map <visual-state> M-k

;;     (define-key markdown-mode-map [M-k] nil)

;;     )
;;   :hook ((markdown-mode . my-markdown-mode-hook))
;;   )

(provide 'init-markdown)
;;; init-markdown.el ends here
