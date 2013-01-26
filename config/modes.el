
(autoload #'puppet-mode "puppet-mode" "Start puppet-mode" t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(autoload #'php-mode "php-mode" "Start php-mode" t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

