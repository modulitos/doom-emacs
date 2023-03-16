;;; elisp/init-ruby.el -*- lexical-binding: t; -*-
;;;


(use-package ruby-mode
  :config
  (defun my-ruby-mode-hook ()
    (local-set-key (kbd "C-S-i") 'rubocop-autocorrect-current-file)
    (local-unset-key (kbd "C-M-n"))
    )

  :hook ((ruby-mode . my-ruby-mode-hook)))

(provide 'init-ruby)
;;; init-ruby.el ends here
