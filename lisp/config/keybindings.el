;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard shortcut configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Meta-<space> sets the mark.
(global-set-key "\M- " 'set-mark-command)
;; This one's just for fun.
(global-set-key [f8] 'zone)
;; Control-Tab switches through windows
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-tab] '(lambda () (interactive) (other-window -1)))
(global-set-key "\C-x\C-a" 'execute-extended-command)
;;(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key [f7] 'call-last-kbd-macro)

;; goto-line
(global-set-key "\M-g" 'goto-line)

;; undo
(global-set-key (kbd "C-/") 'undo)


;; these do not work in OS X iTerm2
;(global-set-key [M-up] 'scroll-up)
;(global-set-key [M-down] 'scroll-down)

;; make ^H give help instead of delete-backward-char
(add-hook 'term-setup-hook
          (lambda ()
           (when (getenv "TERM")
             (global-set-key "\C-h" 'help))))

