;; https://company-mode.github.io/

(add-hook 'after-init-hook 'global-company-mode)

;; http://psung.blogspot.com/2008/05/from-dabbrev-expand-to-hippie-expand.html
(global-set-key "\M-/" 'company-complete)
