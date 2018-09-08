;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard shortcut configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Meta-<space> sets the mark.
(global-set-key "\M- " 'set-mark-command)
;; This one's just for fun.
(global-set-key [f8] 'treemacs-toggle)
;; Control-Tab switches through windows
;(global-set-key [C-tab] 'other-window)
;(global-set-key [C-S-tab] '(lambda () (interactive) (other-window -1)))
(global-set-key "\C-x\C-a" 'execute-extended-command)
;;(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key [f7] 'call-last-kbd-macro)
(global-set-key [f9] 'nav-toggle)

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

;; S-{up,down,left,right}
(windmove-default-keybindings 'control)
;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t )

;; ;; https://www.emacswiki.org/emacs/WindMove
;; (defun ignore-error-wrapper (fn)
;;     "Funtion return new function that ignore errors.
;;    The function wraps a function with `ignore-errors' macro."
;;     (lexical-let ((fn fn))
;;       (lambda ()
;;         (interactive)
;;         (ignore-errors
;;           (funcall fn)))))
;; 
;; (global-set-key [c-left] (ignore-error-wrapper 'windmove-left))
;; (global-set-key [c-right] (ignore-error-wrapper 'windmove-right))
;; (global-set-key [c-up] (ignore-error-wrapper 'windmove-up))
;; (global-set-key [c-down] (ignore-error-wrapper 'windmove-down))
