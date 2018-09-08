
; http://www.emacswiki.org/emacs/AutoInstall
;(add-to-list 'load-path (expand-file-name "~/elisp"))
;(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/auto-install/")
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))


;; time emacs startup
;; from http://a-nickels-worth.blogspot.com/2007/11/effective-emacs.html
(require 'cl)
(defvar *emacs-load-start* (current-time))


;; This command maximizes the frame on startup
;; (from http://www.emacsblog.org/2007/02/22/maximize-on-startup-part-2/)
;(autoload 'maximize-frame "maxframe" t)  ;;(require 'maxframe)
;(add-hook 'window-setup-hook 'maximize-frame t)
;(setq mf-display-padding-width 9)  ; adds display padding to fix os x
;(setq mf-display-padding-height (+ 20 23) ) ; adds more display padding
;; (setq mf-display-padding-height (+ 85 23) ) ; adds more display padding (fits tool-bar)


;(setq-default cua-enable-cua-keys nil)
;(cua-mode)
;(cua-selection-mode)
;; This command enables shift-selection for X Windows; OS X handles it already
;; and breaks if it is universally defined.
(if (equal window-system 'x) (cua-selection-mode nil))
; (if (string= system-type "darwin")
;     (setq process-connection-type nil))
; (when window-system (mwheel-install))

;(require 'smooth-scrolling)     ; from http://emacs.wordpress.com/2007/09/10/smooth-scrolling/
;(require 'regex-tool)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Random elisp functions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun unfill-region (begin end)
 "Remove all linebreaks in a region but leave paragraphs,
 indented text (quotes,code) and lines starting with an asterix (lists) intakt."
 (interactive "r")
 (replace-regexp "\\([^\n]\\)\n\\([^ *\n]\\)" "\\1 \\2" nil begin end))


; http://tuxicity.se/emacs/elisp/2010/05/07/clean-up-buffer-or-region-in-emacs.html
(defun clean-up-buffer-or-region ()
  "Untabifies, indents and deletes trailing whitespace from buffer or region."
  (interactive)
  (save-excursion
    (unless (region-active-p)
      (mark-whole-buffer))
    (untabify (region-beginning) (region-end))
    (indent-region (region-beginning) (region-end))
    (save-restriction
      (narrow-to-region (region-beginning) (region-end))
      (delete-trailing-whitespace))))

(global-set-key (kbd "C-c n") 'clean-up-buffer-or-region)



;(add-to-list 'load-path "~/elisp/w3m")
;(require 'w3m-load)
;(setq w3m-use-cookies t)

;(defun w3m-buffer (&optional url charset)
;  "Render the current buffer.
;    See `w3m-region' for the optional arguments."
;  (interactive (list (w3m-expand-file-name-as-url (or (buffer-file-name)
;                             default-directory))))
;  (w3m-region (point-min) (point-max) url charset))

;(add-to-list 'load-path "~/elisp/g-client")
;(load-library "g")
;(setq g-user-email "comptona@gmail.com")
;(setq g-html-handler 'w3m-buffer)
;;(setq g-curl-program "curl -x proxy.host:port")

;; This code activates cfengine-mode syntax highlighting
;(autoload 'cfengine-mode "cfengine" "" t nil)
;(setq auto-mode-alist (append '(("cf\\." . cfengine-mode))
;                               auto-mode-alist))


;(defconst my-mode-line-buffer-identification
;  (list
;   '(:eval
;     (let ((host-name
;       (if (file-remote-p default-directory)
;       (tramp-file-name-host
;        (tramp-dissect-file-name default-directory))
;         (system-name))))
;       (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
;      (substring host-name 0 (match-beginning 1))
;    host-name)))
;   ": %12b"))

;(setq-default
; mode-line-buffer-identification
; my-mode-line-buffer-identification)

(add-hook
 'dired-mode-hook
 '(lambda ()
    (setq
     mode-line-buffer-identification
     my-mode-line-buffer-identification)))

(add-to-list 'load-path "~/elisp/emacs-w3m")

;(add-to-list 'load-path "~/elisp/g-client")
;(load-library "g")
;(gcal-emacs-calendar-setup)
;(setq g-user-email "comptona@gmail.com")
;(setq g-html-handler 'w3m-buffer)

;(add-to-list 'load-path "~/elisp/g-client")
;(load-library "g")
;(setq g-user-email "comptona@gmail.com")
;(setq g-html-handler 'w3m-buffer)


; anything.el stuff! http://bc.tech.coop/blog/070711.html
;(require 'anything-config)

;(setq fit-frame-inhibit-fitting-flag t)

;(setq anything-sources
;      (list anything-c-source-buffers
;            anything-c-source-file-name-history
;       anything-c-source-recentf
;       anything-c-source-planner
;            anything-c-source-info-pages
;            anything-c-source-man-pages
;            anything-c-source-locate
;            anything-c-source-emacs-commands))

;anything-c-source-tracker-search
;anything-c-source-mac-spotlight

(when (require 'bubble-buffer nil t)
  (global-set-key [f5] 'bubble-buffer-next)
  (global-set-key [(shift f5)] 'bubble-buffer-previous))
(setq bubble-buffer-omit-regexp "\\(^
.+$\\|\\*Messages\\*\\|*compilation\\*\\|\\*.+output\\*$\\|\\*TeX
Help\\*$\\|\\*vc-diff\\*\\|\\*Occur\\*\\|\\*grep\\*\\|\\*cvs-diff\\*\\)")

;; Disabled due to incompatibility with Aquamacs 1.4
;(when window-system (plan))

; Disabled commands
; These functions load the python mode, associate it with .py files by
; default, and set various python-pleasing settings (tabs and such)
;(setq auto-mode-alist
;   (cons '("\\.py$" . python-mode) auto-mode-alist))
;(setq interpreter-mode-alist
;   (cons '("python" . python-mode)
;       interpreter-mode-alist))
;(autoload 'python-mode "python-mode" "Python hacking mode." t)
;(defun my-python-mode-hook ()
;  (setq-default indent-tabs-mode nil)
;  )
;(add-hook 'python-mode-hook 'my-python-mode-hook)

;(defun iswitchb-local-keys ()
;  (mapc (lambda (K)
;   (let* ((key (car K)) (fun (cdr K)))
;           (define-key iswitchb-mode-map key fun)))
; '(("right" . iswitchb-next-match)
;   ("left"  . iswitchb-prev-match)
;   ("up"    . ignore             )
;   ("down"  . ignore             ))))

;(defun iswitchb-local-keys2 ()
;  (define-key iswitchb-mode-map "right" 'iswitchb-next-match)
;  (define-key iswitchb-mode-map "left" 'iswitchb-prev-match)
;  (define-key iswitchb-mode-map "up" 'ignore)
;  (define-key iswitchb-mode-map "down" 'ignore))
;
;(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys2)

;(setq ido-confirm-unique-completion t)
;(setq ido-default-buffer-method 'samewindow)
;(setq ido-use-filename-at-point t)
;(ido-mode t)
;(ido-everywhere t)

;(set-face-background 'ido-first-match "white")
;(set-face-foreground 'ido-subdir "blue3")

;(icomplete-mode 1)

;;;;;;;;;;;

;(defun adam-open-wiki-page (arg)
;  "Either open a wiki page via ido, or grep for a string in the wiki pages."
;  (interactive "P")
;  (let* ((default-directory "~/notebook/plans")
;         (grep-cmd (format "cd %s && grep -n -i --directories=skip" default-directory))
;         (file-glob "*"))
;    (if arg
;        (grep (concat grep-cmd " -e \"" (read-string (format "Search %s for regexp: "default-directory)) "\" " file-glob))
;      (ido-find-file))))
;(global-set-key [(meta f12)] 'adam-open-wiki-page)


;; These commands enable in improved buffer-switching command
(autoload 'iswitchb-mode "iswitchb" t) ;;(require 'iswitchb)
(iswitchb-mode t)


; anything.el integration
;(global-set-key "\C-`" 'anything)
;(global-set-key (read-kbd-macro "C-`") 'anything)
;(global-set-key (read-kbd-macro "C-.") 'undo)

