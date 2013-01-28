;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-cycle-emulate-tab 'white)

;; org2blog support
;; https://github.com/punchagan/org2blog
(require 'org2blog-autoloads)
(setq org2blog/wp-use-sourcecode-shortcode t)
(setq org2blog/wp-blog-alist
       '(("ajc"
          :url "http://ajcsystems.com/blog/xmlrpc.php"
          :username "adamc"
          :default-title "Hello World"
          :default-categories ("org2blog" "emacs")
          :tags-as-categories nil)))


;; Notes
;; in-buffer settings: http://orgmode.org/manual/In_002dbuffer-settings.html
;; cheat sheet: http://orgmode.org/orgcard.txt
