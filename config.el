(use-package emacs
  :preface
  (defvar ian/indent-width 4) ; change this value to your preferred width
  :config
  (setq ;frame-title-format '("Yay-Evil") ; Yayyyyy Evil!
        ;ring-bell-function 'ignore       ; minimise distraction
        frame-resize-pixelwise t
        default-directory "~/")

  (tool-bar-mode -1)
  (menu-bar-mode -1)

  ;; better scrolling experience
  (setq scroll-margin 0
        scroll-conservatively 10000
        scroll-preserve-screen-position t
        auto-window-vscroll nil)

  ;; increase line space for better readability
  (setq-default line-spacing 3)

  ;; Always use spaces for indentation
  (setq-default indent-tabs-mode nil
                tab-width ian/indent-width))

(use-package "startup"
  :ensure nil
  :config (setq inhibit-startup-screen t))

(use-package delsel
  :ensure nil
  :config (delete-selection-mode +1))

(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

(use-package simple
  :ensure nil
  :config (column-number-mode +1))

(use-package "window"
  :ensure nil
  :preface
  (defun ian/split-and-follow-horizontally ()
    "Split window below."
    (interactive)
    (split-window-below)
    (other-window 1))
  (defun ian/split-and-follow-vertically ()
    "Split window right."
    (interactive)
    (split-window-right)
    (other-window 1))
  :config
  (global-set-key (kbd "C-x 2") #'ian/split-and-follow-horizontally)
  (global-set-key (kbd "C-x 3") #'ian/split-and-follow-vertically))

(use-package files
  :ensure nil
  :config
  (setq confirm-kill-processes nil
        make-backup-files nil))

(use-package autorevert
  :ensure nil
  :config
  (global-auto-revert-mode +1)
  (setq auto-revert-interval 2
        auto-revert-check-vc-info t
        global-auto-revert-non-file-buffers t
        auto-revert-verbose nil))

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode
  :config
  (global-eldoc-mode +1)
  (setq eldoc-idle-delay 0.4))

;; C, C++, and Java
(use-package cc-vars
  :ensure nil
  :config
  (setq-default c-basic-offset ian/indent-width)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "k&r"))))

;; JavaScript
(use-package js
  :ensure nil
  :config (setq js-indent-level ian/indent-width))

;; Python (both v2 and v3)
(use-package python
  :ensure nil
  :config (setq python-indent-offset ian/indent-width))

(use-package mwheel
  :ensure nil
  :config (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
                mouse-wheel-progressive-speed nil))

(use-package paren
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))

(use-package frame
  :ensure nil
  :config
  (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (when (member "Menlo" (font-family-list))
    (set-frame-font "menlo-13:weight=regular" t t)))

(use-package ediff
  :ensure nil
  :config (setq ediff-split-window-function 'split-window-horizontally))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))

(use-package dired
  :ensure nil
  :config
  (setq delete-by-moving-to-trash t)
  (eval-after-load "dired"
    #'(lambda ()
        (put 'dired-find-alternate-file 'disabled nil)
        (define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file))))

(use-package cus-edit
  :ensure nil
  :config
  (setq custom-file "~/.emacs.d/to-be-dumped.el"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'wilmersdorf t)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo
        dashboard-banner-logo-title "Yay Evil!"
        dashboard-items nil
        dashboard-set-footer nil))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(use-package highlight-operators
  :hook (prog-mode . highlight-operators-mode))

(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

;; (use-package evil
;;   :diminish undo-tree-mode
;;   :init
;;   (setq evil-want-C-u-scroll t)
;;   (setq evil-shift-width ian/indent-width)
;;   :config
;;   (evil-mode +1)
;;   (with-eval-after-load 'evil-maps ; avoid conflict with company tooltip selection
;;     (define-key evil-insert-state-map (kbd "C-n") nil)
;;     (define-key evil-insert-state-map (kbd "C-p") nil))
;;   (evil-set-initial-state 'term-mode 'emacs)
;;   (defun ian/save-and-kill-this-buffer ()
;;     (interactive)
;;     (save-buffer)
;;     (kill-this-buffer))
;;   (evil-ex-define-cmd "q" 'kill-this-buffer)
;;   (evil-ex-define-cmd "wq" 'ian/save-and-kill-this-buffer)
;;   (use-package evil-commentary
;;     :after evil
;;     :diminish evil-commentary-mode
;;     :config (evil-commentary-mode +1)))

(use-package evil-magit)

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))

(use-package ido
  :config
  (ido-mode +1)
  (setq ido-everywhere t
        ido-enable-flex-matching t))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package ido-completing-read+ :config (ido-ubiquitous-mode +1))

(use-package flx-ido :config (flx-ido-mode +1))

(use-package company
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-frontends '(company-pseudo-tooltip-frontend ; show tooltip even for single candidate
                            company-echo-metadata-frontend))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))

(use-package flycheck :config (global-flycheck-mode +1))

(use-package org
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode)))

(use-package org-bullets :hook (org-mode . org-bullets-mode))

(use-package yasnippet-snippets
  :config
  (yas-global-mode +1)
  (advice-add 'company-complete-common
              :before
              (lambda ()
                (setq my-company-point (point))))
  (advice-add 'company-complete-common
              :after
              (lambda ()
                (when (equal my-company-point (point))
                  (yas-expand)))))

(use-package markdown-mode :hook (markdown-mode . visual-line-mode))

(use-package json-mode)

(use-package diminish
  :demand t)

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.4))

(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
            (exec-path-from-shell-initialize)))

(use-package prescient
    :config
    (prescient-persist-mode +1)
    (ivy-prescient-mode +1)
    (company-prescient-mode +1)
)

(use-package ivy
    :config
    (ivy-mode +1)
    (counsel-mode +1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (setq ivy-initial-inputs-alist nil)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    ;; (global-set-key (kbd "M-x") 'counsel-M-x)
    ;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    ;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
    ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    ;; (global-set-key (kbd "C-c g") 'counsel-git)
    ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
    ;; (global-set-key (kbd "C-c k") 'counsel-ag)
    ;; (global-set-key (kbd "C-x l") 'counsel-locate)
    ;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
)

(use-package mac-pseudo-daemon
  :config
  (mac-pseudo-daemon-mode +1)
)

;; (defadvice handle-delete-frame (around my-handle-delete-frame-advice activate)
;; "Hide Emacs instead of closing the last frame"
;; (let ((frame   (posn-window (event-start event)))
;;       (numfrs  (length (frame-list))))
;;   (if (> numfrs 1)
;;     ad-do-it
;;      (do-applescript "tell application \"System Events\" to tell process \"Emacs\" to set visible to false"))))
