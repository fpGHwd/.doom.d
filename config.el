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
(setq doom-font (font-spec :family "Monaco" :size 16)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 16)
      doom-unicode-font (font-spec :family "Sarasa Term SC" :size 16)
      doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-moonlight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/text/")


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
;; (setq pyim-page-tooltip 'posframe)
(setq pyim-default-scheme 'microsoft-shuangpin)
(setq pyim-dicts
      '((:name "dict1" :file "~/Dropbox/emacs/pyim-bigdict.pyim")))
;(setq pyim-punctuation-translate-p 'auto)
;(setq pyim-punctuation-half-width-functions 1)


; postframe color setting
;; (require 'posframe)
;; (setq posframe-arghandler #'my-posframe-arghandler)
;; (defun my-posframe-arghandler (buffer-or-name arg-name value)
  ;; (let ((info '(:internal-border-width 10 :background-color "#007BA7")))
    ;; (or (plist-get info arg-name) value))) ; 蔚蓝色

; leetcode
(require 'leetcode)
(setq leetcode-prefer-language "cpp")
(setq leetcode-save-solutions t)
(setq leetcode-directory "~/Dropbox/project/leetcode")

;; (require 'youdao-dictionary)

; org-roam
;; (require 'org-roam)
;; (require 'org-roam-server)
;; (require 'org-roam-protocol)
;; (setq org-roam-directory "~/Dropbox/text/roam/")
;; (add-hook 'after-init-hook 'org-roam-mode)
;; (setq org-roam-server-host "127.0.0.1"
;;       org-roam-server-port 9090
;;       org-roam-server-export-inline-images t
;;       org-roam-server-authenticate nil)
;; (org-roam-server-mode)
; emacs server
;; (server-start)
;; jk(require 'org-protocol)

; deft
;; (require 'deft)
;; (setq deft-directory "~/Dropbox/text/deft")
;; (setq deft-extensions '("org"))
;; (setq deft-default-extension "org")
;; (setq deft-text-mode 'org-mode)
;; (setq deft-use-filename-as-title t)
;; (setq deft-use-filter-string-for-filename t)
;; (setq deft-auto-save-interval 0)
;; ;;key to launch deft
;; (global-set-key (kbd "C-c d") 'deft)

; auctex setting
;; (setq latex-run-command "xelatex")
;; (require 'tex)
;; (setq TeX-global-PDF-mode t TeX-engine 'xetex)
;; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;; ;; (setq TeX-command-default "XeLaTeX")
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
;; (setq org-directory-my-own "~/Dropbox/text/")
;; (setq org-directory-my-own-exclude "~/Dropbox/text/org/bak/")
(setq org-agenda-files (find-lisp-find-files org-directory org-agenda-file-regexp))
(require 'org-refile)
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 1))))
(setq org-log-done 'time)
; https://emacs-orgmode.gnu.narkive.com/n5bQRs5t/o-multiple-recursive-directories-with-org-agenda-files

; logo
(setq fancy-splash-image "~/.doom.d/logo/Emacs-logo.svg")

; org-mode done but no time
;

; gc
;(setq garbage-collection-messages t)
;; (setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
;(run-with-idle-timer 2 t (lambda () (garbage-collect)))
; https://t.codebug.vip/questions-120317.htm

; fullscreen when start
;(add-to-list 'default-frame-alist '(fullscreen . maximized))
; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up

; menu
;; (menu-bar-mode 1)
; toolbar
;; (tool-bar-mode 1)

; time
;; (display-time-mode 1)
;; (setq display-time-day-and-date t)

;emms
;(require 'emms)
;(require 'emms-setup)
;; (emms-all)
;; (emms-default-players)

;; (setq emms-source-file-default-directory "~/Music/")
; https://www.gnu.org/software/emms/manual/#Quickstart-Guide
;
;(require 'emms-setup)
;

; counsel-google switch to google, It's fine for me here
(require 'counsel)
(setq counsel-search-engine 'google)

; --- ZMonster's org-capture template
;
; org
; https://www.zmonster.me/2018/02/28/org-mode-capture.html
(require 'org)
(add-to-list 'org-capture-templates '("z" "ZMonster"))
(add-to-list 'org-capture-templates '("zt" "Tasks"))
(add-to-list 'org-capture-templates
             '("ztr" "Book Reading Task" entry
               (file+olp "~/Dropbox/text/org/task.org" "Reading" "Book")
               "* TODO %^{书名}\n%u\n%a\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
             '("ztw" "Work Task" entry
               (file+headline "~/Dropbox/text/org/task.org" "Work")
               "* TODO %^{任务名}\n%u\n%a\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
             '("zj" "Journal" entry (file "~/Dropbox/text/org/journal.org")
               "* %U - %^{heading}\n  %?"))
(add-to-list 'org-capture-templates
             '("zi" "Inbox" entry (file "~/Dropbox/text/org/inbox.org")
               "* %U - %^{heading} %^g\n %?\n"))
(add-to-list 'org-capture-templates
             '("zn" "Notes" entry (file "~/Dropbox/text/org/notes/inbox.org")
               "* %^{heading} %t %^g\n  %?\n"))

(add-to-list 'org-capture-templates '("w" "Wangding"))
(add-to-list 'org-capture-templates
             '("wm" "Milestone" entry (file "~/Dropbox/text/org/milestone.org")
               "* %^{heading} %t %^g\n%?\n"))

(defun get-year-and-month ()
  (list (format-time-string "%Y年") (format-time-string "%m月")))


(defun find-month-tree ()
  (let* ((path (get-year-and-month))
         (level 1)
         end)
    (unless (derived-mode-p 'org-mode)
      (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
    (goto-char (point-min))             ;移动到 buffer 的开始位置
    ;; 先定位表示年份的 headline，再定位表示月份的 headline
    (dolist (heading path)
      (let ((re (format org-complex-heading-regexp-format
                        (regexp-quote heading)))
            (cnt 0))
        (if (re-search-forward re end t)
            (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
          (progn                        ;否则就新建一个 headline
            (or (bolp) (insert "\n"))
            (if (/= (point) (point-min)) (org-end-of-subtree t t))
            (insert (make-string level ?*) " " heading "\n"))))
      (setq level (1+ level))
      (setq end (save-excursion (org-end-of-subtree t t))))
    (org-end-of-subtree)))
(add-to-list 'org-capture-templates
             '("zb" "Billing" plain
               (file+function "~/Dropbox/text/org/billing.org" find-month-tree)
               " | %U | %^{类别} | %^{描述} | %^{金额} |" :kill-buffer t))

(add-to-list 'org-capture-templates
             '("zc" "Contacts" table-line (file "~/Dropbox/text/org/contacts.org")
               "| %U | %^{姓名} | %^{手机号}| %^{邮箱} |"))

(add-to-list 'org-capture-templates '("zp" "Protocol"))
(add-to-list 'org-capture-templates
             '("zpb" "Protocol Bookmarks" entry
               (file+headline "~/Dropbox/text/org/web.org" "Bookmarks")
               "* %U - %:annotation" :immediate-finish t :kill-buffer t))
(add-to-list 'org-capture-templates
             '("zpn" "Protocol Bookmarks" entry
               (file+headline "~/Dropbox/text/org/web.org" "Notes")
               "* %U - %:annotation %^g\n\n  %?" :empty-lines 1 :kill-buffer t))(defun org-capture-template-goto-link ()
  (org-capture-put :target (list 'file+headline
                                 (nth 1 (org-capture-get :target))
                                 (org-capture-get :annotation)))
  (org-capture-put-target-region-and-position)
  (widen)
  (let ((hd (nth 2 (org-capture-get :target))))
    (goto-char (point-min))
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd)) nil t)
        (org-end-of-subtree)
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n"))))
(add-to-list 'org-capture-templates
             '("zpa" "Protocol Annotation" plain
               (file+function "~/Dropbox/text/org/web.org" org-capture-template-goto-link)
               "  %U - %?\n\n  %:initial" :empty-lines 1))
(defun generate-anki-note-body ()
  (interactive)
  (message "Fetching note types...")
  (let ((note-types (sort (anki-editor-note-types) #'string-lessp))
        (decks (sort (anki-editor-deck-names) #'string-lessp))
        deck note-type fields)
    (setq deck (completing-read "Choose a deck: " decks))
    (setq note-type (completing-read "Choose a note type: " note-types))
    (message "Fetching note fields...")
    (setq fields (anki-editor--anki-connect-invoke-result "modelFieldNames" `((modelName . ,note-type))))
    (concat "  :PROPERTIES:\n"
            "  :ANKI_DECK: " deck "\n"
            "  :ANKI_NOTE_TYPE: " note-type "\n"
            "  :END:\n\n"
            (mapconcat (lambda (str) (concat "** " str))
                       fields
                       "\n\n"))))
(add-to-list 'org-capture-templates
             `("zv" "Vocabulary" entry
               (file+headline "~/Dropbox/text/org/anki.org" "Vocabulary")
               ,(concat "* %^{heading} :note:\n"
                        "%(generate-anki-note-body)\n")))

; ----- end of ZMonster's org settings

; smex
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
