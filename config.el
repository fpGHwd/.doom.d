;; $DOOMDIR/config.el 

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "suzumiya natsuhi"
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
;;
(setq doom-font (font-spec :family "Monaco" :size 16)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 15)
      doom-unicode-font (font-spec :family "Sarasa Term SC" :size 16)
      doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))
;; (setq doom-font (font-spec :family "mononoki" :size 18 :weight 'light)
;;       doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 16)
;;       doom-unicode-font (font-spec :family "Sarasa Term SC" :size 17)
;;       doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 24))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-moonlight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/text/org")


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

;; logo
(setq fancy-splash-image "~/.doom.d/logo/Emacs-logo.svg")

;; leetcode
(use-package leetcode
  :custom
  (leetcode-prefer-language "cpp")
  (leetcode-save-solutions t)
  (leetcode-directory "~/Dropbox/project/leetcode"))

;; autosave
(defun full-auto-save ()
  (interactive)
  (save-excursion
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (if (and (buffer-file-name) (buffer-modified-p))
          (basic-save-buffer)))))
(add-hook 'auto-save-hook 'full-auto-save)

(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; counsel
(use-package counsel
  :custom
  (counsel-search-engine 'google))

;; org
(use-package org
  :custom
  (org-log-done 'time)
  :init
  (progn (require 'find-lisp)
         (require 'org-refile)
         (setq org-agenda-files (find-lisp-find-files "~/Dropbox/text" org-agenda-file-regexp))
         (setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
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
             (goto-char (point-min))    ;移动到 buffer 的开始位置
             ;; 先定位表示年份的 headline，再定位表示月份的 headline
             (dolist (heading path)
               (let ((re (format org-complex-heading-regexp-format
                                 (regexp-quote heading)))
                     (cnt 0))
                 (if (re-search-forward re end t)
                     (goto-char (point-at-bol)) ;如果找到了 headline 就移动到对应的位置
                   (progn                       ;否则就新建一个 headline
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
                                 "%(generate-anki-note-body)\n")))))

;; org-download
(use-package org-download
  :hook
  ((dired-mode-hook . org-download-enable)))

;; org-roam
;; Now I think org-mode is enough, tsuzuku...

;; rime
;; https://manateelazycat.github.io/emacs/2020/03/22/emacs-rime.html
(use-package rime
  :init
  (progn
    (require 'posframe)
    (require 'rime)
    ;; https://github.com/DogLooksGood/emacs-rime 候选框最后一项不显示
    (defun +rime--posframe-display-content-a (args)
      "给 `rime--posframe-display-content' 传入的字符串加一个全角空
格，以解决 `posframe' 偶尔吃字的问题。"
      (cl-destructuring-bind (content) args
        (let ((newresult (if (string-blank-p content)
                             content
                           (concat content "　"))))
          (list newresult))))

    (if (fboundp 'rime--posframe-display-content)
        (advice-add 'rime--posframe-display-content
                    :filter-args
                    #'+rime--posframe-display-content-a)
      (error "Function `rime--posframe-display-content' is not available.")))
  :custom
  (default-input-method "rime")
  (rime-user-data-dir "~/.doom.d/rime")
  (rime-posframe-properties (list :background-color "#333333"
                                  :foreground-color "#dcdccc"
                                  :font "Sarasa UI SC"))
  (rime-show-candidate 'posframe))

;; TODO
;; https://emacs.nasy.moe/

;; nikola
;; (use-package nikola
;;   :custom
;;   (nikola-output-root-directory "~/.config/nikola/"))
;; (require 'ox-nikola)
(add-to-list 'load-path "/home/wd/Dropbox/emacs/extensions/org2nikola")
(use-package org2nikola
  :custom
  (org2nikola-output-root-directory "~/.config/nikola")
  (org2nikola-use-verbose-metadata t)
  :init
  (progn
    (defun org2nikola-after-hook-setup (title slug)
      "see https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/ for setup
 run `ln -s ~/projs/redguardtoo.github.io ~/.config/nikola/output`, btw"
      (let ((url (concat "https://fpghwd.github.io/posts/" slug "/index.html"))
            cmd)
        ;; copy the blog url into kill-ring
        (kill-new url)
        (message "%s => kill-ring" url)
        ;; nikola is building posts ...
        (setq nikola-dir (file-truename "~/.config/nikola/"))
        (shell-command (format "cd %s && nikola build" nikola-dir))
        (setq nikola-output-path (file-truename "~/.config/nikola/output/"))
        (setq cmd (format "cd %s && git add . && git commit -m 'updated' && git push origin master" nikola-output-path))
        ;; (message cmd)
        (shell-command cmd)
        ))

    (add-hook 'org2nikola-after-hook 'org2nikola-after-hook-setup)))
