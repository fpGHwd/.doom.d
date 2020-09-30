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
;; (setq doom-font (font-spec :family "Recursive Mono Casual Static" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 15)
;;       doom-unicode-font (font-spec :family "Sarasa Term SC" :size 16)
;;       doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))
(setq doom-font (font-spec :family "Consolas" :size 16)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 15)
      doom-unicode-font (font-spec :family "Sarasa Term SC" :size 16)
      doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))
;; (setq doom-font (font-spec :family "Monaco" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 15)
;;       doom-unicode-font (font-spec :family "Sarasa Term SC" :size 16)
;;       doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 18))
;; (setq doom-font (font-spec :family "mononoki" :size 18 :weight 'light)
;;       doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC Light" :size 16)
;;       doom-unicode-font (font-spec :family "Sarasa Term SC" :size 17)
;;       doom-big-font (font-spec :family "Sarasa Term SC Semiblold" :size 24))

;; italic when comment and keyword
;; https://www.reddit.com/r/emacs/comments/f531pt/doom_wherehow_to_change_syntax_highlighting/
(custom-set-faces! '(font-lock-comment-face :slant italic) '(font-lock-keyword-face :slant italic))

;; line spacing
;; https://www.reddit.com/r/emacs/comments/3hag14/line_spacing/
;; (setq line-spacing 0.2)
;; http://ergoemacs.org/emacs/emacs_toggle_line_spacing.html
;; (defun xah-toggle-line-spacing ()
;;   "Toggle line spacing between no extra space to extra half line height.
;; URL `http://ergoemacs.org/emacs/emacs_toggle_line_spacing.html'
;; Version 2017-06-02"
;;   (interactive)
;;   (if line-spacing
;;       (setq line-spacing nil)
;;     (setq line-spacing 0.2))
;;   (redraw-frame (selected-frame)))
;; https://stackoverflow.com/questions/7899949/is-there-an-emacs-hook-that-runs-after-every-buffer-is-created
;; TODO change line-spacing when in programming buffer only
;; (add-hook 'after-change-major-mode-hook 'xah-toggle-line-spacing)
;; https://emacs.nasy.moe/
;; TODO telega needn't line-spacing

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-gruvbox-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/to-encfs/text/org")


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
;; https://github.com/jwiegley/use-package

;; logo
(setq fancy-splash-image "~/.doom.d/logo/Emacs-logo.svg")

;; garbage
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'focus-out-hook #'garbage-collect)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold (* 50 1024 1024))))

;; autosave
;; (defun full-auto-save ()
;;   (interactive)
;;   (save-excursion
;;     (dolist (buf (buffer-list))
;;       (set-buffer buf)
;;       (if (and (buffer-file-name) (buffer-modified-p))
;;           (basic-save-buffer)))))
;; (add-hook 'auto-save-hook 'full-auto-save)
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook #'save-all)





;; leetcode 
(use-package leetcode
  :custom
  (leetcode-prefer-language "cpp")
  (leetcode-save-solutions t)
  (leetcode-directory "~/Documents/to-encfs/text/leetcode"))

;; counsel
(use-package counsel
  ;; :bind
  ;; ("C-x w g" . counsel-google)
  :custom
  (counsel-search-engine 'google))

;; org
(use-package org
  :custom
  (org-log-done 'time)
  :init
  (progn (require 'find-lisp)
         (require 'org-refile)
         (setq org-agenda-files (find-lisp-find-files "~/Documents/to-encfs/text" org-agenda-file-regexp))
         (setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
         (add-to-list 'org-capture-templates '("z" "ZMonster"))
         (add-to-list 'org-capture-templates '("zt" "Tasks"))
         (add-to-list 'org-capture-templates
                      '("ztr" "Book Reading Task" entry
                        (file+olp "~/Documents/to-encfs/text/org/task.org" "Reading" "Book")
                        "* TODO %^{书名}\n%u\n%a\n" :clock-in t :clock-resume t))
         (add-to-list 'org-capture-templates
                      '("ztw" "Work Task" entry
                        (file+headline "~/Documents/to-encfs/text/org/task.org" "Work")
                        "* TODO %^{任务名}\n%u\n%a\n" :clock-in t :clock-resume t))
         (add-to-list 'org-capture-templates
                      '("zj" "Journal" entry (file "~/Documents/to-encfs/text/org/journal.org")
                        "* %U - %^{heading}\n  %?"))
         (add-to-list 'org-capture-templates
                      '("zi" "Inbox" entry (file "~/Documents/to-encfs/text/org/inbox.org")
                        "* %U - %^{heading} %^g\n %?\n"))
         (add-to-list 'org-capture-templates
                      '("zn" "Notes" entry (file "~/Documents/to-encfs/text/org/notes.org")
                        "* %^{heading} %t %^g\n  %?\n"))

         (add-to-list 'org-capture-templates '("w" "Wangding"))
         (add-to-list 'org-capture-templates
                      '("wm" "Milestone" entry (file "~/Documents/to-encfs/text/org/milestone.org")
                        "* %^{heading} %t %^g\n%?\n" :prepend t))

         ;; https://github.com/bastibe/org-journal
         (defun org-journal-find-location ()
           ;; Open today's journal, but specify a non-nil prefix argument in order to
           ;; inhibit inserting the heading; org-capture will insert the heading.
           (org-journal-new-entry t)
           ;; Position point on the journal's top-level heading so that org-capture
           ;; will add the new entry as a child entry.
           )
         (add-to-list 'org-capture-templates
                      '("wj" "Journal entry" plain (function org-journal-find-location)
                        "** %(format-time-string org-journal-time-format)%?"))


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
                        (file+function "~/Documents/to-encfs/text/org/billing.org" find-month-tree)
                        " | %U | %^{类别} | %^{描述} | %^{金额} |" :kill-buffer t))

         (add-to-list 'org-capture-templates
                      '("zc" "Contacts" table-line (file "~/Documents/to-encfs/text/org/contacts.org")
                        "| %U | %^{姓名} | %^{手机号}| %^{邮箱} |"))

         (add-to-list 'org-capture-templates '("zp" "Protocol"))
         (add-to-list 'org-capture-templates
                      '("zpb" "Protocol Bookmarks" entry
                        (file+headline "~/Documents/to-encfs/text/org/web.org" "Bookmarks")
                        "* %U - %:annotation" :immediate-finish t :kill-buffer t))
         (add-to-list 'org-capture-templates
                      '("zpn" "Protocol Bookmarks" entry
                        (file+headline "~/Documents/to-encfs/text/org/web.org" "Notes")
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
                        (file+function "~/Documents/to-encfs/text/org/web.org" org-capture-template-goto-link)
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
                        (file+headline "~/Documents/to-encfs/text/anki/anki-cards.org" "Vocabulary")
                        ,(concat "* %^{heading} :note:\n"
                                 "%(generate-anki-note-body)\n")))))

;; org picture
(setq org-image-actual-height (/ (display-pixel-width) 3)) ;; 让图片显示的大小固定为屏幕宽度的三分之一

;; org-roam
(setq org-roam-directory "~/Documents/to-encfs/text/roam")

;; org-roam-server
;; https://github.com/org-roam/org-roam-server
;; https://www.orgroam.com/manual/Installation-_00281_0029.html#Installation-_00281_0029
;; (use-package org-roam-server
;;   :init
;;   (require 'org-roam-protocol)
;;   :hook
;;   ((after-init . server-start) ;; emacs-server starts
;;    (after-init . org-roam-server-mode))
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 9090
;;         org-roam-server-authenticate nil
;;         org-roam-server-export-inline-images t
;;         org-roam-server-serve-files nil
;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))


;; rime
;; https://manateelazycat.github.io/emacs/2020/03/22/emacs-rime.html
;; https://github.com/DogLooksGood/emacs-rime
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
      (error "Function `rime--posframe-display-content' is not available."))
    )
  :custom
  (default-input-method "rime")
  (rime-user-data-dir "~/.doom.d/rime")
  (rime-posframe-properties (list :background-color "#333333"
                                  :foreground-color "#dcdccc"
                                  :font "Sarasa UI SC"))
  (rime-show-candidate 'posframe)
  (rime-disable-predicates '(rime-predicate-auto-english-p
                             ;; rime-predicate-space-after-cc-p
                             rime-predicate-current-uppercase-letter-p)) 
  ;;; support shift-l, shift-r, control-l, control-r
  (rime-inline-ascii-trigger 'shift-l))
;; temporary english predict
;; https://github.com/DogLooksGood/emacs-rime


;; nikola
;; https://github.com/redguardtoo/org2nikola
(use-package org2nikola
  :custom
  (org2nikola-output-root-directory "~/.config/nikola")
  (org2nikola-use-verbose-metadata t)
  ;; (org2nikola-process-output-html-function
  ;;  (lambda (html-text title post-slug)
  ;;    (progn
  ;;      (let* ((re-str "\\/home\\/.+?\\.\\(png\\|jpg\\|jpeg\\|bmp\\)"))
  ;;        (let* ((files-list (s-match-strings-all re-str html-text)))
  ;;          (dolist (file-path files-list)
  ;;            (shell-command
  ;;             cmd (format "cp %s /home/wd/.config/nikola/images/"
  ;;                         (car file-path))))))
  ;;      (replace-regexp-in-string
  ;;       "\\(file:.+?\\/\\)[0-9a-zA-Z_-]+?\\(.png\\|.jpeg\\|.bmp\\|.gif\\|.jpg\\)"
  ;;       "https://raw.githubusercontent.com/fpGHwd/fpghwd.github.io/master/images/"
  ;;       html-text nil nil 1))))
  (org2nikola-process-output-html-function
 (lambda (html-text title post-slug)
   (progn (let* ((re-str "\\/home\\/.+?\\.png"))
            (let* ((files-list (s-match-strings-all re-str html-text)))
              (dolist (file-path files-list)
                ;; (message (format "file-path: %s" (car file-path)))
                (setq cmd (format "cp %s /home/wd/.config/nikola/images/" (car file-path))) ;; TODO rewrite with mapconcat
                (message cmd)
                (shell-command cmd))))
          (replace-regexp-in-string
           "file:.+?\\/[a-z0-9-]\\{34\\}\\/"
           "https://raw.githubusercontent.com/fpGHwd/fpghwd.github.io/master/images/"
           html-text))))
  :init
  (progn
    (defun org2nikola-after-hook-setup (title slug)
      "see https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/ for setup
 run `ln -s ~/projs/redguardtoo.github.io ~/.config/nikola/output`, btw"
      (let ((url (concat "https://fpghwd.github.io/posts/" slug "/index.html"))
            (cmd nil)
            (nikola-dir (file-truename "~/.config/nikola/"))
            (nikola-output-path (file-truename "~/.config/nikola/output")))
        ;; nikola is building posts ...
        ;; copy the blog url into kill-ring
        (kill-new url)
        (message "%s => kill-ring" url)
        (shell-command (format "cd %s && nikola build" nikola-dir))
        (setq cmd (format "cd %s && git add . && git commit -m 'updated' && git push origin master" nikola-output-path))
        ;; (message cmd)
        (shell-command cmd)))

    (add-hook 'org2nikola-after-hook 'org2nikola-after-hook-setup)))


;; telega
;; https://github.com/zevlg/telega.el
(use-package telega
  :commands (telega)
  :defer t
  :custom
  (telega-notifications-mode 1)
  (telega-proxies (list
                   '(:server "127.0.0.1" :port 1080 :enable t
                     :type (:@type "proxyTypeSocks5")))))


;; podcaster
;; https://github.com/lujun9972/podcaster
(use-package! podcaster
  :custom
  (podcaster-feeds-urls '("http://voice.beartalking.com/rss"
                          "https://feed.podbean.com/speakmylanguage/feed.xml"
                          "http://feed.thisamericanlife.org/talpodcast"
                          "https://fs.blog/knowledge-project/feed/"
                          "https://jamesaltucher.com/podcasts/feed/")))
;; https://www.douban.com/note/763676277/


;; latex
; https://emacs-china.org/t/emacs-latex/12658/4
(setq latex-run-command "xelatex")
(setq TeX-global-PDF-mode t TeX-engine 'xetex)
(setq TeX-command-default "XeLaTeX")


;; map!
;; map is just like a evil-define-key's warpper
;; https://emacs-china.org/t/topic/5089
(map!
 :leader
 (:prefix-map ("," . "reverved keys")
  :desc "youdao-input-search" "y" #'youdao-dictionary-search-at-point-posframe
  :desc "spotify" "s" #'helm-spotify-plus
  :desc "podcaster" "p" #'podcaster
  :desc "leetcode" "l" #'leetcode
  :desc "counsel-search" "g" #'counsel-search
  :desc "clipboard-yank" "v" #'clipboard-yank
  :desc "clipboard-kill-ring-save" "c" #'clipboard-kill-ring-save
  :desc "org-download-screenshot" "d" #'org-download-screenshot
  :desc "org-journal-new-insert" "j" #'org-journal-new-entry
  :desc "deft" "f" #'deft
  ;; :desc "eshell" "e" #'eshell ;; SPC o E or SPC o T
  :desc "org-roam-find-file" "r" #'org-roam-find-file))
;; TODO org-roam-find-file r f f

;; TODO rime-force-enable keybinding
;; https://github.com/DogLooksGood/emacs-rime

;; org-journal
(setq org-journal-dir "~/Documents/to-encfs/text/journal/"
      org-journal-date-format "%A, %d %B %Y"
      org-journal-file-type 'monthly)


;; deft
(setq deft-directory "~/Documents/to-encfs/text/deft")

;; wayland not support maim
;; https://github.com/naelstrof/maim/issues/67
;; org-download-screenshot
;; (use-package! org-download
;;  :config
;;  (org-download-screenshot-method "gnome-screenshot -a -f %s"))
(setq org-download-screenshot-method "gnome-screenshot -a -f %s")
;; (setq org-download-screenshot-method "maim -s --delay=0.3 --quality=1 %s")

;; tabnine
;; https://github.com/TommyX12/company-tabnine
;; (use-package! company-tabnine
;;   :init
;;   (add-to-list 'company-backends 'company-tabnine))
;; (add-to-list 'company-backends 'company-tabnine)
;; TODO https://emacs-china.org/t/tabnine/9988/39
;; (defun company//sort-by-tabnine (candidates)
;;   (if (or (functionp company-backend)
;;           (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
;;       candidates
;;     (let ((candidates-table (make-hash-table :test #'equal))
;;           candidates-1
;;           candidates-2)
;;       (dolist (candidate candidates)
;;         (if (eq (get-text-property 0 'company-backend candidate)
;;                 'company-tabnine)
;;             (unless (gethash candidate candidates-table)
;;               (push candidate candidates-2))
;;           (push candidate candidates-1)
;;           (puthash candidate t candidates-table)))
;;       (setq candidates-1 (nreverse candidates-1))
;;       (setq candidates-2 (nreverse candidates-2))
;;       (nconc (seq-take candidates-1 2)
;;              (seq-take candidates-2 2)
;;              (seq-drop candidates-1 2)
;;              (seq-drop candidates-2 2)))))

;; (add-to-list 'company-transformers 'company//sort-by-tabnine t)
;; `:separate`  使得不同 backend 分开排序
;; (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate))

;; The free version of TabNine is good enough,
;; and below code is recommended that TabNine not always
;; prompt me to purchase a paid version in a large project.
;; (defadvice company-echo-show (around disable-tabnine-upgrade-message activate)
;;   (let ((company-message-func (ad-get-arg 0)))
;;     (when (and company-message-func
;;                (stringp (funcall company-message-func)))
;;       (unless (string-match "The free version of TabNine only indexes up to" (funcall company-message-func))
;;         ad-do-it))))


;; TODO fullscreen after emacs start(hook)
;; TODO emacs hook
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html
;; (add-hook! 'emacs-startup-hook #'toggle-frame-fullscreen #'+workspace/restore-last-session)
;; (add-hook! 'emacs-startup-hook #'toggle-frame-fullscreen)


;; lunar
;; https://emacs-china.org/t/topic/2119/13
;; (defun my--diary-chinese-anniversary (lunar-month lunar-day &optional year mark)
;;   (if year
;;       (let* ((d-date (diary-make-date lunar-month lunar-day year))
;;              (a-date (calendar-absolute-from-gregorian d-date))
;;              (c-date (calendar-chinese-from-absolute a-date))
;;              (cycle (car c-date))
;;              (yy (cadr c-date))
;;              (y (+ (* 100 cycle) yy)))
;;         (diary-chinese-anniversary lunar-month lunar-day y mark))
;;     (diary-chinese-anniversary lunar-month lunar-day year mark)))

;; carcadian
;; https://github.com/guidoschmidt/circadian.el
(use-package! circadian
  :config
  (setq calendar-latitude 30.4)
  (setq calendar-longitude 114.9)
  (setq circadian-themes '((:sunrise . doom-one-light)
                           (:sunset  . doom-one)))
  (circadian-setup))

;; TODO anki vocabulary capture failed
(use-package! anki-editor)
(use-package! anki-connect)

(use-package! rainbow-fart
  :hook (prog-mode . rainbow-fart-mode)
  :custom
  (rainbow-fart-voice-model "JustKowalski")
  (rainbow-fart-keyword-interval 10)
  (rainbow-fart-time-interval nil))
;; https://github.com/lujun9972/emacs-rainbow-fart


;; TODO autosave prog-mode
;; TODO balance window when change


;; TODO clang-format
;; https://clang.llvm.org/docs/ClangFormatStyleOptions.html


;; unsave query functions when left with unsaved customization
(add-hook 'kill-emacs-query-functions 'custom-prompt-customize-unsaved-options)


;; telega font
(when (member "Sarasa Mono SC" (font-family-list))
  (make-face 'telega-align-by-sarasa)
  (set-face-font 'telega-align-by-sarasa (font-spec :family "Sarasa Mono SC"))
  (add-hook! '(telega-chat-mode-hook telega-root-mode-hook)
    (buffer-face-set 'telega-align-by-sarasa)))


(when (member "Noto Color Emoji" (font-family-list))
    (set-fontset-font 't 'symbol
      (font-spec :family "Noto Color Emoji")
      nil 'prepend))


;; valign
(add-hook 'org-mode-hook #'valign-mode)
;; https://github.com/casouri/valign


;;
