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

(use-package markdown
  :mode (("\\.md$" . markdown-mode))
  :config
  (defun my-markdown-mode-hook ()
    (message "inside markdown!")
    (flyspell-mode t)
    )
  :hook ((markdown-mode . my-markdown-mode-hook))
  )

(provide 'init-markdown)
;;; init-markdown.el ends here
