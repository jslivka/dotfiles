;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(require 'sly-asdf)
(require 'sly-autoloads)

(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(setq inferior-lisp-program "sbcl")

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(90 50))
(add-to-list 'default-frame-alist '(alpha 90 50))
