;; HideShow
;; http://www.emacswiki.org/emacs/HideShow
(global-set-key (kbd "M-=") 'hs-toggle-hiding)
(global-set-key (kbd "M-+") 'hs-show-all)
(global-set-key (kbd "M-_") 'hs-hide-all)
(global-set-key (kbd "C-M-_") 'hs-hide-all)

(defadvice goto-line (after expand-after-goto-line
                            activate compile)
  "hideshow-expand affected block when using goto-line in a collapsed buffer"
  (save-excursion
    (hs-show-block)))

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'display
                 (format "... / %d"
                         (count-lines (overlay-start ov)
                                      (overlay-end ov))))))

(setq hs-set-up-overlay 'display-code-line-counts)
(setq hs-isearch-open t)

(add-hook 'conf-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'indented-text-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'puppet-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'ruby-mode-hook 'hs-minor-mode)
(add-hook 'shell-mode-hook 'hs-minor-mode)

; Ruby HideShow support
(add-to-list 'hs-special-modes-alist
             '(ruby-mode
               "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
               (lambda (arg) (ruby-end-of-block)) nil))
