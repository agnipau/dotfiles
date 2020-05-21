;; -- Misc --

;; Do not show the startup screen
(setq inhibit-startup-screen t)
;; Remove the *scratch* buffer message
(setq initial-scratch-message nil)
;; If using Emacs GUI disable tool bar, menu bar and scroll bar
(when window-system
    (menu-bar-mode -1)
    (toggle-scroll-bar -1)
    (tool-bar-mode -1))

;; Set the font
(set-frame-font "Input Mono Narrow 13" nil t)
;; Enable line numbers
(global-linum-mode t)
;; Highlight the current line
(global-hl-line-mode t)
;; Use `command` as `meta` in MacOS
(setq mac-command-modifier 'meta)

;; Add some space around line numbers
(setq linum-format "  %d ")

;; Set `.emacs_saves` as the backup directory instead of the default
;; backup behaviour
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; Do not use `init.el` for `custom-*` code, use `custom-file.el`
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; --- Packages --

;; `straight.el' boilerplate
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; `use-package' integration for `straight.el'
(straight-use-package 'use-package)

(use-package evil
  :straight t
  :after expand-region
  :init
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-keybinding nil)
  :config
  (dolist (mode '(dired-mode special-mode compilation-mode))
    (add-to-list 'evil-emacs-state-modes mode))
  (evil-mode 1)
  (evil-define-key '(normal visual) 'global
    "H" 'evil-beginning-of-line
    "L" 'evil-end-of-line)
  (require 'expand-region)
  (evil-define-key 'visual 'global
    "J" "3j"
    "K" "3k"
    "v" 'er/expand-region)
  (evil-define-key 'normal 'global
    "  " 'evil-search-forward
    "J" (lambda () (interactive) (evil-next-line 3))
    "K" (lambda () (interactive) (evil-previous-line 3)))
  (evil-define-key 'insert 'global
    (kbd "C-e") (lambda () (interactive) (scroll-up-command 1))
    (kbd "C-y") (lambda () (interactive) (scroll-down-command 1)))
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Q" "q")
  (evil-ex-define-cmd "Wq" "wq")
  (evil-ex-define-cmd "WQ" "wq")
  (evil-ex-define-cmd "Wqa" "wqa")
  (setq evil-emacs-state-modes (delq 'dired-mode evil-emacs-state-modes)))

(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-mc
  :straight t
  :after evil
  :config
  (global-evil-mc-mode 1)
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-j") 'evil-mc-make-and-goto-next-match
    (kbd "C-k") 'evil-mc-make-and-goto-prev-match
    (kbd "C-t") 'evil-mc-make-all-cursors
    (kbd "C-u") 'evil-mc-undo-all-cursors)
  ;; TODO: Non va, scoprire perché
  (evil-define-key 'visual evil-mc-key-map
    "A" #'evil-mc-make-cursor-in-visual-selection-end
    "I" #'evil-mc-make-cursor-in-visual-selection-beg))

(use-package evil-commentary
  :straight t
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package doom-themes
  :straight t
  :hook ((emacs-startup . (lambda () (load-theme 'doom-spacegrey t))))
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p")
    'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p")
    'projectile-command-map))

(use-package editorconfig
  :straight t
  :config
  (editorconfig-mode 1))

(use-package linum-relative
  :straight t
  :config
  (linum-relative-mode))

(use-package emmet-mode
  :straight t
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  ;; Enable Emmet's css abbreviation
  (add-hook 'css-mode-hook  'emmet-mode))

;; TODO: Non va scoprire perché
(use-package hl-todo
  :straight t
  :init
  (setq hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("FIXME"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("GOTCHA" . "#FF4500")
        ("STUB"   . "#1E90FF"))))

(use-package flycheck
  :straight t
  :init (global-flycheck-mode))

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))
(use-package fill-column-indicator
  :straight t
  :config
  (global-fci-mode 1))

(use-package rainbow-mode
  :straight t)

;; --- Languages ---
(load (concat user-emacs-directory "langs.el"))

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c
;; l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :straight t
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :straight t
  :commands lsp-ivy-workspace-symbol)

(use-package dap-mode
  :straight t)

(use-package counsel
  :straight t)

(use-package ivy
  :straight t
  :config
  (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers t))

(use-package ivy-rich
  :straight t
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode 1))

(use-package which-key
  :straight t
  :config
  (which-key-mode 1))

(use-package company
  :straight t
  :bind
  (:map company-active-map
	("C-n" . 'company-select-next)
	("C-p" . 'company-select-previous))
  :config
  (setq company-minimum-prefix-length 1
	;; Delay to show suggestions
        company-idle-delay 0.0)
  ;; Use `company-mode` everywhere
  (global-company-mode t))

(use-package magit
  :straight t
  :bind ("C-x g" . magit-status))

(use-package expand-region
  :straight t)

;; TODO: Find a way to highlight the line after copying it
;; (`kill-ring-save`)
(use-package nav-flash
  :straight t)

(use-package smartparens
  :straight t
  :init
  (add-hook 'js-mode-hook #'smartparens-mode)
  (add-hook 'clojure-mode-hook #'smartparens-mode)
  (add-hook 'cider-repl-mode-hook #'smartparens-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
  (add-hook 'ielm-mode-hook #'smartparens-mode)
  (add-hook 'lisp-mode-hook #'smartparens-mode)
  (add-hook 'lisp-interaction-mode-hook #'smartparens-mode)
  (add-hook 'scheme-mode-hook #'smartparens-mode)
  :config
  (require 'smartparens-config))

