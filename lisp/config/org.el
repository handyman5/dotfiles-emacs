;;;
;;; Org Mode
;;;
(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
;;
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
;(global-set-key [f12] 'org-agenda-goto-today)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; org-journal
(defvar org-journal-file "~/org/journal.org"
    "Path to OrgMode journal file.")
(require 'org-journal)
;; 1. change journal path to ~/org/journal


;; TODO: set up all journal files to be included in the agenda generation guy

;;;;;;;;;;;;;;; org-capture ;;;;;;;;;;;;;;;
;; http://orgmode.org/manual/Setting-up-capture.html#Setting-up-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)


(require 'org-protocol)

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
(setq org-completion-use-ido nil)
(setq org-refile-use-outline-path nil)
(setq org-outline-path-complete-in-steps nil)

(setq org-capture-templates '(

;                               ("j" "Journal Entry"
;                                entry (file+datetree "~/org/journal.org")
;                                "* Event: %?\n\n  %i\n\n  From: %a"
;                                :empty-lines 1)
;                               )
      ("t" "Todo list item"
       entry (file+headline org-default-notes-file "Tasks")
       "* TODO %?\n %i\n %a"
       )

      ("p" "Project idea"
       entry (file+headline org-default-notes-file "Projects")
       "** PROJ %?\n %i\n %a"
       )
      
      ("j" "Journal entry"
       entry (file+datetree "~/org/journal.org")
       "**** %U %^{Title}\n%?"
       )

      ("b" "Tidbit: quote, zinger, one-liner or textlet"
       entry
       (file+headline org-default-notes-file "Tidbits")
       "* %^{Name} captured %U\n%^{Tidbit type|quote|zinger|one-liner|textlet}\nPossible Inspiration: %a %i\n%?"
       )

      ("l" "A link, for reading later." entry
       (file+headline "notes.org" "Reading List")
       "* %:description\n%u\n\n%c\n\n%i"
                :empty-lines 1)

      ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
       "* %? [[%:link][%:description]] %(progn (setq kk/delete-frame-after-capture 2) \"\")\nCaptured On: %U"
       :empty-lines 1)

      
      ))


; (defun org-agenda-show-tasks (&optional arg)
;   (interactive "P")
;   (org-agenda arg "a"))
; (define-key org-mode-map (kbd "<f12>") 'org-agenda-show-tasks)

(define-key global-map (kbd "<f12>")
          (lambda () (interactive) (org-agenda nil "a")))

; ;; Org-mode settings
; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
; (global-set-key "\C-cl" 'org-store-link)
; (global-set-key "\C-ca" 'org-agenda)
; (setq org-cycle-emulate-tab 'white)

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

(setq org2blog/wp-buffer-template
"#+DATE: %s
#+OPTIONS: toc:nil num:nil todo:nil pri:nil tags:nil ^:nil TeX:nil
#+CATEGORY:
#+TAGS:
#+PERMALINK:
#+TITLE:
\n
#+HTML: <!--more-->
\n")

;; Adding TODO keywords
;; http://orgmode.org/manual/Workflow-states.html#Workflow-states
(setq org-todo-keywords '((sequence "TODO(t)" "LIVE(l)" "WAIT(w)" "|"
                                    "SOMEDAY(s)" "WONT(n)" "DONE(d)")))

(setq org-agenda-files (list "~/wiki" "~/org"))


;; Notes
;; in-buffer settings: http://orgmode.org/manual/In_002dbuffer-settings.html
;; cheat sheet: http://orgmode.org/orgcard.txt

;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html

(setq org-agenda-custom-commands
      '(("Q" . "Custom queries") ;; gives label to "Q"
        ;("Qa" "Archive search" search ""
        ; ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org"))))
        ;("Qb" "Projects and Archive" search ""
        ; ((org-agenda-text-search-extra-files (file-expand-wildcards "~/org/archive/*.org"))))
        ;; searches both projects and archive directories
        ;("QA" "Archive tags search" org-tags-view ""
        ; ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org"))))
        ;; ...other commands here
        ("P" "Projects" search ""
         ((org-agenda-text-search-extra-files (file-expand-wildcards "~/org/projects/*.org"))))
        ))


;; make org files quite a bit prettier -- http://doc.rix.si/cce/cce-org.html#org635a684
(require 'org-indent)
(setq org-startup-indented t)
(diminish 'org-indent-mode )
(setq org-hide-leading-stars nil)
(setq org-cycle-separator-lines 2)

; ;; Use '-' as the bullet list exclusively.
; (setq org-list-demote-modify-bullet '(("+" . "-")
;                                       ("*" . "-")
;                                       ("1." . "-")
;                                       ("1)" . "-")
;                                       ("A)" . "-")
;                                       ("B)" . "-")
;                                       ("a)" . "-")
;                                       ("b)" . "-")
;                                       ("A." . "-")
;                                       ("B." . "-")
;                                       ("a." . "-")
;                                       ("b." . "-")))



 ;; Kill the frame if one was created for the capture
  (defvar kk/delete-frame-after-capture 0 "Whether to delete the last frame after the current capture")

  (defun kk/delete-frame-if-neccessary (&rest r)
    (cond
     ((= kk/delete-frame-after-capture 0) nil)
     ((> kk/delete-frame-after-capture 1)
      (setq kk/delete-frame-after-capture (- kk/delete-frame-after-capture 1)))
     (t
      (setq kk/delete-frame-after-capture 0)
      (delete-frame))))

  (advice-add 'org-capture-finalize :after 'kk/delete-frame-if-neccessary)
  (advice-add 'org-capture-kill :after 'kk/delete-frame-if-neccessary)
  (advice-add 'org-capture-refile :after 'kk/delete-frame-if-neccessary)


;; https://stackoverflow.com/questions/15011703/is-there-an-emacs-org-mode-command-to-jump-to-an-org-heading
(setq org-outline-path-complete-in-steps nil)
(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)
(global-set-key "\C-c\C-j" 'org-goto)
