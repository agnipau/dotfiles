;;; langs.el --- Configuration for LSP and various programming languages

;;; Commentary:
;;; Configuration for LSP and various programming languages.

;;; Code:

(defun agnipau/lsp-actions-on-save ()
  "Add hooks to format and organize imports on save."
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))


(use-package typescript-mode
  :straight t
  :mode
  (("\\.ts\\'" . typescript-mode)
   ("\\.tsx\\'" . typescript-mode))
  :config
  (setq typescript-mode-hook '(lsp-deferred)))

(use-package web-mode
  :straight t
  :mode (("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)))

(use-package prettier-js
  :straight t
  :after web-mode
  :config
  (add-hook 'web-mode-hook #'prettier-js-mode))


(use-package js
  :mode
  (("\\.js\\'" . js-mode)
   ("\\.jsx\\'" . js-mode))
  :config
  (defun agnipau/js-lsp-deferred ()
    "Activate LSP only when dealing with JS files, not JSON files."
    (unless (string-match  "\\.json$" (buffer-name))
      (lsp-deferred)))
  (defun agnipau/js-mode-bindings ()
    "Sets a hotkey for using the json-snatcher plugin."
    (when (string-match  "\\.json$" (buffer-name))
      (local-set-key (kbd "C-c C-g") 'jsons-print-path)))

  (add-hook 'js-mode-hook 'agnipau/js-lsp-deferred)
  (add-hook 'js-mode-hook #'agnipau/lsp-actions-on-save))


(use-package json-snatcher
  :straight t
  :config
  (add-hook 'js-mode-hook 'agnipau/js-mode-bindings))

(use-package counsel-jq
  ;; NOTE: This package uses swiper so it must be loaded after it.
  :after swiper
  :straight t)


(use-package lsp-mode
  :straight t
  :commands (lsp lsp-deferred)
  :after typescript-mode
  :init
  (setq lsp-keymap-prefix (kbd "C-c l"))
  :custom
  ;; 100MB
  (gc-cons-threshold 100000000)
  ;; Size in bytes: 1024b = 1k, 1k * 1024 = 1mb
  (read-process-output-max (* 1024 1024))
  :hook ((sh-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui
  :straight t
  :after (lsp-mode anirak-theme)
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :straight t
  :after (lsp-mode ivy)
  :commands lsp-ivy-workspace-symbol)


(use-package lsp-python-ms
  :straight t
  :init
  (setq lsp-python-ms-executable
        (expand-file-name "~/dev/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))
  :hook
  (python-mode . (lambda ()
                 (require 'lsp-python-ms)
                 (lsp-deferred))))


(use-package rustic
  :straight t
  :after (flycheck anirak-theme)
  :config
  (setq rustic-lsp-server 'rust-analyzer)
  (push 'rustic-clippy flycheck-checkers))


(use-package csharp-mode
  :straight t)

(use-package omnisharp
  :straight t
  :after (company flycheck)
  :init
  (setq omnisharp-server-executable-path (expand-file-name "~/dev/omnisharp/run"))
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  ;; Company integration
  (eval-after-load
   'company
   '(add-to-list 'company-backends 'company-omnisharp))
  (add-hook 'csharp-mode-hook #'company-mode)
  ;; Flycheck integration
  (add-hook 'csharp-mode-hook #'flycheck-mode))


;; FIXME: Syntax highlighting is broken
(use-package yaml-mode
  :straight t
  :mode
  (("\\.yml\\'" . yaml-mode)
   ("\\.yaml\\'" . yaml-mode)))


(use-package dart-mode
  :straight t)

(use-package lsp-dart
  :straight t
  :hook (dart-mode . lsp))


(use-package cc-mode
  :config
  (add-hook 'c-mode-hook #'agnipau/lsp-actions-on-save))

(use-package ccls
  :straight t
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (add-hook 'c-mode-hook 'lsp-deferred)
  (add-hook 'c++-mode-hook 'lsp-deferred))

(use-package modern-cpp-font-lock
  :straight t
  :config
  (modern-c++-font-lock-global-mode t))


(use-package markdown-mode
  :straight t
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

(use-package grip-mode
  :straight t
  :bind (:map markdown-mode-command-map
              ("g" . grip-mode))
  :config
  (setq grip-update-after-change nil)
  (setq grip-preview-use-webkit nil))


(use-package fish-mode
  :straight t)

;;; langs.el ends here
