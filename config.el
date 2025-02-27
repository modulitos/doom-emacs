;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-load-path! "elisp")
(load! "elisp/common.el")
(require 'cl-lib) ;; used by buffer-stack
(load! "elisp/buffer-stack.el")
(load! "elisp/init-evil.el")
(load! "elisp/keybindings.el")
(load! "elisp/init-org-roam.el")
(load! "elisp/init-org.el")
(load! "elisp/init-lsp.el")
(load! "elisp/init-modes.el")
(load! "elisp/init-java.el")
(load! "elisp/init-js.el")
(load! "elisp/init-go.el")
(load! "elisp/init-koma.el")
(load! "elisp/init-ruby.el")
(load! "elisp/init-rust.el")
(load! "elisp/init-python.el")
(load! "elisp/init-markdown.el")
(load! "elisp/init-projectile.el")
;; (load! "elisp/init-protobuf.el")
(load! "elisp/init-foreign-languages.el")

;; Don't truncate lines by default:
;; https://www.emacswiki.org/emacs/TruncateLines
(set-default 'truncate-lines nil)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(after! doom-modeline
  (setq doom-modeline-persp-name t))
(after! lsp-ui
  (setq lsp-ui-sideline-diagnostic-max-lines 2))
;; (global-visual-line-mode t)

;; (with-eval-after-load 'lsp-mode
(after! lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]vendor\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.devenv\\'")
  (setq lsp-inlay-hint-enable t)
  )

;; accept completion from copilot and fallback to company
;; https://github.com/copilot-emacs/copilot.el
;; https://github.com/rksm/copilot-emacsd/blob/master/init.el
;; https://robert.kra.hn/posts/2023-02-22-copilot-emacs-setup/
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word))
  :config
  ;; https://github.com/copilot-emacs/copilot.el/issues/249
  (add-to-list
   'copilot-indentation-alist
   ;; '(emacs-lisp-mode 2)
   '(go-mode 4)
   '(nix-mode 2)
   ;; '(elisp-mode 2) ;; this doesn't work?
   )
  )
