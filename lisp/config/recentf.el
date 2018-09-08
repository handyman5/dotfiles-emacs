;; recentf stuff -- http://www.joegrossberg.com/archives/000182.html
(require 'recentf)
(recentf-mode)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
