;;; init.el --- My Emacs config file

;;; Commentary:
;;; My Emacs config file.

;;; Code:

;; -- Misc --

(setq create-lockfiles nil)
(setq inhibit-x-resources t)
;; Start emacs in *scratch* buffer.
(setq inhibit-startup-screen t)
;; Remove the *scratch* buffer message.
(setq initial-scratch-message nil)

(defun agnipau/emacs-look-and-feel ()
  "Disable various UI widgets that I don't need."
  (interactive)
  (menu-bar-mode 0)
  (toggle-scroll-bar 0)
  (tool-bar-mode 0)
  (blink-cursor-mode 0))
(add-hook 'window-setup-hook #'agnipau/emacs-look-and-feel)
(add-hook 'after-make-frame-functions
          #'(lambda (frame)
              (select-frame frame)
              (agnipau/emacs-look-and-feel)))

(defmacro agnipau/set-fonts (&rest sexpr)
  "Macro to allow easier declaration of fonts."
  `(custom-set-faces
    ,@(mapcar (lambda (x) `(quote (,(car x) ((t ,(cdr x))))))
              sexpr)))

;; ;; Set default, fixed and variable pitch fonts.
;; (agnipau/set-fonts
;;  (default :family "JetBrains Mono" :weight normal :height 112 :width normal)
;;  (fixed-pitch :family "JetBrains Mono" :weight normal :height 112 :width normal)
;; ;;  (default :family "Input Mono Narrow" :weight normal :height 112 :width normal)
;; ;;  (fixed-pitch :family "Input Mono Narrow" :weight normal :height 112 :width normal)
;;  (variable-pitch :family "Product Sans" :weight normal :height 120 :width normal))

;; Better mouse scroll behaviour.
(setq mouse-wheel-scroll-amount '(4 ((shift) . 4) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
;; Select window on mouse hover.
(setq mouse-autoselect-window t)
;; Enable horizontal scroll from trackpad or via tilting the mouse
;; wheel.
(setq mouse-wheel-tilt-scroll t)

;; Highlight current line.
(global-hl-line-mode 1)

;; Line numbers.
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Set `.emacs_saves` as the backup directory instead of the default backup
;; behaviour.
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs_saves"))))
;; Do not use `init.el` for `custom-*` code, use `custom-file.el`.
(setq custom-file (expand-file-name "~/.emacs.d/custom-file.el"))
(unless (file-exists-p custom-file)
  (write-region nil nil custom-file))
(load-file custom-file)

;; -- External packages --

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; `use-package' integration for `straight.el'.
(straight-use-package 'use-package)

(use-package expand-region
  :straight t)

;; (use-package fill-column-indicator
;;   :straight t
;;   :after anirak-theme
;;   :config
;;   (define-global-minor-mode agnipau/global-fci-mode fci-mode
;;     (lambda ()
;;       (unless (derived-mode-p 'help-mode 'debugger-mode 'vterm-mode
;;                               'eshell-mode)
;;         (fci-mode 1))))

;;   (agnipau/global-fci-mode))

(use-package evil
    :straight t
    :after expand-region
    :init
    (setq evil-want-keybinding nil)
    (setq evil-want-Y-yank-to-eol t)
    (setq evil-insert-state-message nil)
    (setq evil-visual-state-message nil)
    (setq evil-replace-state-message nil)
    :config
    ;; Enable `evil' in all buffers.
    (evil-mode 1)

    (evil-define-key '(normal visual) 'global
      "H" #'evil-beginning-of-line
      "L" #'evil-end-of-line
      (kbd "C-j") #'evil-join)

    (require 'expand-region)
    (evil-define-motion evil-next-3-visual-lines ()
      (evil-next-visual-line 3))
    (evil-define-motion evil-previous-3-visual-lines ()
      (evil-previous-visual-line 3))
    (evil-define-motion evil-comment-or-uncomment-region (beg end &optional arg)
      (comment-or-uncomment-region beg end arg))
    (evil-define-key 'visual 'global
      "J" #'evil-next-3-visual-lines
      "K" #'evil-previous-3-visual-lines
      "v" #'er/expand-region)

    (evil-define-motion evil-next-3-lines ()
      (evil-next-visual-line 3))
    (evil-define-motion evil-previous-3-lines ()
      (evil-previous-visual-line 3))
    (evil-define-motion evil-comment-line (n)
      (comment-line n))
    (evil-define-key 'normal 'global
      "J" #'evil-next-3-lines
      "K" #'evil-previous-3-lines)

    (evil-define-key 'insert 'global
      (kbd "C-e") #'(lambda () (interactive) (scroll-up-command 1))
      (kbd "C-y") #'(lambda () (interactive) (scroll-down-command 1)))

    (evil-ex-define-cmd "W" "w"))

;; (use-package evil-collection
;;   :straight t
;;   :after evil
;;   :config
;;   (evil-collection-init))

(use-package evil-goggles
  :straight t
  :after evil
  :config
  (setq evil-goggles-enable-delete nil)
  (setq evil-goggles-enable-change nil)
  ;; TODO: See if these should be uncommented.
  ;; (setq evil-goggles-enable-join nil)
  ;; (setq evil-goggles-enable-replace-with-register nil)
  ;; (setq evil-goggles-enable-fill-and-move nil)
  ;; (setq evil-goggles-enable-set-marker nil)
  (evil-goggles-mode))

(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-exchange
  :straight t
  :after evil
  :config
  (evil-exchange-install))

(use-package evil-numbers
  :straight t
  :after (evil hydra)
  :config
  (defhydra hydra-evil-numbers ()
    "evil-numbers"
    ("k" #'evil-numbers/inc-at-pt "increment number at point")
    ("j" #'evil-numbers/dec-at-pt "decrement number at point")))

(use-package evil-visualstar
  :straight t
  :after evil
  :config
  (setq evil-visualstar/persistent t)
  (global-evil-visualstar-mode))

(use-package editorconfig
  :straight t
  :config
  (editorconfig-mode 1))

(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package magit
  :straight t
  :bind ("C-x g" . magit-status))

(use-package forge
  :straight t
  :after magit)

(use-package hl-todo
  :straight t
  :after anirak-theme
  :config
  (setq hl-todo-highlight-punctuation ":")
  (global-hl-todo-mode))

(use-package magit-todos
  :straight t
  :after (magit hl-todo))

(use-package hydra
  :straight t
  :config
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("k" #'text-scale-increase "in")
    ("j" #'text-scale-decrease "out")
    ("r" #'(lambda () (interactive) (text-scale-set 0)) "reset")))

(use-package yasnippet
  :straight t
  :config
  (yas-global-mode 1))

(use-package company
  :straight t
  :after yasnippet
  :commands company-mode
  :hook ((after-init . global-company-mode))
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :config
  (add-to-list 'company-backends 'company-yasnippet t)
  (setq company-minimum-prefix-length 1
        ;; Delay to show suggestions.
        company-idle-delay 0.00
        company-global-modes '(not shell-mode not eshell-mode)
        company-tooltip-align-annotations t))

(use-package company-box
  :straight t
  :after company
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :straight t
  :config
  (define-fringe-bitmap 'flycheck-fringe-bitmap-nil [])
  (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
        [#b00000000
         #b00000000
         #b00000000
         #b00000000
         #b00000000
         #b00000000
         #b00000000
         #b00011100
         #b00111110
         #b00111110
         #b00111110
         #b00011100
         #b00000000
         #b00000000
         #b00000000
         #b00000000
         #b00000000])
  (flycheck-define-error-level 'error
    :severity 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-nil
    :fringe-face 'flycheck-fringe-error)
  (flycheck-define-error-level 'warning
    :severity 1
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-nil
    :fringe-face 'flycheck-fringe-warning)
  (flycheck-define-error-level 'info
    :severity 0
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-nil
    :fringe-face 'flycheck-fringe-info)
  (global-flycheck-mode))

(use-package rainbow-mode
  :straight t
  :config
  (defun agnipau/toggle-rainbow-mode ()
    "Helper function to toggle `rainbow-mode'."
    (interactive)
    (if (get 'agnipau/toggle-rainbow-mode 'enabled)
        (progn
          (global-hl-line-mode 1)
          (rainbow-mode 0)
          (put 'agnipau/toggle-rainbow-mode 'enabled nil))
      (progn
        (global-hl-line-mode 0)
        (rainbow-mode 1)
        (put 'agnipau/toggle-rainbow-mode 'enabled t)))))

;; TODO: Add bindings
(use-package kurecolor
  :straight t)

(use-package gist
  :straight t)

(use-package vterm
  :straight t)

(use-package evil-commentary
  :straight t
  :after evil
  :config
  (evil-commentary-mode))

(use-package helpful
  :straight t
  :config
  ;; Note that the built-in `describe-function' includes both
  ;; functions and macros. `helpful-function' is functions only, so we
  ;; provide `helpful-callable' as a drop-in replacement.
  (global-set-key (kbd "C-h f") #'helpful-callable)

  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)

  ;; Lookup the current symbol at point. C-c C-d is a common
  ;; keybinding for this in lisp modes.
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)

  ;; Look up *F*unctions (excludes macros).
  ;;
  ;; By default, C-h F is bound to
  ;; `Info-goto-emacs-command-node'. Helpful already links to the
  ;; manual, if a function is referenced there.
  (global-set-key (kbd "C-h F") #'helpful-function)

  ;; Look up *C*ommands.
  ;;
  ;; By default, C-h C is bound to describe
  ;; `describe-coding-system'. I don't find this very useful, but it's
  ;; frequently useful to only look at interactive functions.
  (global-set-key (kbd "C-h C") #'helpful-command))

(use-package elisp-demos
  :straight t
  :config
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

(use-package ivy
  :straight t
  :config
  (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t))

(use-package swiper
  :straight t
  :after (ivy evil))

(use-package evil-mc
  :straight t
  :after evil
  :config
  (global-evil-mc-mode 1))

(use-package counsel
  :straight t
  :after (ivy helpful)
  :init
  ;; Faster search with ripgrep.
  (setq counsel-grep-base-command
        "rg -i -M 120 --no-heading --line-number --color never %s %s")
  :config
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable))

(use-package anirak-theme
  :straight (anirak-theme :local-repo "~/progetti/anirak-theme.el")
  :config
  (load-theme 'anirak t)

;; (use-package anirak-theme
;;   :straight (anirak-theme :type git :host github :repo "agnipau/anirak-theme.el")
;;   :config
;;   (load-theme 'anirak t)

  (defun agnipau/toggle-theme ()
    "Toggle dark and light Anirak theme."
    (interactive)
    (if (get 'agnipau/toggle-theme 'is-light)
        (progn
          (load-theme 'anirak t)
          ;; Needed to refresh fci color
          (agnipau/global-fci-mode)
          (put 'agnipau/toggle-theme 'is-light nil))
      (progn
        (load-theme 'anirak-light t)
        ;; Needed to refresh fci color
        (agnipau/global-fci-mode)
        (put 'agnipau/toggle-theme 'is-light t)))))

;; (use-package solarized-theme
;;   :straight t
;;   :config
;;   (load-theme 'solarized-dark t))

(use-package minions
  :straight t
  :config
  (setq-default
   ;; TODO: It would be cooler to right align some items but Emacs
   ;; doesn't have a builtin way to do this so the only way would be
   ;; to compute some padding every time but it adds a lot of overhead
   ;; for nothing.
   mode-line-format
   `(,mode-line-front-space
     (:eval (propertize "%b" 'face nil
                        'help-echo (buffer-file-name)))
     "  "
     ,minions-mode-line-modes
     " "
     (:eval
      (let ((eol (coding-system-eol-type buffer-file-coding-system)))
        (propertize
         (pcase eol
           (0 "LF")
           (1 "CRLF")
           (2 "CR")
           (_ ""))
         'face nil
         'mouse-face nil
         'help-echo (format "End-of-line style: %s\nmouse-1: Cycle"
                            (pcase eol
                              (0 "Unix-style LF")
                              (1 "DOS-style CRLF")
                              (2 "Mac-style CR")
                              (_ "Undecided")))
         'local-map (let ((map (make-sparse-keymap)))
                      (define-key map [mode-line mouse-1] 'mode-line-change-eol)
                      map))))
     "  "
     (:eval
      (propertize
       (let ((sys (coding-system-plist buffer-file-coding-system)))
         (cond ((memq (plist-get sys :category)
                      '(coding-category-undecided coding-category-utf-8))
                "UTF-8")
               (t (upcase (symbol-name (plist-get sys :name))))))
       'face nil
       'mouse-face nil
       'help-echo 'mode-line-mule-info-help-echo
       'local-map mode-line-coding-system-map))
     ;; "  "
     ;; (:eval (propertize
     ;;         (format "%%l:%%c / %d" (count-lines (point-min) (point-max)))
     ;;         'face nil 'help-echo (format-mode-line "%q")))
     ,mode-line-end-spaces)))

;; -- Not sure --

;; TODO: See if really necessary.
(use-package projectile
  :straight t
  :init
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path `(,(expand-file-name "~/progetti")))
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package evil-snipe
  :straight t
  :after evil
  :config
  ;; Override f, F, t and T.
  (evil-snipe-override-mode 1))

(use-package quickrun
  :straight t)

;; NOTE: See if there are better non-evil alternatives
(use-package evil-lion
  :straight t
  :after evil
  :config
  (evil-lion-mode))

;; -- Integrated packages ---

(use-package composite
  :defer t
  :config
  (defvar agnipau/prog-ligatures-modes '(not org-mode)
    "List of major modes in which ligatures should be enabled.
If t, enable it everywhere. Fundamental mode, and modes derived from special-mode,
comint-mode, eshell-mode and term-mode are *still* excluded.
If the first element is 'not, enable it in any mode besides what is listed.
If nil, fallback to the prettify-symbols based replacement (add +font features to pretty-code).")

  ;; --> // /** /* */ <!-- := ->> <<- -> <- <=> == != <= >= =:= !== &&
  ;; &&& || ... .. /// === ++ -- => |> <| ||> <|| |||> <|||::= |] [| |}
  ;; {| [< >] :?> :? /= [||] !! ?: ?. :: +++ ?? ## ### #### ::: .? ?= =!=
  ;; <|> <: :< :> >: <> *** ;; /== .= .- __ =/= <-< <<< >>> <=< <<= <==
  ;; <==> ==> =>> >=> >>= >>- >- <~> -< -<< << --- <-| <=| \ \/ |=> |->
  ;; <~~ <~ ~~ ~~> ~> <$> <$ $> <+> <+ +> <*> <* *> </ </> /> <-> ..< ~=
  ;; ~- -~ ~@ ^= -| _|_ |- ||- |= ||= #{ #[ ]# #( #? #_ #_( #: #! #=

  ;; Automatic font-specific ligatures.
  (defvar agnipau/prog-ligatures-alist
    `((?!  . ,(regexp-opt '("!!" "!=" "!==")))
      (?#  . ,(regexp-opt '("##" "###" "####" "#{" "#[" "#(" "#?" "#_" "#_(" "#:" "#!" "#=")))
      (?$  . ,(regexp-opt '("$>")))
      (?&  . ,(regexp-opt '("&&" "&&&")))
      (?*  . ,(regexp-opt '("*/" "***" "*>")))
      (?+  . ,(regexp-opt '("++" "+++" "+>")))
      (?-  . ,(regexp-opt '("-->" "->>" "->" "--" "---" "-<" "-<<" "-~" "-|")))
      (?.  . ,(regexp-opt '(".." "..." ".?" ".=" ".-" "..<")))
      (?/  . ,(regexp-opt '("//" "/**" "/*" "///" "/=" "/==" "/>")))
      (?:  . ,(regexp-opt '(":=" "::=" ":?>" ":?" "::" ":::" ":<" ":>")))
      ;; NOTE: JetBrains Mono doesn't have ligatures for ;;; but
      ;; including that anyway has the great effect of not applying
      ;; the ;; ligature only to the first two characters.
      (?\; . ,(regexp-opt '(";;" ";;;")))
      (?<  . ,(regexp-opt '("<!--" "<<-" "<-" "<=>" "<=" "<|" "<||" "<|||" "<|>" "<:" "<>" "<-<" "<<<" "<=<" "<<=" "<==" "<==>" "<~>" "<<" "<-|" "<=|" "<~~" "<~" "<$>" "<$" "<+>" "<+" "<*>" "<*" "</" "</>" "<->")))
      (?=  . ,(regexp-opt '("==" "=:=" "===" "=>" "=!=" "=/=" "==>" "=>>")))
      (?>  . ,(regexp-opt '(">=" ">]" ">:" ">>>" ">=>" ">>=" ">>-" ">-")))
      (??  . ,(regexp-opt '("?:" "?." "??" "?=")))
      (?\[ . ,(regexp-opt '("[|" "[<" "[|" "[||]")))
      (?\] . ,(regexp-opt '("]#")))
      (?\\ . ,(regexp-opt '("\\/")))
      (?^  . ,(regexp-opt '("^=")))
      (?{  . ,(regexp-opt '("{|")))
      (?|  . ,(regexp-opt '("||" "|>" "||>" "|||>" "|]" "|}" "|=>" "|->" "|-" "||-" "|=" "||=")))
      (?_  . ,(regexp-opt '("__" "_|_")))
      (?~  . ,(regexp-opt '("~~" "~~>" "~>" "~=" "~-" "~@"))))
    "An alist of all ligatures used by `agnipau/prog-ligatures-modes'.
The car is the character ASCII number, cdr is a regex which will call
`font-shape-gstring' when matched.
Because of the underlying code in :ui pretty-code module, the regex should match
a string starting with the character contained in car.
This variable is used only if you built Emacs with Harfbuzz on a version >= 28")

  (defun agnipau/pretty-code-init-ligatures-h ()
    "Enable ligatures.
If in fundamental-mode, or a mode derived from special, comint, eshell or term
modes, this function does nothing.
Otherwise it sets the buffer-local composition table to a composition table enhanced with
`agnipau/prog-ligatures-alist' ligatures regexes."
    (unless (or (eq major-mode 'fundamental-mode)
                (eq (get major-mode 'mode-class) 'special)
                (derived-mode-p 'comint-mode 'eshell-mode 'term-mode))
      (when (or (eq agnipau/prog-ligatures-modes t)
                (if (eq (car agnipau/prog-ligatures-modes) 'not)
                    (not (memq major-mode (cdr agnipau/prog-ligatures-modes)))
                  (memq major-mode agnipau/prog-ligatures-modes)))
        (setq-local composition-function-table composition-ligature-table))))

  (defvar composition-ligature-table (make-char-table nil))

  (dolist (char-regexp agnipau/prog-ligatures-alist)
    (set-char-table-range composition-ligature-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring])))
  (set-char-table-parent composition-ligature-table composition-function-table)

  (add-hook 'after-change-major-mode-hook #'agnipau/pretty-code-init-ligatures-h))

(use-package elec-pair
  :config
  (electric-pair-mode 1))

(use-package paren
  :config
  (show-paren-mode 1))

(use-package whitespace
  :config
  (setq whitespace-display-mappings
        '(;; 183 -> ·
          (space-mark 32 [183] [46])
          (space-mark 160 [164] [95])
          ;; 172  -> ¬
          (newline-mark 10 [172 10])
          ;; 8594 -> →
          (tab-mark 9 [8594 9] [92 9])))

  (define-global-minor-mode agnipau/global-whitespace-mode whitespace-mode
    (lambda ()
      (unless (derived-mode-p 'debugger-mode 'vterm-mode 'eshell-mode)
        (whitespace-mode))))

  (defun agnipau/refresh-hidden-chars ()
    "Refresh the hidden chars mode."
    (interactive)
    (agnipau/global-whitespace-mode 0)
    (agnipau/global-whitespace-mode 1))

  (defun agnipau/toggle-hidden-chars (&optional show)
    "Toggle the display of hidden characters.

If SHOW is positive enable hidden chars, if negative disable hidden chars."
    (interactive)
    (if (or (and (eq nil show) (get 'agnipau/toggle-hidden-chars 'enabled))
           (and (not (eq nil show)) (< show 1)))
        (progn
          (setq whitespace-style '(face tabs tab-mark trailing))
          (put 'agnipau/toggle-hidden-chars 'enabled nil)
          (agnipau/refresh-hidden-chars))
      (progn
        (setq whitespace-style '(face newline newline-mark spaces space-mark
                                      tabs tab-mark))
        (put 'agnipau/toggle-hidden-chars 'enabled t)
        (agnipau/refresh-hidden-chars))))

  (agnipau/toggle-hidden-chars 0))

(use-package recentf
  :bind ("C-x C-r" . counsel-recentf)
  :config
  (recentf-mode 1)
  ;; Every five minutes update recentf list.
  (run-at-time nil (* 5 60) #'recentf-save-list)
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25))

;; -- Programming languages ---

(load (concat user-emacs-directory "langs"))

;; -- Keybindings --

(load (concat user-emacs-directory "bindings"))

;;; init.el ends here
