;;;;;;;;;;;;;;;;;;
;; Color Themes ;;
;;;;;;;;;;;;;;;;;;
;; reference: http://raebear.net/comp/emacscolors.html
;(add-to-list 'load-path "~/elisp/color-theme")
;(autoload 'color-theme-select "color-theme" "Enable wheely mouse")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

(color-theme-parus)
;(color-theme-arjen)
;(color-theme-molokai)
;(color-theme-colorful-obsolescence)

(set-face-background 'hl-line "color-52")
;; M-x helm-colors to see the available options


;(color-theme-solarized-dark)
;(load-theme 'zenburn t)
;(color-theme-clarity)
;(color-theme-tty-dark)

