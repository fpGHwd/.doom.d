(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-width t)
 '(Man-width-max nil)
 '(browse-url-browser-function 'browse-url-firefox)
 '(dired-guess-shell-alist-user
   '(("\\.\\(?:docx\\|pdf\\|djvu\\|eps\\)\\'" "xdg-open \"%s\"")
     ("\\.\\(?:jpe?g\\|png\\|gif\\|xpm\\)\\'" "xdg-open")
     ("\\.\\(?:xcf\\)\\'" "xdg-open")
     ("\\.csv\\'" "xdg-open")
     ("\\.tex\\'" "xdg-open")
     ("\\.\\(?:mp4\\|mkv\\|avi\\|flv\\|rm\\|rmvb\\|ogv\\)\\(?:\\.part\\)?\\'" "xdg-open")
     ("\\.\\(?:mp3\\|flac\\)\\'" "xdg-open")
     ("\\.html?\\'" "xdg-open")
     ("\\.md\\'" "xdg-open")))
 '(geiser-default-implementation 'mit)
 '(global-prettify-symbols-mode t)
 '(latex-run-command "xelatex")
 '(nyan-mode t)
 '(org-archive-location "~/Dropbox/to-encfs/text/org/archive.org::* From %s")
 '(org-file-apps
   '((auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "okular \"%s\"")
     ("\\.docx\\'" . "libreoffice \"%s\"")
     ("\\.doc\\'" . "libreoffice \"%s\"")))
 '(scheme-mit-dialect t)
 '(telega-notifications-mode t t)
 '(woman-locale "en_US.UTF-8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic)))))
