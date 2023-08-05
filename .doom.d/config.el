;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Slivka"
      user-mail-address "johns@fairwinds.com")

(setq package-archives
      '(("melpa" . "https://melpa.org/packages")
        ("org"   . "https://orgmode.org/elpa")
        ("gnu"   . "https://elpa.gnu.org/packages")))

;; (setq package-check-signature nil)
;; probably not necessary
(package-initialize)

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
(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;;(prefer-coding-system 'utf-8-unix) ; encoding for input and writing files
;;(global-font-lock-mode 't) ; enable syntax highlighting by default
(column-number-mode 't) ; show current column in status bar

(global-whitespace-mode) ; enable whitespace handling by default
(setq
  whitespace-style ; see (apropos 'whitespace-style)
  '(face ; viz via faces
    trailing ; trailing blanks visualized
    lines-tail ; lines beyond whitespace-line-column visualized
    space-before-tab
    space-after-tab
    newline ; lines with only blanks visualized
    indentation ; spaces used for indent when config wants tabs
    empty ; empty lines at beginning or end or buffer
    )
  whitespace-line-column 100) ; column at which whitespace-mode says the line is too long

;; Spell check - install "aspell" and aspell dictionaries.
(setq
  ispell-program-name "aspell"
  ispell-extra-args '("--sug-mode=ultra"))

;; Helm: incremental completion and selection narrowing inside menus/lists
(require 'helm)
(require 'helm-easymenu)
(require 'helm-projectile)
(require 'helm-xref)
(helm-projectile-on)

(require 'helm-descbinds)
(helm-descbinds-mode)

(setq helm-split-window-inside-p            t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(after! org
  (setq org-roam-directory "~/org/roam/")
  (setq org-roam-index-file "~/org/roam/index.org"))

;; company-mode auto-completion, to turn off use :company-complete
(require 'company)
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 3)

;; treemacs
(after! treemacs
  (treemacs-follow-mode 1))

(require 'project)
(require 'compile)
(require 'yasnippet)
(yas-global-mode 1)
(require 'eglot)

;; golang

(require 'go-projectile)
(go-projectile-tools-add-path)
(setq go-projectile-tools
  '((gocode    . "github.com/mdempsky/gocode")
    (golint    . "golang.org/x/lint/golint")
    (godef     . "github.com/rogpeppe/godef")
    (errcheck  . "github.com/kisielk/errcheck")
    (godoc     . "golang.org/x/tools/cmd/godoc")
    (gogetdoc  . "github.com/zmb3/gogetdoc")
    (goimports . "golang.org/x/tools/cmd/goimports")
    (gorename  . "golang.org/x/tools/cmd/gorename")
    (gomvpkg   . "golang.org/x/tools/cmd/gomvpkg")
    (guru      . "golang.org/x/tools/cmd/guru")))

;;(require 'company-go) ; obsolete with company-lsp
(require 'go-mode)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook (lambda ()
  (company-mode) ; enable company upon activating go
  ;;(set (make-local-variable 'company-backends) '(company-go))

  ;; Code layout.
  (setq tab-width 2 indent-tabs-mode 1) ; std go whitespace configuration
  (add-hook 'before-save-hook 'gofmt-before-save) ; run gofmt on each save

  ;; Shortcuts for common go-test invocations.
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    )

  ;; Fix parsing of error and warning lines in compiler output.
  (setq compilation-error-regexp-alist-alist ; first remove the standard conf; it's not good.
        (remove 'go-panic
                (remove 'go-test compilation-error-regexp-alist-alist)))
  ;; Make another one that works better and strips more space at the beginning.
  (add-to-list 'compilation-error-regexp-alist-alist
               '(go-test . ("^[[:space:]]*\\([_a-zA-Z./][_a-zA-Z0-9./]*\\):\\([0-9]+\\):.*$" 1 2)))
  (add-to-list 'compilation-error-regexp-alist-alist
               '(go-panic . ("^[[:space:]]*\\([_a-zA-Z./][_a-zA-Z0-9./]*\\):\\([0-9]+\\)[[:space:]].*$" 1 2)))
  ;; override.
  (add-to-list 'compilation-error-regexp-alist 'go-test t)
  (add-to-list 'compilation-error-regexp-alist 'go-panic t)
  ))

;; transparency
(defconst doom-frame-transparency 95)
(set-frame-parameter (selected-frame) 'alpha doom-frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,doom-frame-transparency))
(defun dwc-smart-transparent-frame ()
  (set-frame-parameter
   (selected-frame)
   'alpha (if (frame-parameter (selected-frame) 'fullscreen)
              100
            doom-frame-transparency)))
