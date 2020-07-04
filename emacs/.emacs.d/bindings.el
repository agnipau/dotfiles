;;; bindings.el --- Keybindings declaration using general.el

;;; Commentary:
;;; Keybindings declaration using general.el.

;;; Code:

(use-package general
  :straight t
  :after evil-numbers
  :config
  ;; Removing emacs state from non-normal list allow the use of SPC.
  (delete 'emacs general-non-normal-states)

  ;; Definitions
  (general-define-key
   ;; TODO
   :keymaps '(normal motion emacs compilation-mode-map)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

   ;; Unbinding SPC first to avoid problems.
   "" nil

   "t" '(:wk "Toggle")
   "tf" '(toggle-frame-fullscreen :wk "Toggle frame fullscreen")
   "tw" '(agnipau/toggle-hidden-chars :wk "Toggle hidden characters")
   "tn" '(hydra-evil-numbers/body :wk "Increment / decrement number at point")
   "tr" '(agnipau/toggle-rainbow-mode :wk "Toggle `rainbow-mode'")

   ;; TODO: Find a way to use double space for search.
   "s" '(:wk "Search")
   "ss" '(evil-search-forward :wk "Evil search forward (/)")
   "sS" '(evil-search-backward :wk "Evil search backward (?)")
   "sb" '(swiper-isearch :wk "Swiper isearch")
   "sB" '(swiper-isearch-thing-at-point :wk "Swiper isearch thing at point")
   "si" '(imenu :wk "Jump to symbol")
   "sL" '(ffap-menu :wk "Jump to link")
   "sj" '(evil-show-jumps :wk "Jump list")
   "sm" '(evil-show-marks :wk "Jump to mark")

   "q" '(:wk "Quit")
   "qK" '(save-buffers-kill-emacs :wk "Save buffers and kill Emacs")
   "qQ" '(evil-quit-all-with-error-code :wk "Discard changes to all buffers and kill Emacs")
   "qW" '(delete-window :wk "Close current window")

   "o" '(:wk "Open")
   "o-" '(dired-jump :wk "Run dired in the directory associated with current buffer")
   "oA" '(org-agenda :wk "Org agenda")
   "oa" '(:wk "Org mode")
   "oaa" '(org-agenda :wk "Org agenda")
   "oam" '(org-tags-view :wk "Org tags view")
   "oat" '(org-todo-list :wk "Org todo list")
   "oav" '(org-search-view :wk "Org search view")
   "ob" '(browse-url-of-file :wk "Open file associated with current buffer in the browser")
   "of" '(make-frame :wk "Make a new frame")
   "oe" '(eshell :wk "Open eshell here")

   "n" '(:wk "Notes")
   "nC" '(org-clock-cancel :wk "Org clock cancel")
   "na" '(org-agenda :wk "Org agenda")
   "nl" '(org-store-link :wk "Org store link")
   "nm" '(org-tags-view :wk "Org tags view")
   "nn" '(org-capture :wk "Org capture")
   "nN" '(org-capture-goto-target :wk "Org goto capture")
   "no" '(org-clock-goto :wk "Org clock goto")
   "nt" '(org-todo-list :wk "Org todo list")
   "nv" '(org-search-view :wk "Org search view")

   "g" '(:wk "Git")
   "g/" '(magit-dispatch :wk "Magit dispatch")
   "gB" '(magit-blame-addition :wk "Magit blame addition")
   "gC" '(magit-clone :wk "Magit clone")
   "gc" '(:wk "Magit/Forge c...")
   "gcR" '(magit-clone :wk "Magit clone")
   "gcb" '(magit-branch-and-checkout :wk "Magit branch and checkout")
   "gcc" '(magit-commit-create :wk "Magit commit create")
   "gcf" '(magit-commit-fixup :wk "Magit commit fixup")
   "gci" '(forge-create-issue :wk "Forge create issue")
   "gcp" '(forge-create-pullreq :wk "Forge create pull request")
   "gcr" '(magit-init :wk "Test")
   "gD" '(magit-file-delete :wk "Magit file delete")
   "gF" '(magit-fetch :wk "Magit fetch")
   "gf" '(:wk "Magit/Forge find")
   "gfc" '(magit-show-commit :wk "Magit show commit")
   "gff" '(magit-find-file :wk "Magit find file")
   "gfg" '(magit-find-git-config-file :wk "Magit find git config file")
   "gfi" '(forge-visit-issue :wk "Forge visit issue")
   "gfp" '(forge-visit-pullreq :wk "Forse visit pull request")
   "gG" '(magit-status-here :wk "Magit status here")
   "gL" '(magit-log :wk "Magit log")
   "gl" '(:wk "Magit/Forge list")
   "gli" '(forge-list-issues :wk "Forge list issues")
   "gln" '(forge-list-notifications :wk "Forge list notifications")
   "glp" '(forge-list-pullreqs :wk "Forge list pull requests")
   "glr" '(magit-list-repositories :wk "Magit list repositories")
   "gls" '(magit-list-submodules :wk "Magit list submodules")
   "gR" '(vc-revert :wk "Vc revert")
   "gS" '(magit-stage-file :wk "Magit stage file")
   "gU" '(magit-unstage-file :wk "Magit unstage file")
   "gb" '(magit-branch-checkout :wk "Magit branch checkout")
   "gg" '(magit-status :wk "Magit status")
   "go" '(:wk "Forge browse")
   "goI" '(forge-browse-issues :wk "Forge browse issues")
   "goP" '(forge-browse-pullreqs :wk "Forge browse pull requests")
   "goc" '(forge-browse-commit :wk "Forge browse commit")
   "goi" '(forge-browse-issue :wk "Forge browse issue")
   "gop" '(forge-browse-pullreq :wk "Forge browse pull request")
   "gor" '(forge-browse-remote :wk "Forge browse remote")

   "f" '(:wk "File")
   "fc" '(editorconfig-find-current-editorconfig :wk "Find current editorconfig")
   "fd" '(dired :wk "Dired")
   "ff" '(find-file :wk "Find file")
   "fl" '(locate :wk "Locate")
   "fr" '(recentf-open-files :wk "Recentf files")
   "fR" '(projectile-recentf :wk "Recentf project files")
   "fs" '(save-buffer :wk "Save buffer")
   "fS" '(write-file :wk "Write file")

   "c" '(:wk "Code")
   "cc" '(compile :wk "Compile")
   "cC" '(recompile :wk "Recompile")
   "cj" '(lsp-ivy-workspace-symbol :wk "LSP ivy workspace symbol")
   "cJ" '(lsp-ivy-global-workspace-symbol :wk "LSP ivy global workspace symbol")
   "ca" '(lsp-execute-code-action :wk "LSP execute code action")
   "ci" '(lsp-organize-imports :wk "LSP organize imports")
   "cr" '(lsp-rename :wk "LSP rename")
   "cw" '(delete-trailing-whitespace :wk "Delete trailing whitespace")
   "cx" '(flycheck-list-errors :wk "Flycheck list errors")

   "b" '(:wk "Buffer")
   "bB" '(switch-to-buffer :wk "Switch to buffer")
   "bM" '(bookmark-delete :wk "Bookmark delete")
   "bN" '(evil-buffer-new :wk "Evil new buffer")
   "bS" '(evil-write-all :wk "Evil write all")
   "b[" '(previous-buffer :wk "Previous buffer")
   "b]" '(next-buffer :wk "Next buffer")
   "bd" '(kill-current-buffer :wk "Kill current buffer")
   "bi" '(ibuffer :wk "Open ibuffer")
   "bk" '(kill-current-buffer :wk "Kill current buffer")
   "bl" '(evil-switch-to-windows-last-buffer :wk "Switch to windows last buffer")
   "bm" '(bookmark-set :wk "Bookmark set")
   "bn" '(next-buffer :wk "Next buffer")
   "bp" '(previous-buffer :wk "Previous buffer")
   "br" '(revert-buffer :wk "Revert buffer")
   "bs" '(basic-save-buffer :wk "Basic save buffer")
   "bz" '(bury-buffer :wk "Bury buffer")

   "w" '(:wk "Window")
   "wC-b" '(evil-window-bottom-right :wk "Evil window bottom right")
   "wC-c" '(ace-delete-window :wk "Ace delete window")
   "wC-h" '(evil-window-left :wk "Evil window left")
   "wC-j" '(evil-window-down :wk "Evil window down")
   "wC-k" '(evil-window-up :wk "Evil window up")
   "wC-l" '(evil-window-right :wk "Evil window right")
   "wC-n" '(evil-window-new :wk "Evil new window")
   "wC-o" '(delete-other-windows :wk "Delete other windows")
   "wC-p" '(evil-window-mru :wk "Evil most recently used window")
   "wC-r" '(winner-redo :wk "Winner redo")
   "wC-s" '(evil-window-split :wk "Evil window split")
   "wC-t" '(evil-window-top-left :wk "Evil window top left")
   "wC-u" '(winner-undo :wk "Winner undo")
   "wC-v" '(evil-window-vsplit :wk "Evil window vertical split")
   "wC-w" '(other-window :wk "Other window")
   "wC-_" '(evil-window-set-height :wk "Evil window set height")
   "w+" '(evil-window-increase-height :wk "Evil window increase height")
   "w-" '(evil-window-decrease-height :wk "Evil window decrease height")
   "w<" '(evil-window-decrease-width :wk "Evil window decrease width")
   "w=" '(balance-windows :wk "Balance windows")
   "w>" '(evil-window-increase-width :wk "Evil window increase width")
   "wR" '(evil-window-rotate-upwards :wk "Evil window rotate upwards")
   "wS" '(evil-window-split :wk "Evil window split")
   "wW" '(evil-window-prev :wk "Evil previous window")
   "w_" '(evil-window-set-height :wk "Evil window set height")
   "wb" '(evil-window-bottom-right :wk "Evil window bottom right")
   "wc" '(evil-window-delete :wk "Evil delete window")
   "wd" '(evil-window-delete :wk "Evil delete window")
   "wh" '(evil-window-left :wk "Evil window left")
   "wj" '(evil-window-down :wk "Evil window down")
   "wk" '(evil-window-up :wk "Evil window up")
   "wl" '(evil-window-right :wk "Evil window right")
   "wn" '(evil-window-new :wk "Evil new window")
   "wp" '(evil-window-mru :wk "Evil most recently used window")
   "wq" '(evil-quit :wk "Evil quit")
   "wr" '(evil-window-rotate-downwards :wk "Evil window rotate downwards")
   "ws" '(evil-window-split :wk "Evil window split")
   "wt" '(evil-window-top-left :wk "Evil top left window")
   "wu" '(winner-undo :wk "Winner undo")
   "wv" '(evil-window-vsplit :wk "Evil window vertical split")
   "ww" '(evil-window-next :wk "Evil next window")
   "wo" '(other-window :wk "Other window")
   "w|" '(evil-window-set-width :wk "Evil window set width")
   "wC-S-h" '(evil-window-move-far-left :wk "Evil window move far left")
   "wC-S-j" '(evil-window-move-very-bottom :wk "Evil window move very bottom")
   "wC-S-k" '(evil-window-move-very-top :wk "Evil window move very top")
   "wC-S-l" '(evil-window-move-far-right :wk "Evil window move far right")
   "wC-S-r" '(evil-window-rotate-upwards :wk "Evil window rotate upwards")
   "wC-S-s" '(evil-window-split :wk "Evil window split")
   "wC-S-w" '(ace-swap-window :wk "Ace swap window")

   "x" '(:keymap ctl-x-map :wk "C-x")

   "l" '(:keymap lsp-command-map :package lsp-mode :wk "LSP")

   "h" '(:keymap help-map :wk "Help")

   "p" '(:keymap projectile-command-map :package projectile :wk "Projectile")
   )

  (evil-normalize-keymaps))

(with-eval-after-load 'which-key
  (which-key-add-key-based-replacements
    "SPC p 4"     "Find other window"
    "SPC p 4 a"   "Find other file other window"
    "SPC p 4 b"   "Switch to buffer other window"
    "SPC p 4 C-o" "Display buffer"
    "SPC p 4 d"   "Find directory other window"
    "SPC p 4 D"   "Dired other window"
    "SPC p 4 f"   "Find file other window"
    "SPC p 4 g"   "Find file dwim other window"
    "SPC p 4 t"   "Find implementation or test other window"

    "SPC p 5"   "Find other frame"
    "SPC p 5 a" "Find other file other frame"
    "SPC p 5 b" "Switch to buffer other frame"
    "SPC p 5 d" "Find dir other frame"
    "SPC p 5 D" "Dired other frame"
    "SPC p 5 f" "Find file other frame"
    "SPC p 5 g" "Find file dwim other frame"
    "SPC p 5 t" "Find implementation or test other frame"

    "SPC p !" "Run shell command in root"
    "SPC p &" "Run async shell command in root"
    "SPC p a" "Find other file"
    "SPC p b" "Switch to buffer"
    "SPC p C" "Configure project"
    "SPC p c" "Compile project"
    "SPC p d" "Find dir"
    "SPC p D" "Project dired"
    "SPC p e" "Project recentf"
    "SPC p E" "Edit dir locals"
    "SPC p f" "Find file"
    "SPC p g" "Find file dwim"
    "SPC p F" "Find file in known projects"
    "SPC p i" "Invalidate cache"
    "SPC p I" "Ibuffer"
    "SPC p j" "Find tag"
    "SPC p k" "Kill buffers"
    "SPC p l" "Find file in directory"
    "SPC p m" "Commander"
    "SPC p o" "Multi occur"
    "SPC p p" "Switch project"
    "SPC p q" "Switch open project"
    "SPC p P" "Test project"
    "SPC p r" "Replace"
    "SPC p R" "Regenerate tags"

    "SPC p s"   "Project grep"
    "SPC p s g" "Project grep"
    "SPC p s r" "Project ripgrep"
    "SPC p s s" "Project ag"

    "SPC p S" "Save project buffers"
    "SPC p t" "Toggle between implementation and test"
    "SPC p T" "Find test file"
    "SPC p u" "Run project"
    "SPC p v" "VC"
    "SPC p V" "Browse dirty projects"

    "SPC p x"   "Project run"
    "SPC p x e" "Run eshell"
    "SPC p x i" "Run ielm"
    "SPC p x t" "Run term"
    "SPC p x s" "Run shell"
    "SPC p x g" "Run gdb"
    "SPC p x v" "Run vterm"

    "SPC p z"       "Cache current file"
    "SPC p <left>"  "Previous project buffer"
    "SPC p <right>" "Next project buffer"
    "SPC p ESC"     "Buffers other buffer")

  (which-key-add-key-based-replacements
    "SPC l s"   "Sessions"
    "SPC l s r" "Restart LSP for workspace"
    "SPC l s s" "Start LSP"
    "SPC l s q" "Shutdown LSP for workspace"
    "SPC l s d" "Describe session"
    "SPC l s D" "Disconnect LSP"

    "SPC l ="   "Formatting"
    "SPC l = =" "Format buffer"
    "SPC l = r" "Format region"

    "SPC l F"   "Folders"
    "SPC l F a" "Add project root to the list of workspace folders"
    "SPC l F r" "Remove project root from the list of workspace folders"
    "SPC l F b" "Remove project root from the workspace blacklist"

    "SPC l T"   "Toggles"
    "SPC l T l" "Toggle lens mode"
    "SPC l T L" "Toggle trace IO"
    "SPC l T h" "Toggle symbol highlight"
    "SPC l T b" "Toggle headerline breadcrumb"
    "SPC l T a" "Toggle modeline code actions"
    "SPC l T S" "Toggle UI sideline"
    "SPC l T d" "Toggle documentation"
    "SPC l T s" "Toggle signature auto activate"
    "SPC l T f" "Toggle on type formatting"
    "SPC l T T" "Toggle treemacs sync"

    "SPC l g"   "Goto"
    "SPC l g g" "Goto definition"
    "SPC l g r" "Find references"
    "SPC l g i" "Goto implementation"
    "SPC l g t" "Goto type definition"
    "SPC l g d" "Goto declaration"
    "SPC l g h" "Goto treemacs call hierarchy"
    "SPC l g a" "Xref find apropos"
    "SPC l g e" "Goto treemacs errors list"

    "SPC l h"   "Help"
    "SPC l h h" "Describe thing at point"
    "SPC l h s" "Signature activate"
    "SPC l h g" "Glance documentation"

    "SPC l r"   "Refactoring"
    "SPC l r r" "Rename symbol"
    "SPC l r o" "Organize imports"

    "SPC l a"   "Actions"
    "SPC l a a" "Execute code action"
    "SPC l a l" "Avy lens"
    "SPC l a h" "Document highlight"

    "SPC l G"   "Peeks"
    "SPC l G g" "Peek find definitions"
    "SPC l G r" "Peek find references"
    "SPC l G i" "Peek find implementation"
    "SPC l G s" "Peek find workspace symbol"))

;;; bindings.el ends here
