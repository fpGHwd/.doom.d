;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
(package! helm-spotify-plus)
(package! rime)
(package! youdao-dictionary)
;; (package! posframe)
(package! leetcode)
;; (package! w3m)
;; (package! helm-w3m)
(package! podcaster)
;; (package! org-roam-server)
(package! command-log-mode)
;; (package! company-tabnine)
;; (package! cal-china-x)
(package! anki-editor)
(package! anki-vocabulary)
(package! anki-mode)
;; (package! telega)
(package! circadian)
;; (package! i3wm-config-mode)
(package! nyan-mode)
;; (package! org-dotemacs)
(package! wakatime-mode)
(package! org-alert)
(package! bing-dict)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))
(package! org2nikola
  :recipe (:host github
           :repo "redguardtoo/org2nikola"))

(package! telega
  :recipe (:host github
           :repo "zevlg/telega.el"
           :branch "master"
           :files (:defaults "etc" "server" "Makefile")))

(package! shengci
  :recipe (:host github
           :repo "EvanMeek/shengci.el"
           :branch "master"))

(package! evernote-mode
  :recipe (:host github
           :repo "pymander/evernote-mode"
           :branch "master"
           :files ("ruby" "doc" "credits.txt" "evernote-client.el" "evernote-mode.el" "org-evernote.el")))

;; (package! doom-girly-heart-theme
;;   :recipe (:host github
;;            :repo "locez/doom-girly-heart-theme.el"
;;            :branch "master"))

;; (package! rainbow-fart
;;   :recipe (:host github
;;            :repo "stardiviner/emacs-rainbow-fart"
;;            :branch "master"
;;            :files (:defaults "voices")))

(package! valign
  :recipe (:host github :repo "casouri/valign"))

(package! org-latex-instant-preview
  :recipe (:host github :repo "yangsheng6810/org-latex-instant-preview" :branch "develop"))

;; (package! eaf :recipe
;;   (:host github
;;     :repo "manateelazycat/emacs-application-framework"
;;     :branch "master"
;;     :files ("app" "core" "docker" "screenshot" "eaf.py" "eaf.el")))


;; (package! liberime :recipe
;;   (:host github
;;     :repo "merrickluo/liberime"
;;     :branch "master"
;;     :files ("CMakeLists.txt" "Makefile" "src" "liberime*.el" "liberime-config.el" "emacs-module")))


;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)
;; (package! org-protocol)

(package! org-protocol-capture-html
  :recipe (:host github
                 :repo "alphapapa/org-protocol-capture-html"))

(package! wucuo)
(package! org-super-agenda)
