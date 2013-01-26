;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Planner-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; These are the paths to the Planner-mode libraries
;(add-to-list 'load-path "~/elisp/planner")
;; These are the commands to load the various parts of planner
(require 'planner)
(require 'muse-wiki)
(require 'muse-colors)
;(require 'planner-publish)
;(require 'planner-multi)
(planner-calendar-insinuate)
; Prevents planner from opening a split window on various commands
(setq planner-use-other-window nil)
; This command is not technically part of Planner, but it's here for
; sanity's sake
(setq diary-file "~/plans/.diary")
;; This command forces newly created tasks to the end of the first
;; task block (http://www.emacswiki.org/cgi-bin/wiki/PlannerModeMethods)
;(setq planner-add-task-at-end-flag t)
(setq muse-wiki-allow-nonexistent-wikiword t)

;(autoload 'planner-tasks-overview "planner-tasks-overview" t)
;;(require 'planner-tasks-overview)

(setq planner-project "WikiPlanner")
(setq muse-project-alist
      '(
       ("WikiPlanner"
        ("~/plans"
         :default "WelcomePage"
         :major-mode planner-mode
         :visit-link planner-visit-link)
;        (:base "planner-html"
;         (:base "xhtml"
;         :path "~/public_html/Plans")
;        )
       )))
;)
;      '("blog"
;       ("~/blog" :default "index")
;       (:base "xhtml" :path "~/public_html/xhtml")
;       (:base "pdf" :path "~/public_html/pdf")
;       )
;      )

(defun planner-day-template ()
  "Build a new day page."
  (interactive)
  (insert "* Tasks\n** In-Progress\n\n\n** Completed\n\n\n* Notes\n\n"))

(setq planner-day-page-template 'planner-day-template)

;; Planner-mode global keybindings
(global-set-key "\C-c\C-n" 'planner-goto-today)
(global-set-key "\C-c\C-o" 'planner-goto-plan-page)

(add-hook 'planner-mode-hook 'org-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; maybe graveyard?

;(add-to-list 'load-path "~/lib/emacs/emacs-wiki/")
;(add-to-list 'load-path "~/lib/emacs/planner/")
;(require 'emacs-wiki)


;(setq planner-project "WikiPlanner")

;(setq mark-diary-entries-in-calendar t)
;(define-key mode-specific-map [?n] 'planner-goto-today)
;(define-key mode-specific-map [?n] 'planner-create-note-from-task)

;(define-key mode-specific-map [?\M-r] 'remember)

;; Use some extra keybindings (that should be default)
;(planner-install-extra-context-keybindings)
;;(planner-install-extra-task-keybindings)
;;(planner-install-extra-note-keybindings)

;(setq planner-add-task-at-end-flag t)


;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Muse-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/elisp/muse/lisp")
(add-to-list 'load-path "~/site/lisp/muse")
(require 'muse)
(require 'muse-mode)
(require 'muse-colors)
(require 'muse-project)
(require 'muse-blosxom)
(require 'muse-html)
(require 'muse-latex)
(setq muse-xhtml-headline "Handyman's Toolbox")
;(setq muse-xhtml-style-sheet "<link rel=stylesheet href=\"core.css\" type=\"text/css\">")
(require 'muse-backlink)
(muse-backlink-install)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Planner-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; These are the paths to the Planner-mode libraries
;(add-to-list 'load-path "~/elisp/planner")
;; These are the commands to load the various parts of planner
;(require 'planner)
;(require 'muse-wiki)
;(require 'muse-colors)
;(require 'planner-publish)
;(require 'planner-multi)
;(planner-calendar-insinuate)
; Prevents planner from opening a split window on various commands
;(setq planner-use-other-window nil)
; This command is not technically part of Planner, but it's here for sanity's sake
;(setq diary-file "~/Plans/.diary")
;; This command forces newly created tasks to the end of the first task block (http://www.emacswiki.org/cgi-bin/wiki/PlannerModeMethods)
;(setq planner-add-task-at-end-flag t)
;(setq muse-wiki-allow-nonexistent-wikiword t)

;(autoload 'planner-tasks-overview "planner-tasks-overview" t)
;;(require 'planner-tasks-overview)

;(setq planner-project "WikiPlanner")
;(setq muse-project-alist
;      '(
;	("WikiPlanner"
;	 ("~/Plans"
;	  :default "WelcomePage"
;	  :major-mode planner-mode
;	  :visit-link planner-visit-link)
;	 (:base "planner-html"
;         (:base "xhtml"
;	  :path "~/public_html/Plans")
;	 )
;	)
;)
;      '("blog"
;	("~/blog" :default "index")
;	(:base "xhtml" :path "~/public_html/xhtml")
;	(:base "pdf" :path "~/public_html/pdf")
;	)
;      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Planner-mode modules configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'planner-id)
;(setq planner-id-tracking-file "~/Plans/.planner-id")

;(autoload 'planner-trunk-tasks "planner-trunk" t)   ;;(require 'planner-trunk)
;(add-hook 'planner-mode-hook 'planner-trunk-tasks)
;(setq planner-trunk-rule-list
;      (quote (("\\`[0-9][0-9][0-9][0-9]\\.[0-9][0-9]\\.[0-9][0-9]\\'" "Completed Tasks"
;	 (
;	  ("@work" "[[@work]]")
;	  ("@home" "[[@home]]")
;	  ("@any" "[[@any]]")
;	  ("@calls" "[[@calls]]")
;	  ("@computer" "[[@computer]]")
;	  ("@errands" "[[@errands]]")
;	  ("@email" "[[@email]]")
;	  ("@meetings" "[[@meetings]]")
;)))))


;; diary config from http://www.gnu.org/software/emacs/manual/html_node/emacs/Fancy-Diary-Display.html#Fancy-Diary-Display
;(require 'planner-diary)
;(setq planner-diary-use-diary t)
;(setq planner-diary-number-of-days 4)
;(planner-diary-insinuate)
;(add-hook 'diary-display-hook 'fancy-diary-display)
;(add-hook 'list-diary-entries-hook 'sort-diary-entries t)
;(add-hook 'list-diary-entries-hook 'include-other-diary-files)
;(add-hook 'mark-diary-entries-hook 'mark-included-diary-files)

;(require 'planner-cyclic)
;;(setq planner-cyclic-diary-file (concat (planner-directory) "/cyclic_tasks"))
;(setq planner-cyclic-diary-file "~/Plans/.diary.cyclic")
;(setq planner-cyclic-diary-nag nil)

;(autoload 'planner-deadline-update "planner-deadline" t)   ;;(require 'planner-deadline)
;(add-hook 'planner-goto-hook 'planner-deadline-update)

;(require 'planner-rank)
;;(autoload 'planner-rank-change "planner-rank" t)
;(setq planner-sort-tasks-key-function 'planner-sort-tasks-by-rank)

; from http://johnsu01.livejournal.com/129543.html, but i changed it a little
;(defun dyd/planner-list-contexts ()
;  "Insert links at point for all planner pages whose names start with @."
;  (interactive)
;  (let* ((planner-list (muse-project-file-alist planner-project))
;         (contexts
;          (delq nil
;                (mapcar
;                 (λ (page)
;                   (if (string-match "^@" (car page)) (car page)))
;                 planner-list))))
;    (mapc
;     (λ (context)
;       (insert (planner-make-link context) "  "))
;     contexts)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Planner-mode functions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; These next two commands change the template used for creating new day pages
;; N.B.- there is a similar function here: http://www.emacswiki.org/cgi-bin/wiki/PlannerRecipes
;(defun planner-daily-template ()
;  "Build a new daily planner page."
;  (interactive)
;  (let ((cur (planner-get-current-date-filename))
;        (today (planner-today))
;	(year (string-to-number (substring (planner-get-current-date-filename) 0 4)))
;	(month (string-to-number (substring (planner-get-current-date-filename) 5 7)))
;	(day (string-to-number (substring (planner-get-current-date-filename) 8 10))))
;    (planner-timewarp cur)
;    (insert
;     (format
;      "* %s | [[WelcomePage][%s]] | %s\n\n"
;      (planner-yesterday)
;      (format-time-string "%A, %B %d, %Y" (encode-time 00 00 00 day month year))
;      (planner-tomorrow)))
;    (insert "Personal Info: [[Projects]] | WaitingFor | SomedayMaybe | [[Reference]]\n")
;    (insert "Contexts: ")
;    (dyd/planner-list-contexts)
;    (insert "\n\n")
;    (insert "* Tasks\n\n\n")
;    (insert "* Diary\n\n\n")
;    (insert "* Schedule\n\n\n")
;    (insert "* Calls\n\n\n")
;    (insert "* Notes\n\n")
;    (planner-timewarp today)))

;(setq planner-day-page-template 'planner-daily-template)

(defun planner-plan-template ()
  "Build a new plan page."
  (interactive)
  (insert "* Objective\n\n\n* Tasks\n\n\n* Links\n\n\n* Notes\n\n"))

;(setq planner-plan-page-template 'planner-plan-template)

; This function modifies the default planner-fix-tasks function to include the planner-trunk-tasks function call
;(defun planner-fix-tasks ()
;  "Sort, renumber and align tasks."
;  (interactive)
;  (planner-trunk-tasks)
;  (planner-sort-tasks)
;  (planner-enumber-tasks)
;  (planner-align-tasks))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remember-mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/elisp/remember/")
;(require 'remember)
;(require 'remember-planner)
;(setq remember-handler-functions '(remember-planner-append))
;(setq remember-annotation-functions planner-annotation-functions)
;; from http://www.emacswiki.org/cgi-bin/wiki/PlannerModeMethods
;(setq remember-append-to-planner-hook
;          '(remember-planner-add-timestamp remember-planner-add-xref))

;; Planner-mode global keybindings
;(global-set-key "\C-c\C-n" 'planner-goto-today)
;(global-set-key "\C-c\C-o" 'planner-goto-plan-page)
;(global-set-key "\C-c\C-k" 'planner-create-note-from-task)
;(global-set-key [?\C-c ?\C-t] 'planner-create-task-from-buffer)
;(global-set-key "\C-c\C-y" 'planner-fix-tasks)

;; Remember-mode global keybinding
;(global-set-key "\C-c\C-r" 'remember)
