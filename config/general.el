;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General emacs configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; starts an emacs server so as to be available to emacsclient
(server-start)
 ;; prevent the startup message from being displayed
(setq inhibit-startup-message t)
 ;; disable making backups of files (filename~)
(setq backup-inhibited t)
 ;; disable automatically saving files at intervals
(setq auto-save-default nil)
 ;; replaces all "answer yes or no" prompts with "answer y or n"
(fset 'yes-or-no-p 'y-or-n-p)
 ;; sane-ify tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
 ;; show trailing whitespace in red
(setq show-trailing-whitespace t)
  ;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Narrowing.html
(put 'narrow-to-region 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Useful Misc. Packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; makes the minibuffer clear out when you type / or ~
(require 'minibuf-electric-gnuemacs)
 ;; http://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
 ;; ensmartens buffer and file switching
(ido-mode t)


;;;;;;;;;;;;;;;;;;
;; Global Modes ;;
;;;;;;;;;;;;;;;;;;

 ;; turn on syntax highlighting where appropriate
(global-font-lock-mode 1)
 ;; make emacs highlight the current line
 ;; (from http://www.emacsblog.org/2007/04/09/highlight-the-current-line/)
(global-hl-line-mode 1)
(set-face-background 'hl-line "light gray")
 ;; provides support for editing by visual lines instead of logical lines
(global-visual-line-mode 1)
 ;; make emacs highlight the marked region (in blue by default)
(transient-mark-mode 1)
  ;; makes selected region work like Windows (i.e., delete the entire thing)
(cua-selection-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Tool and Menu Bars ;;
;;;;;;;;;;;;;;;;;;;;;;;;

 ;; disable menubar when running emacs in a terminal
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
 ;; Disable Aquamacs' tool-bar
 ;; (http://www.emacswiki.org/cgi-bin/wiki/AquamacsFAQ#toc12)
(setq tool-bar-mode nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modeline configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; adds the column number to the modeline
(column-number-mode)
 ;; set time to show in corner
(setq display-time-day-and-date t)
(display-time)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Default mode configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; default mode of a new empty buffer
(setq default-major-mode 'indented-text-mode)

 ;; default mode of *scratch*
(setq initial-major-mode 'text-mode)

; enable auto-fill-mode only for org-mode/blogging, not coding
;   (auto-fill-mode 1)