(use-package bash-completion
  :straight t
  :config
  (autoload 'bash-completion-dynamic-complete 
   "bash-completion"
   "BASH completion hook")
  (add-hook 'shell-dynamic-complete-functions
	    'bash-completion-dynamic-complete))

(use-package go-mode
  :straight t
  :commands go-mode
  :mode "\\.go\\'"
  :hook ((go-mode . (lambda () (add-hook 'before-save-hook
					 #'gofmt-before-save)))))

(use-package elpy
  :straight t
  :init
  (elpy-enable))

(use-package fish-mode
  :straight t
  :mode "\\.fish\\'"
  :commands fish-mode)

(use-package dart-mode
  :straight t
  :mode "\\.dart\\'"
  :commands dart-mode)

(use-package tide
  :straight t
  :after (typescript-mode company flycheck)
  :hook '((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package haskell-mode
 :straight t
 :mode "\\.hs\\'"
 :commands haskell-mode)

(use-package rust-mode
  :straight t
  :mode "\\.rs\\'"
  :commands rust-mode
  :init
  (setq lsp-rust-server 'rust-analyzer
	rust-format-on-save t))

