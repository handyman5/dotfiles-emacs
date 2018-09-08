;;;;;;;;;;;;;;;;;;
;; Color Themes ;;
;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/elisp/color-theme")
;(autoload 'color-theme-select "color-theme" "Enable wheely mouse")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
;(color-theme-solarized-dark)

(set-face-background 'hl-line "#222222")

;(color-theme-clarity)

