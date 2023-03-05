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
  ;; :ensure t
  :init
  ;; :pin melpa-stable
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ;; Recommended keymap prefix on macOS
              ("s-p" . projectile-command-map)
              ;; Recommended keymap prefix on Windows/Linux
              ("C-c p" . projectile-command-map)))

(provide 'init-projectile)
;;; init-projectile.el ends here
