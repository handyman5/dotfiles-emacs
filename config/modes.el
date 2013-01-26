
(autoload #'puppet-mode "puppet-mode" "Start puppet-mode" t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(autoload #'php-mode "php-mode" "Start php-mode" t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; from https://github.com/rmm5t/dotfiles/blob/master/emacs.d/rmm5t/markdown-mode.el
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . gfm-mode))

(eval-after-load 'markdown-mode
  '(progn
     (define-key markdown-mode-map (kbd "C-c C-v") 'markdown-preview)
     ))
