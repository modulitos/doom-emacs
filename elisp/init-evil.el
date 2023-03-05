;;; -*- lexical-binding: t; -*-
;;;


;; Enable smash escape
;; Type 'jj' for smash escape
(evil-define-command cofi/maybe-exit-jj ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
                           nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
        (delete-char -1)
        (set-buffer-modified-p modified)
        (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                                              (list evt))))))))

(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "C-p") nil)
  (define-key evil-normal-state-map (kbd "C-p") 'consult-buffer)

  ;; override
  (define-key evil-normal-state-map (kbd "C-<tab>") nil)
  ;; (define-key evil-normal-state-map [C-tab] nil)
  (define-key evil-insert-state-map "j" #'cofi/maybe-exit-jj)
  (define-key evil-motion-state-map "\C-w" nil)
  )

(with-eval-after-load 'evil-org
  ;; overrides metadown/up to enable window switching:
  (define-key evil-org-mode-map (kbd "<normal-state> M-j") nil)
  (define-key evil-org-mode-map (kbd "<insert-state> M-j") nil)
  (define-key evil-org-mode-map (kbd "<visual-state> M-j") nil)
  (define-key evil-org-mode-map (kbd "<normal-state> M-k") nil)
  (define-key evil-org-mode-map (kbd "<insert-state> M-k") nil)
  (define-key evil-org-mode-map (kbd "<visual-state> M-k") nil)

  ;; overrides keybindings to enable evil visual-line fuctions:
  (define-key evil-org-mode-map (kbd "<motion-state> g k") nil)
  (define-key evil-org-mode-map (kbd "<motion-state> g j") nil)

  ;; evil binds <tab> to evil-jump-forward by default.
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
  )

;; You can surround in visual-state with S<textobject> or
;; gS<textobject>. Or in normal-state with ys<textobject> or
;; yS<textobject>.
;; (global-evil-surround-mode 1)
(use-package evil-surround
  :config
  (defun my-evil-surround-mode-hook ()
    (push '(?\] . ("{{c1::" . "}}")) evil-surround-pairs-alist)
    ;; maybe there's a way to only set this once?
    ;; (setq-default evil-surround-pairs-alist
    ;;               (push '(?\] . ("{{c1::" . "}}")) evil-surround-pairs-alist)
    ;;               evil-surround-pairs-alist)
  )
  :hook ((evil-surround-mode . my-evil-surround-mode-hook))
)

(provide 'init-evil)
;;; init-evil.el ends here
