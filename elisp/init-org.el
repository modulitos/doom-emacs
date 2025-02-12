;;; elisp/init-org.el -*- lexical-binding: t; -*-
;;; package -- summary
;;; commentary:
;; ORG ROAM MODE
;;

;;; Code:

(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (defun my-org-mode-hook ()
    "Hooks for Org mode."
    (local-unset-key [C-tab])
    ;; allow window resizing via M-l and M-h
    ;; (fixed in evil-org-mode hook?)
    (local-unset-key (kbd "M-l"))
    (local-unset-key (kbd "M-j"))
    (local-unset-key (kbd "M-k"))
    (local-unset-key (kbd "M-h"))
    (local-unset-key (kbd "C-q"))

    (flyspell-mode t)

    ;; From evil-surround package to support anki cloze cards:
    ;; (message "adding to evil surround")
    ;; (push '(?z . ("{{c1::" . "}}")) evil-surround-pairs-alist)
    ;; (push '(z . ("{{c1::" . "}}")) evil-surround-pairs-alist)
    ;; (push '(?c1 . ("{{c1::" . "}}")) evil-surround-pairs-alist)
    ;; (push '(?c2 . ("{{c2::" . "}}")) evil-surround-pairs-alist)
    ;; (push '(?c3 . ("{{c3::" . "}}")) evil-surround-pairs-alist)

    ;; override default keybinding here:
    (local-set-key (kbd "C-S-i") 'whitespace-cleanup)

    ;; don't hide link urls
    ;; or M-x org-toggle-link-display
    (setq! org-link-descriptive nil)

    ;; (local-set-key (kbd "C-c C-c") 'org-table-align)
    ;; (local-unset-key (kbd "C-c C-c"))
    ;; (local-set-key (kbd "C-c C-f") 'org-table-calc-current-TBLFM)
    ;; default is "C-c C-x C-j"
    ;; (local-set-key (kbd "C-c C-g c") 'org-clock-goto)

    ;; (local-set-key (kbd "C-c C-b") 'org-babel-demarcate-block)
    (toggle-truncate-lines 0)

    (org-indent-mode t)
    ;; https://github.com/org-trello/org-trello/issues/249
    ;; (let ((filename (buffer-file-name (current-buffer))))
    ;;   (when (and filename (string= "trello" (file-name-extension filename)))
    ;;     (org-trello-mode)))

    )
  :hook ((org-mode . my-org-mode-hook))
  )

(provide 'init-org)
;;; init-org.el ends here
