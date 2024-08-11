;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "John Slivka"
      user-mail-address "john@jslivka.net")

(setq projectile-indexing-method 'alien)
(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Alegreya" :size 16))

;; transparency
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))

; sly
(after! sly
    (set-popup-rules!
        '(("^\\*sly-mrepl"
            :side right
            :width 100
            :quit nil
            :ttl nil))))
