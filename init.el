;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                 ;
;    .emacs configuration file    ;
;                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/local"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/local/planner-el"))

(load "config-init")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(background-color "#ffffd7")
 '(background-mode light)
 '(compilation-message-face (quote default))
 '(cursor-color "#626262")
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "9ab634dcc9131f79016c96c4955298409649f6538908c743a8a9d2c6bc8321ef" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "c4a784404a2a732ef86ee969ab94ec8b8033aee674cd20240b8addeba93e1612" "25f330cb050c7e7ec402af1b60243e8185a7837b455af0fa026593d4f48a78b2" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "b8dda86123bd8ef87adadb12e203cd2548d44546b97d25f536aef8ff729e85b2" "78b1c94c1298bbe80ae7f49286e720be25665dca4b89aea16c60dacccfbb0bca" default)))
 '(ecb-options-version "2.40")
 '(fci-rule-color "#eee8d5")
 '(foreground-color "#626262")
 '(global-font-lock-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files
   (quote
    ("~/org/work_archive.org" "~/org/work_projects.org" "~/org/home_projects.org" "/Users/acompton/org/notes.org" "/Users/acompton/wiki/candidates.org" "/Users/acompton/wiki/projects.org" "/Users/acompton/wiki/todo.org")))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("elpa" . "https://tromey.com/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (js2-mode treemacs treemacs-projectile groovy-mode vmd-mode impatient-mode flymd markdown-mode markdown-preview-eww markdown-preview-mode markdown-toc zenburn-theme yaml-mode weblogger web-mode w3m w3 tron-theme terraform-mode tabkey2 switch-window screen-lines rainbow-mode python-pylint python-pep8 python-mode python-magic pytest pysmell pylint pyflakes pyde py-import-check puppet-mode protobuf-mode php-mode pep8 org2blog org-projectile org-magit org-journal org-gcal org-dashboard org-capture-pop-frame org-blog org-beautify-theme org-babel-eval-in-repl neotree muse monokai-theme meacupla-theme magit-simple-keys magit-push-remote magit-gh-pulls magit-commit-training-wheels json-mode jedi-direx ipython idle-highlight-mode httprepl http-post-simple htmlize hideshowvis helm-projectile helm-git helm-ack git-rebase-mode git-commit-mode elpy el-x ecb diminish deft crontab-mode creole-mode creole confluence-edit company-statistics color-theme-wombat color-theme-wombat+ color-theme-vim-insert-mode color-theme-twilight color-theme-tangotango color-theme-tango color-theme-solarized color-theme-sanityinc-tomorrow color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-dawn-night color-theme-complexity color-theme-colorful-obsolescence color-theme-cobalt color-theme-buffer-local color-theme-blackboard color-theme-actress color-theme-active bm avy-menu apache-mode anti-zenburn-theme ac-js2)))
 '(puppet-indent-level 4)
 '(text-mode-hook (quote (turn-on-flyspell text-mode-hook-identify)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(weblogger-config-alist
   (quote
    (("default" "http://ajcsystems.com/blog/xmlrpc.php" "adamc" "" "1"))))
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-file-link-face ((t (:foreground "white")))))
(put 'downcase-region 'disabled nil)
