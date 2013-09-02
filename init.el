;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                 ;
;    .emacs configuration file    ;
;                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/local"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/local/planner-el"))

(load "config")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "b8dda86123bd8ef87adadb12e203cd2548d44546b97d25f536aef8ff729e85b2" "78b1c94c1298bbe80ae7f49286e720be25665dca4b89aea16c60dacccfbb0bca" default)))
 '(ecb-options-version "2.40")
 '(puppet-indent-level 4)
 '(text-mode-hook (quote (turn-on-flyspell text-mode-hook-identify)))
 '(weblogger-config-alist (quote (("default" "http://ajcsystems.com/blog/xmlrpc.php" "adamc" "" "1"))))
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
