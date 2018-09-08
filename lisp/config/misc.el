;; emacs-server yak-shaving
;(add-hook 'server-switch-hook
;          (lambda nil
;            (let ((server-buf (current-buffer)))
;              (bury-buffer)
;              (switch-to-buffer-other-frame server-buf))));
;
;(custom-set-variables '(server-kill-new-buffers t))
;(add-hook 'server-done-hook (lambda () (delete-frame)))
;(add-hook 'server-done-hook (lambda nil (kill-buffer nil)))


(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key (kbd "C-x C-c") 'server-edit))))

;==========================================================
; Notational Velocity replacement

(require 'deft)
(require 'simplenote)
(setq simplenote-email "comptona@gmail.com")
(simplenote-setup)
(global-set-key [f8] 'deft)

; Icicles
(add-to-list 'load-path "/my/path/to/icicles/")
;(require 'icicles)
;(icy-mode 1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Remove completion buffer when done
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))


;; Jump to end of line, exclusive of comments
;; http://www.emacswiki.org/emacs/EndOfLineNoComments
(require 'newcomment)
(defun impaktor-move-end-of-line ()
  (interactive)
  (when (comment-search-forward (line-end-position) t)
    (goto-char (match-beginning 0))
    (skip-syntax-backward " " (line-beginning-position))))

(global-set-key (kbd "C-c C-e") 'impaktor-move-end-of-line)




;; (message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
;;                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

(elpy-enable)
