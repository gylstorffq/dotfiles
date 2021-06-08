(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(highlight-parentheses-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(org-agenda-files
   (quote
    ("~/01_projects/fat-edge/notes_demo_january.org" "~/03_notes/agendas/TODOs_week47.org" "~/03_notes/TODOs.org" "~/03_notes/TODOs.org")))
 '(org-capture-templates
   (quote
    (("P" "Project Todo" entry
      (function
       #[0 "\303\304\305\306\307\310\311!!\312\301\313
\314\300&	!\207"
           [(nil nil nil :empty-lines 1)
            "* TODO %?
" org-projectile-strategy occ-capture-goto-marker make-instance occ-context :category org-projectile-category-from-file org-capture-get :original-file :template :strategy :options]
           11])
      "* TODO %?
" :empty-lines 1 nil nil nil nil)
     ("n" "notes to capture" entry
      (file "~/03_notes/notes.org")
      "* %? on %U
 %i
 %a")
     ("p" "Project Todo" entry
      (function
       (closure
        ((capture-heading . "Project Todo")
         (capture-template . "* TODO %?
 %T
 SCHEDULED: %^t
")
         (capture-character . "p")
         (additional-options nil nil nil :empty-lines 1)
         t)
        nil
        (occ-capture-goto-marker
         (make-instance
          (quote occ-context)
          :category
          (org-projectile-category-from-file
           (org-capture-get :original-file))
          :template capture-template :strategy org-projectile-strategy :options additional-options))))
      "* TODO %?
%F
%U
SCHEDULED: %^t" nil nil nil nil))))
 '(package-selected-packages
   (quote
    (systemd string-edit sphinx-doc ron-mode poetry orgit-forge org-superstar org-rich-yank npm-mode nose multi-line shut-up forge closql emacsql-sqlite emacsql treepy evil-easymotion evil-collection annalist emr list-utils nadvice drag-stuff dired-quick-sort company-math math-symbol-lists bats-mode csv-mode solarized-dark-high-contrast-theme monokai-theme terminal-here magit-section helm-mu flycheck-elsa mu4e-maildirs-extension mu4e-alert yasnippet-snippets writeroom-mode visual-fill-column vterm string-inflection seeing-is-believing ruby-refactor ruby-hash-syntax rubocopfmt prettier-js pippel pipenv password-generator overseer org-cliplink org-brain nodejs-repl nameless magit-svn json-navigator hierarchy importmagic epc concurrent impatient-mode helm-xref helm-rtags helm-org-rifle helm-org helm-ls-git helm-git-grep google-c-style godoctor go-tag go-rename go-impl go-gen-test go-fill-struct gitignore-templates flycheck-ycmd flycheck-rtags flycheck-package package-lint evil-textobj-line evil-org evil-lion evil-goggles evil-cleverparens paredit editorconfig devdocs cpp-auto-include company-ycmd ycmd request-deferred deferred company-rtags rtags company-reftex company-php ac-php-core xcscope company-lua browse-at-remote blacken hybrid-mode dotenv-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data toml-mode racer flycheck-rust cargo rust-mode jinja2-mode company-ansible ansible-doc ansible adoc-mode markup-faces yaml-mode lua-mode openwith lv transient company-auctex auctex pandoc-mode ox-pandoc ht bitbake plantuml-mode yapfify xterm-color ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline powerline smeargle shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rake rainbow-delimiters pyvenv pytest pyenv-mode py-isort powershell popwin pip-requirements persp-mode pcre2el paradox spinner orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gtags helm-gitignore request helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight ess-smart-equals ess-R-data-view ctable ess julia-mode eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat disaster diminish diff-hl define-word cython-mode company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-go go-mode company-c-headers company-anaconda company column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format chruby bundler inf-ruby bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed anaconda-mode pythonic f s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup solarized-theme dash)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36"))))
 '(org-block ((t (:background "dark slate gray"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :underline t))))
 '(org-block-end-line ((t (:inherit org-meta-line :overline t)))))
