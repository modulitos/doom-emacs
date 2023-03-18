;;; -*- lexical-binding: t; -*-
;;;
;;; package --- summary
;;; Commentary:
;;;


;; Projectile

;; https://docs.projectile.mx/projectile/installation.html
;; https://docs.projectile.mx/projectile/index.html
;; https://github.com/bbatsov/projectile
(use-package projectile
  :config
  (defun my-projectile-mode-hook ()
    (local-unset-key (kbd "C-p"))
    (local-set-key (kbd "C-p") 'projectile-find-file)
    )

  ;; :bind (:map projectile-mode-map
  ;;             ;; Recommended keymap prefix on macOS
  ;;             ("s-p" . projectile-command-map)
  ;;             ;; ("C-p" . projectile-command-map)
  ;;             ;; Recommended keymap prefix on Windows/Linux
  ;;             ("C-c p" . projectile-command-map))
  :hook ((projectile-mode . my-projectile-mode-hook))
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
