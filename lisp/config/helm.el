;; http://tuhdo.github.io/helm-intro.html
;; https://github.com/emacs-helm/helm

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-command-prefix)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;(setq tramp-default-method "ssh")
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z


(setq helm-buffers-fuzzy-matching t)
(setq helm-ff-file-name-history-use-recentf t)
(setq helm-quick-update t)

; (setq helm-quick-update                     t ; do not display invisible candidates
;       helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;       helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
; ;      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;       helm-ff-file-name-history-use-recentf t)
(global-set-key (kbd "M-s o") 'helm-occur)
(set-face-attribute 'helm-selection nil :background "#222222")

