;;; elisp/init-modes.el -*- lexical-binding: t; -*-
;;; package -- summary
;;; commentary:
;; ORG ROAM MODE
;;

;;; Code:


;; Enable smash escape
;; Type 'jj' for smash escape
(define-key evil-insert-state-map "j" #'cofi/maybe-exit-jj)
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


;; (add-hook 'evil-mode-hook
;;           (lambda()
;;             (local-unset-key "C-/")
;;             (local-unset-key "C-z")
;;             (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;;             (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;;             )
;;           )

;; (eval-after-load "evil-maps"
;;   (dolist (map '(evil-motion-state-map

;;                  evil-insert-state-map
;;                  evil-emacs-state-map))
;;     (define-key (eval map) "\C-z" nil)
;;     (define-key (eval map) "\C-w" nil)
;;     )
;;   )

;; Hooks to enabe/disable evil in other modes
;; (add-hook 'term-mode-hook 'evil-emacs-state)
;; (add-hook 'ansi-term-mode-hook 'evil-emacs-state)

(use-package evil-surround
  :config
  ;; You can surround in visual-state with S<textobject> or
  ;; gS<textobject>. Or in normal-state with ys<textobject> or
  ;; yS<textobject>.
  (global-evil-surround-mode 1))


;;    (define-key (eval map) (kbd "C-/") nil)))

;; (add-hook 'undo-tree-mode (lambda () (local-unset-key "C-/")))

;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;; ;; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ;; C-u interferes with org-mode bindings
;; ;; (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
;; (define-key evil-insert-state-map (kbd "C-u")
;;   (lambda ()
;;     (interactive)
;;     (evil-delete (point-at-bol) (point))))

;; evil-little-word bindings for camelCase:
;; (define-key evil-operator-state-map (kbd "b") 'evil-backward-little-word-begin)
;; (define-key evil-normal-state-map (kbd "w") 'subword-right)
;; (define-key evil-normal-state-map (kbd "b") 'subword-left)

;; ;; key translations
;; ;; ie: translate zh to C-h and zx to C-x
;; (define-key evil-normal-state-map "z" nil)
;; (define-key evil-motion-state-map "zu" 'universal-argument)
;; (define-key key-translation-map (kbd "zh") (kbd "C-h"))
;; (define-key key-translation-map (kbd "zx") (kbd "C-x"))

;;; esc quits pretty much anything (like pending prompts in the minibuffer)

;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; (define-key evil-insert-state-map "ㅏ" #'cofi/maybe-exit-ㅏㅓ)
;;(define-key evil-insert-state-map "j" #'cofi/maybe-exit-ㅏㅓ)
;; Set 'ㅏㅓ' to exit insert mode
;;(evil-define-command cofi/maybe-exit-ㅏㅓ ()
;;  :repeat change
;;  (interactive)
;;  (let ((modified (buffer-modified-p)))
;;    (insert "ㅏ")
;;    (let ((evt (read-event (format "Insert %c to exit insert state" ?ㅓ)
;; (let ((evt (read-event (format "Insert %c to exit insert state" ?)
;;               nil 0.5)))
;;      (cond
;;       ((null evt) (message ""))
;;       ((and (integerp evt) (char-equal evt ?ㅓ))
;;    (delete-char -1)
;;    (set-buffer-modified-p modified)
;;    (push 'escape unread-command-events))
;;       (t (setq unread-command-events (append unread-command-events
;;                          (list evt))))))))

;; (evil-define-command cofi/maybe-exit-kj-korean ()
;;   :repeat change
;;   (interactive)
;;   (let ((modified (buffer-modified-p)))
;;     (self-insert-command 1)
;;     (let ((evt (read-event (format "Insert %c to exit insert state"
;;                                    (if (equal current-input-method
;;                                               "arabic") ; "korean-hangul"
;;                                        ?ؤ               ; ?ㅓ
;;                                      ?j))
;;                            nil 0.5)))
;;       (cond
;;        ((null evt) (message ""))
;;        ((and (integerp evt) (memq evt '(?j ?ؤ))) ; '(?j ?ㅓ)
;;         (delete-char -1)
;;         (set-buffer-modified-p modified)
;;         (push 'escape unread-command-events))
;;        (t
;;         (setq unread-command-events (append unread-command-events
;;                                             (list evt))))))))

;; (define-key evil-insert-state-map "ر" #'cofi/maybe-exit-kj-korean) ; "ㅏ"

;;(defun test-my-key ()
;;  (interactive)
;;  (self-insert-command 1)
;;  (message "This key works!")
;;  (sit-for 2))
;;
;;(define-key evil-insert-state-map "a" #'test-my-key)
;;(define-key evil-insert-state-map "ㅏ" #'test-my-key) ; Not working!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrev-mode
;;
;; Just type the following, hit <space>, and the abbreviated value
;; will be displayed.
(define-abbrev-table 'global-abbrev-table '(
                                            ("alpha0" "α")
                                            ("beta0" "β")
                                            ("gamma0" "γ")
                                            ("theta0" "θ")
                                            ("inf0" "∞")
                                            ("ceilr0" "⌉")
                                            ("ceill0" "⌈")
                                            ("ar10" "→")
                                            ("ar20" "⇒")
                                            ("al10" "←")
                                            ("al20" "⇐")
                                            ("ad10" "↓")
                                            ("ad20" "⇓")
                                            ("au10" "↑")
                                            ("au20" "⇑")
                                            ("pi0" "π")
                                            ("sigma0" "σ")
                                            ("union0" "∪")
                                            ("intersection0" "∩")
                                            ("bowtie0" "⋈")
                                            ("join0" "⋈")
                                            ("rho0" "ρ")
                                            ("almosteq0" "≈")
                                            ("land0" "∧")
                                            ("lor0" "∨")
                                            ("lnot0" "¬")
                                            ("cross0" "×")
                                            ("superset0" "⊃")
                                            ("supersetEq0" "⊇")
                                            ("subset0" "⊂")
                                            ("subsetEq0" "⊆")
                                            ("element0" "∈")
                                            ("exists0" "∃")
                                            ))

(setq-default abbrev-mode t)


(provide 'init-modes)
;;; init-modes.el ends here
