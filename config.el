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
;(setq doom-font (font-spec :family "Monaco" :size 16)
;      doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 14)
;      doom-unicode-font (font-spec :family "Sarasa Term SC" :size 15)
;      doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-one)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/text/org/")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


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


;; the below is my own config
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

; leetcode
(require 'leetcode)
(setq leetcode-prefer-language "cpp")
(setq leetcode-save-solutions t)
(setq leetcode-directory "~/Dropbox/project/leetcode")

(require 'youdao-dictionary)

; org-roam
(require 'org-roam)
(require 'org-roam-server)
(require 'org-roam-protocol)
(setq org-roam-directory "~/Dropbox/text/roam/")
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 9090
      org-roam-server-export-inline-images t
      org-roam-server-authenticate nil)
(org-roam-server-mode)
; emacs server
(server-start)
(require 'org-protocol)

; deft
(require 'deft)
(setq deft-directory "~/Dropbox/text/deft")
(setq deft-extensions '("org"))
(setq deft-default-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-auto-save-interval 0)
;;key to launch deft
(global-set-key (kbd "C-c d") 'deft)

; auctex setting
;; (setq latex-run-command "xelatex")
(require 'tex)
(setq TeX-global-PDF-mode t TeX-engine 'xetex)
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")
; https://emacs-china.org/t/emacs-latex/12658/4

; auto-save
; https://www.gnu.org/software/emacs/manual/html_node/elisp/Auto_002dSaving.html
;; (setq auto-save-interval 300)
(defun full-auto-save ()
  (interactive)
  (save-excursion
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (if (and (buffer-file-name) (buffer-modified-p))
          (basic-save-buffer)))))
(add-hook 'auto-save-hook 'full-auto-save)
; https://www.emacswiki.org/emacs/AutoSave
; maybe it's time for me to get myself config with emacs
; if I have time, I will TODO
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

; org
(require 'org)
(require 'find-lisp)
(setq org-agenda-files (find-lisp-find-files "~/Dropbox/text/" org-agenda-file-regexp))
(require 'org-refile)
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 1))))
(setq org-log-done 'time)
; https://emacs-orgmode.gnu.narkive.com/n5bQRs5t/o-multiple-recursive-directories-with-org-agenda-files

; logo
(setq fancy-splash-image "~/.doom.d/logo/Emacs-logo.svg")

; org-mode done but no time
;

; gc
(setq garbage-collection-messages t)
(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
;(run-with-idle-timer 2 t (lambda () (garbage-collect)))
; https://t.codebug.vip/questions-120317.htm

; fullscreen when start
(add-to-list 'default-frame-alist '(fullscreen . maximized))
; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
