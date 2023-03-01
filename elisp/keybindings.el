;;; package --- summary
;;; Commentary:
(message "loading keybindings.el")

;;; Code:
(define-key text-mode-map (kbd "M-s t") 'testing-MapAppLog.txt)
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-M-l") 'display-line-numbers-mode)

(global-set-key (kbd "C-M-f") 'copy-buffer-file-name-as-kill)


(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

;; WINDOWS

                                        ; closing emacs:
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-q") 'save-buffers-kill-terminal) ; override read-only option
(global-set-key (kbd "C-M-s") 'save-some-buffers)

                                        ; Cycle between windows
(global-set-key (kbd "C-~") 'other-window)
(global-set-key (kbd "C-`")
                (lambda ()
                  (interactive)
                  (other-window -1)))

(global-set-key (kbd "M-j") 'other-window)
(global-set-key (kbd "M-k")
                (lambda ()
                  (interactive)
                  (other-window -1)))

(global-set-key (kbd "M-h") 'enlarge-window-horizontally)
(global-set-key (kbd "M-l") 'shrink-window-horizontally)
(global-set-key (kbd "M-i") 'downcase-word) ;; replacemente when M-l is overriden
(global-set-key (kbd "M-n") 'enlarge-window)
(global-set-key (kbd "M-m") 'shrink-window)

;; BUFFERS
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "s-p") 'helm-buffers-list)
(global-set-key (kbd "C-p") 'helm-buffers-list)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "C-p") nil))
                                        ; switch keybindings for "save buffer" and "isearch-forward"
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'isearch-forward)
(global-set-key (kbd "<f2>") 'iedit-mode)  ;; originally bound to `C-c o`
                                        ; Cycle between buffers
(global-set-key [(control f9)] 'buffer-stack-bury-and-kill)
(global-set-key [(f12)] 'buffer-stack-track)
(global-set-key [(control f12)] 'buffer-stack-untrack)

(global-set-key (kbd "C-M-n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-M-p") 'git-gutter:previous-hunk)

(global-set-key [C-tab] 'buffer-stack-down)
(global-set-key [C-S-iso-lefttab] 'buffer-stack-up);Linux
(global-set-key [C-S-tab] 'buffer-stack-up);Windows/Linux
;; (global-set-key [tab] 'shift-right)
;; (global-set-key [backtab] 'shift-left)

;; (global-set-key [(f10)] 'buffer-stack-up)
;; (global-set-key [(f11)] 'buffer-stack-down)
;; end buffer-stack keybindings

;; (global-set-key [C-tab] 'next-buffer)
;; (global-set-key [C-S-iso-lefttab] 'previous-buffer);Linux
;; (global-set-key [C-S-tab] 'previous-buffer);Windows/Linux

;; Kill buffer
(global-set-key (kbd "C-w") 'kill-buffer)
;; (global-set-key (kbd "C-x k") 'kill-current-buffer)

                                        ; Re-open recently killed buffers
(global-set-key (kbd "C-S-t") 'reopen-killed-file)
;; (define-key global-map (kbd "C-S-t") 'find-last-killed-file)

;; SHELLS
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; ;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:
(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)

(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
;; (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)


;; (global-set-key [\M-\S-up] 'move-text-up)
;; (global-set-key [\M-\S-down] 'move-text-down)
;; end move text up or down.

;; MISC KEY-BINDINGS
;; (global-set-key (kbd "C-z") 'undo)
(dolist (key '("\C-z"))
  (global-unset-key key))
;; (dolist (key '("\C-Caps_Lock" "\C-x \C-z"))
;;   (global-unset-key key))
(define-key global-map [M-left]
  (lambda ()
    (interactive)
    (set-mark-command t)))

;; move back to previous mark
(global-set-key (kbd "C--") 'pop-global-mark)

;; rect-mark.el
;; Rectangular mode editing - "C-x r" prefix, followed by normal mark/edit command.
;; reset the cursor (mark) position
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

(global-set-key (kbd "C-S-i") 'whitespace-cleanup)


(global-set-key (kbd "C-S-SPC") 'duplicate-current-line-or-region)

(global-set-key (kbd "C-c C-t") 'ansi-term)

(global-set-key (kbd "M-;") 'eval-region)

(global-set-key (kbd "C-c u") 'browse-url)

;; COMMENTING OUT
;; (add-hook 'undo-tree-mode (lambda () (local-unset-key "C-/")))
(eval-after-load "flyspell"
  '(define-key flyspell-mode-map (kbd "C-;") nil))
(global-set-key (kbd "C-;") 'comment-line-or-region)
;; (global-set-key (kbd "C-;") 'comment-line-or-region)
(global-set-key (kbd "C-:") 'comment-dwim-line)

;; (global-set-key "\M-;" 'comment-dwim-line)
(global-set-key (kbd "C-?") 'comment-dwim-line)

;; Minor mode to prevent keybindings from getting overidden
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; (define-minor-mode my-keys-minor-mode
;;   "A minor mode so that my key settings override annoying major modes."
;;   t " my-keys" 'my-keys-minor-mode-map)

(define-key my-keys-minor-mode-map (kbd "C-;") 'comment-line-or-region)
;; ;; Minor mode to prevent keybindings from getting overidden
;; (defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; (define-key my-keys-minor-mode-map (kbd "C-;") 'comment-line-or-region)
;; (my-keys-minor-mode 1)

;; CODE EDITING
;; hide-show code folding methods:
;; M-x hs-minor-mode
;; M-x hs-hide-all
;; M-x hs-show-all
;; M-x hs-toggle-hiding
;; rebind the default `C-c @ C-c` to something more usable:
;; (global-set-key (kbd "C-c t") 'hs-toggle-hiding)
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)
;; Can use it in combination the following to jump around:
;; M-x imenu <my_func_name>

(global-set-key (kbd "C-x r")
                (lambda ()
                  (interactive)
                  (query-replace-regexp (isearch-forward-symbol-at-point))
                  ))

;; INPUT METHODS
(global-set-key (kbd "C-M-/") 'toggle-input-method)

(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-c i") 'emojify-insert-emoji)


(defun copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path. If `universal-argument' is called first,
copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of
`default-directory' (which is usually the “current” dir when that
buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

(provide 'keybindings)
