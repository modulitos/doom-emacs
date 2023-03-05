;;; -*- lexical-binding: t; -*-

;; LANGUAGES (INPUT METHOD)
;; toggle input method: C-M-/
(defun set-input-to-korean ()
  (interactive)
  (set-input-method "korean-hangul"))

(defun set-input-to-espanol ()
  (interactive)
  (set-input-method "spanish-postfix"))

(defun set-input-to-vietnamese ()
  (interactive)
  (set-input-method "vietnamese-vni"))

(global-set-key (kbd "C-M-k") 'set-input-to-korean)
(global-set-key (kbd "C-M-e") 'set-input-to-espanol)
(global-set-key (kbd "C-M-v") 'set-input-to-vietnamese)


(provide 'init-foreign-languages)
;;; init-foreign-languages.el ends here
