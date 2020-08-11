;c;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Wang Ding"
      user-mail-address "ggwdwhu@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Monospace" :size 16)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 14)
      doom-unicode-font (font-spec :family "Sarasa Term SC" :size 15)
      doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(require 'org)
(setq org-directory "~/Dropbox/text/org/")
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 1))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; my own config
;;(keyfreq-mode 1)
(require 'pyim)
(setq pyim-page-tooltip 'posframe)
(setq pyim-default-scheme 'microsoft-shuangpin)
(setq pyim-dicts
      '((:name "dict1" :file "~/Dropbox/emacs/pyim-bigdict.pyim")))
;(setq pyim-punctuation-translate-p 'auto)
;(setq pyim-punctuation-half-width-functions 1)

; postframe color setting
(require 'posframe)
(setq posframe-arghandler #'my-posframe-arghandler)
(defun my-posframe-arghandler (buffer-or-name arg-name value)
  (let ((info '(:internal-border-width 10 :background-color "#007BA7")))
    (or (plist-get info arg-name) value))) ; 蔚蓝色


(require 'leetcode)
(setq leetcode-prefer-language "cpp")
(setq leetcode-save-solutions t)
(setq leetcode-directory "~/Dropbox/project/leetcode")

(require 'youdao-dictionary)

(require 'org-roam)
(require 'org-roam-server)
(setq org-roam-directory "~/Dropbox/text/roam/")
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 9090
      org-roam-server-export-inline-images t
      org-roam-server-authenticate nil
      org-roam-server-label-truncate t
      org-roam-server-label-truncate-length 60
      org-roam-server-label-wrap-length 20)
(org-roam-server-mode)
(require 'org-roam-protocol)

; org-roam
(server-start)
(require 'org-protocol)
