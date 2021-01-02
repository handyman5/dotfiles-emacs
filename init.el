;; use this as a reference: https://github.com/patrickt/emacs/blob/master/init.el



;; speedup tip from https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
(setq gc-cons-threshold 1000000000)

;; Load main config file "./config.org"
(require 'org)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; setting the threshold back to the default after init is complete
(setq gc-cons-threshold 1000000)

(provide 'init)
;;; init.el ends here
