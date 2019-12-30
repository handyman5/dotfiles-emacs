;;;
;;; Org Mode
;;;

;;;;;;;;;;;;;;; org-mode ;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(require 'org)

;; disable org-journal keybindings
(define-key org-mode-map "\C-c\C-s" nil)
(define-key org-mode-map "\C-c\C-f" nil)
(define-key org-mode-map "\C-c\C-b" nil)
(define-key org-mode-map "\C-c\C-j" nil)

;(require 'org-protocol)
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets (quote (
                                 (nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 6)
                                 (org-agenda-files :tag . "heading")
                                 (org-agenda-files :tag . "project")
                                 (org-agenda-files :todo . "PROJ")
                                 )))
(setq org-completion-use-ido nil)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-use-cache t)
(run-with-idle-timer 300 t (lambda ()
                             (org-refile-cache-clear)
                             (org-refile-get-targets)))

;; Adding TODO keywords
;; http://orgmode.org/manual/Workflow-states.html#Workflow-states
(setq org-todo-keywords '((sequence "TODO(t)" "LIVE(l)" "WAIT(w)" "|"
                                    "SOMEDAY(s)" "WONT(n)" "DONE(d)" "PROJ(p)")))

;; make org files quite a bit prettier -- http://doc.rix.si/cce/cce-org.html#org635a684
;(require 'org-indent)
;(setq org-startup-indented t)
;(diminish 'org-indent-mode )
(setq org-hide-leading-stars nil)
(setq org-cycle-separator-lines 2)



;;;;;;;;;;;;;;; org-agenda ;;;;;;;;;;;;;;;
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map (kbd "<f12>")
          (lambda () (interactive) (org-agenda nil "a")))
(setq org-agenda-files (list "~/org" "~/org/journal"))
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'")


;;;;;;;;;;;;;;; org-journal ;;;;;;;;;;;;;;;
(defvar org-journal-dir (concat org-directory "/journal"))
(require 'org-journal)
(setq org-journal-carryover-items nil)
(setq org-journal-enable-agenda-integration t)
(setq org-journal-time-format "<%Y-%m-%d %a %H:%M> ")

(define-key global-map "\C-cj" 'org-journal-new-scheduled-entry)



(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  ;; Position point on the journal's top-level heading so that org-capture
  ;; will add the new entry as a child entry.
  (goto-char (point-min)))


;;;;;;;;;;;;;;; org-capture ;;;;;;;;;;;;;;;
;; http://orgmode.org/manual/Setting-up-capture.html#Setting-up-capture
(setq org-default-notes-file (concat org-directory "/activity.org"))
(define-key global-map "\C-cc" 'org-capture)
(define-key org-mode-map "\C-cl" 'org-store-link)
(define-key org-mode-map "\C-ci" 'org-insert-last-stored-link)



;; make the frame contain a single window. by
;; default org-remember splits the window.
;; CRITICAL
(add-hook 'org-capture-mode-hook
          'delete-other-windows)

;; CRITICAL
(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "*Capture*")
                 (width . 80)
                 (height . 40)
                 (vertical-scroll-bars . nil)
                 (menu-bar-lines . nil)
                 (tool-bar-lines . nil)))
  (select-frame-by-name "*Capture*")
  (delete-other-frames)
  (org-capture nil)
)

(setq org-capture-templates 
      (quote (
("n" "Notes (inbox.org)" entry (file+headline
org-default-notes-file "Activity")
"* %^{Description} %^g %? 
Added: %U")

)))

;; ("j" "Journal Entry (daily file)" entry (function org-journal-find-location)
;; "** %T - %^{Activity}")

;; ("a" "Appointment" entry (file+headline 
;; org-default-notes-file "Calendar") 
;; "* APPT %^{Description} %^g
;; %?
;; Added: %U") 

; ("t" "Task Diary" entry (file+datetree 
; org-default-notes-file) 
; "* TODO %^{Description}  %^g
; %?
; Added: %U") 

;; ("j" "Journal entry" entry (function org-journal-find-location)
;; "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
;; ;"* %(format-time-string org-journal-time-format)%i%?")



;; Notes
;; in-buffer settings: http://orgmode.org/manual/In_002dbuffer-settings.html
;; cheat sheet: http://orgmode.org/orgcard.txt

;;; https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html

(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (air-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))


(defun air-pop-to-org-agenda (&optional split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda nil "c")
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "M-SPC") 'air-pop-to-org-agenda)

;;;;;;;;;;;;;;; org-babel ;;;;;;;;;;;;;;;

;; http://cachestocaches.com/2018/6/org-literate-programming/

;; Run/highlight code using babel in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (shell . t)
   ;; Include other languages here...
   ))
;; Syntax highlight in #+BEGIN_SRC blocks
(setq org-src-fontify-natively t)
;; Don't prompt before running code in org
(setq org-confirm-babel-evaluate nil)
;; Fix an incompatibility between the ob-async and ob-ipython packages
(setq ob-async-no-async-languages-alist '("ipython"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; archived
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;; #+TITLE: Adam's Org-mode Emacs configuration
;; #+OPTIONS: toc:4 h:4
;; #+STARTUP: showeverything
;; #+PROPERTY: header-args:emacs-lisp    :tangle yes
;; 
;; * Configuration
;; ** About this file
;;    :PROPERTIES:
;;    :CUSTOM_ID: babel-init
;;    :END:
;; <<babel-init>>
;; 
;; 
;; ** Starting up
;; 
;; #+begin_src emacs-lisp 
;; ;; This sets up the load path so that we can override it
;; (package-initialize)
;; #+END_SRC

; (setq org-capture-templates '(("j" "Journal entry" entry (function org-journal-find-location)
;                                "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")))
; 

; (defun pc/new-buffer-p ()
;     (not (file-exists-p (buffer-file-name))))
; 
;   (defun pc/insert-journal-template ()
;     (let ((template-file (expand-file-name "template.org" org-directory)))
;       (when (pc/new-buffer-p)
;         (save-excursion
;           (goto-char (point-min))
;           (insert-file-contents template-file)))))
; 
;   (add-hook 'org-journal-after-entry-create-hook #'pc/insert-journal-template)

;(setq org-journal-date-prefix "** ")

;; TODO: set up all journal files to be included in the agenda generation guy

(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (member (nth 5 (org-heading-components)) (quote "project"))) ;Note - "org-done-keywords"?

(defun bh/verify-refile-target2 ()
  "Exclude todo keywords with a done state from refile targets"
  (member (nth 2 (org-heading-components)) (quote "DONE"))) ;Note - "org-done-keywords"?

;;(setq org-refile-target-verify-function 'bh/verify-refile-target2)


;;(setq helm-org-headings-fontify t)


;; (setq org-capture-templates '(
;; 
;;       ("t" "Todo list item"
;;        entry (file+headline org-default-notes-file "Tasks")
;;        "* TODO %?\n %i\n %a"
;;        )
;; 
;;       ("p" "Project idea"
;;        entry (file+headline org-default-notes-file "Projects")
;;        "** PROJ %?\n %i\n %a"
;;        )
;;       
;;       ("b" "Tidbit: quote, zinger, one-liner or textlet"
;;        entry
;;        (file+headline org-default-notes-file "Tidbits")
;;        "* %^{Name} captured %U\n%^{Tidbit type|quote|zinger|one-liner|textlet}\nPossible Inspiration: %a %i\n%?"
;;        )
;; 
;;       ("l" "A link, for reading later." entry
;;        (file+headline "notes.org" "Reading List")
;;        "* %:description\n%u\n\n%c\n\n%i"
;;                 :empty-lines 1)
;; 
;;       ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;        "* %? [[%:link][%:description]] %(progn (setq kk/delete-frame-after-capture 2) \"\")\nCaptured On: %U"
;;        :empty-lines 1)
;; 
;;       
;;       ))

; ("k" "Journal entry" entry (function org-journal-find-location)
;                                "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
; 
; ("f" "Journal entry" plain
; (file+datetree+prompt "~/org/journal2.org")
; "%K - %a\n%i\n%?\n")







; (defun org-agenda-show-tasks (&optional arg)
;   (interactive "P")
;   (org-agenda arg "a"))
; (define-key org-mode-map (kbd "<f12>") 'org-agenda-show-tasks)

; ;; Org-mode settings
; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
; (global-set-key "\C-ca" 'org-agenda)
; (setq org-cycle-emulate-tab 'white)

;; ;; org2blog support
;; ;; https://github.com/punchagan/org2blog
;; (require 'org2blog-autoloads)
;; (setq org2blog/wp-use-sourcecode-shortcode t)
;; (setq org2blog/wp-blog-alist
;;        '(("ajc"
;;           :url "http://ajcsystems.com/blog/xmlrpc.php"
;;           :username "adamc"
;;           :default-title "Hello World"
;;           :default-categories ("org2blog" "emacs")
;;           :tags-as-categories nil)))
;; 
;; (setq org2blog/wp-buffer-template
;; "#+DATE: %s
;; #+OPTIONS: toc:nil num:nil todo:nil pri:nil tags:nil ^:nil TeX:nil
;; #+CATEGORY:
;; #+TAGS:
;; #+PERMALINK:
;; #+TITLE:
;; \n
;; #+HTML: <!--more-->
;; \n")

; ;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
; 
; (setq org-agenda-custom-commands-222
;       '(("Q" . "Custom queries") ;; gives label to "Q"
;         ;("Qa" "Archive search" search ""
;         ; ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org"))))
;         ;("Qb" "Projects and Archive" search ""
;         ; ((org-agenda-text-search-extra-files (file-expand-wildcards "~/org/archive/*.org"))))
;         ;; searches both projects and archive directories
;         ;("QA" "Archive tags search" org-tags-view ""
;         ; ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org"))))
;         ;; ...other commands here
;         ("P" "Projects" search ""
;          ((org-agenda-text-search-extra-files (file-expand-wildcards "~/org/projects/*.org"))))
;         )
;       )
; 
                                        ;

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



; (setq daypage-path "~/org/daypages/")
; 
; (defun tom-show-agenda () 
;   (interactive)
;   (delete-other-windows)
;   (org-agenda-list)
;   (calendar) 
;   (other-window 1) 
;   (split-window-vertically) 
;   (other-window 1) 
;   (todays-daypage))
; 
; 
; (require 'org-daypage)
; 


;;;; this put entries into a single file
; ("j" "Journal" entry (file+datetree org-journal-file)
;  "* %?\n\n  %i\n  Time: %U\n  From: %a"
;  :empty-lines 1)
;(defvar org-journal-file (concat org-directory "/journal.org")
;    "Path to OrgMode journal file.")


;; (defun org-journal-find-location ()
;;   ;; Open today's journal, but specify a non-nil prefix argument in order to
;;   ;; inhibit inserting the heading; org-capture will insert the heading.
;;   (org-journal-new-entry t)
;;   ;; Position point on the journal's top-level heading so that org-capture
;;   ;; will add the new entry as a child entry.
;;   (goto-char (point-min)))
;; 
;; (defun get-journal-file-today ()
;;   "Return filename for today's journal entry."
;;   (let ((daily-name (format-time-string "%Y%m%d")))
;;     (expand-file-name (concat org-directory "/journal/" daily-name))))
;; 
;; (defun journal-file-today ()
;;   "Create and load a journal file based on today's date."
;;   (interactive)
;;   (find-file (get-journal-file-today)))
;; 
;; (global-set-key (kbd "C-c f j") 'journal-file-today)
;; 
;; (add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))


(defun org-search () 
  (interactive) 
  (org-refile '(4)))
(define-key global-map "\C-c\C-g" 'org-search)
;; 

; disable SLOW SLOW flyspell
(flyspell-mode -1)
