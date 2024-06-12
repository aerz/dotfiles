;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; -----------------------------------------------------------------------------
;; Global
;; -----------------------------------------------------------------------------
(setq user-full-name "Agustin Cisneros"
      user-mail-address "agustincc@tutanota.com"
      +zen-text-scale 1

      doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)
      ;; doom-font (font-spec :family "Iosevka" :size 16)
      ;; doom-variable-pitch-font (font-spec :family "Iosevka")
      doom-theme 'doom-tomorrow-night
      +doom-dashboard-functions '(doom-dashboard-widget-shortmenu
                                  doom-dashboard-widget-loaded))

;; Do not create a new perspective for a new frame
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

(map! :map 'override :leader ":" nil
      :leader
      :prefix (":" . "execute")
      :desc "M-x" ":" #'execute-extended-command
      :desc "M-x for buffer" "." #'execute-extended-command-for-buffer)

(map! :leader :desc "Search file" "\\" #'consult-find)

;; Enable smooth scrolling (touchpad)
(when (and (not (version<= emacs-version "29"))
           (string= (system-name) "minivac"))
  (add-hook! 'after-init-hook (pixel-scroll-precision-mode +1)))

;; -----------------------------------------------------------------------------
;; Editor
;; -----------------------------------------------------------------------------
(setq display-line-numbers-type 'relative)

;; ansible
(setq lsp-yaml-custom-tags ["!vault"])

;; ansible/jinja2
(after! jinja2-mode (set-formatter!
                      'prettier-jinja2 '("") :modes '(jinja2-mode)))

;; -----------------------------------------------------------------------------
;; org
;; -----------------------------------------------------------------------------
(setq org-agenda-include-diary t
      org-agenda-start-on-weekday 1

      org-directory "~/Documents/Emacs"
      ;; org-roam-directory "~/Documents/Emacs/Pyramid Notebook"
      org-cite-global-bibliography '("~/Documents/Emacs/citations.bib")
      org-startup-folded t
      org-ellipsis " ›")

(use-package! olivetti
  :after org
  :custom
  (olivetti-style 'fancy))

(defun aerz/default-org-mode ()
  "Set the defaults for org-mode personal usage."
  (interactive)
  (hl-line-mode -1)
  (display-line-numbers-mode -1)
  (vi-tilde-fringe-mode -1)
  ;; (git-gutter-mode -1)
  (auto-fill-mode +1)
  (olivetti-mode +1))

;; (add-hook! 'org-mode-hook #'aerz/default-org-mode)
(add-hook! 'org-mode-hook #'auto-fill-mode)
(add-hook! 'org-mode-hook #'+org-enable-auto-reformat-tables-h)

(after! org
  ;; defaults
  (setq org-attach-dir-relative t
        time-stamp-format "%Y-%02m-%02d %02H:%02M")
  ;; hooks
  (add-hook! 'before-save-hook 'time-stamp))


(use-package! org-modern
  :hook (org-mode . global-org-modern-mode)
  :config
  (setq org-modern-label-border 0.3))

(defun org-roam-node-insert-immediate (arg &rest args)
  "Inserts a new node without the need of pop-up the capture buffer."
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(use-package! org-roam
  :init
  (map! :leader
        :prefix "nr"
        :desc "Insert node immediate" "I" #'org-roam-node-insert-immediate)
  :config
  (org-roam-db-autosync-mode +1)
  (setq org-roam-capture-templates
        '(
          ("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t)
          ("p" "project" plain "%?"
           :target (file+head "projects/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+filetags:\n")
           :unnarrowed t)
          ("a" "area" plain "%?"
           :target (file+head "areas/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+filetags:\n")
           :unnarrowed t)
          ("r" "resource" plain "%?"
           :target (file+head "resources/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+filetags:\n")
           :unnarrowed t)
          )))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :init
  (map! :leader
        :prefix "nr"
        :desc "Open orui" "u" #'org-roam-ui-open
        :desc "Sync theme with orui" "t" #'org-roam-ui-sync-theme)
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  (org-roam-ui-open-on-start nil))

;; biblio
(setq! citar-bibliography '("~/Documents/org/citations.bib"))

;; reftex
(setq reftex-default-bibliography "~/Documents/org/citations.bib")

;; latex
(setq +latex-viewers '(zathura))

;; -----------------------------------------------------------------------------
;; sh-mode
;; -----------------------------------------------------------------------------
(pushnew! +lookup-provider-url-alist
          '("ShellCheck Wiki" "https://www.shellcheck.net/wiki/%s"))

;; -----------------------------------------------------------------------------
;; Packages
;; -----------------------------------------------------------------------------
(use-package! darkman
  :custom
  (darkman-themes '(:light doom-tomorrow-day
                    :dark doom-tomorrow-night))
  (darkman-switch-themes-silently nil)
  :config
  (when (display-graphic-p)
    (add-hook! 'window-setup-hook (darkman-mode))) ;; after custom.el is loaded
  (when (daemonp)
    (add-hook 'server-after-make-frame-hook #'darkman-mode)
    (advice-add 'darkman-mode :after
                (lambda ()
                  (remove-hook 'server-after-make-frame-hook #'darkman-mode)))))

(use-package! typst-ts-mode
  :config
  ;;(add-hook! 'typst-ts-mode-hook #'lsp! 'append)
  (add-hook! 'typst-ts-mode-hook #'auto-fill-mode)
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-grammar-location (expand-file-name "tree-sitter/libtree-sitter-typst.so" user-emacs-directory))
  (typst-ts-mode-enable-raw-blocks-highlight t)
  (typst-ts-mode-highlight-raw-blocks-at-startup t))

(after! typst-ts-mode
  (add-to-list 'treesit-language-source-alist
               '(typst "https://github.com/uben0/tree-sitter-typst"))
  (treesit-install-language-grammar 'typst))

(use-package! eglot
  ;; FIXME related https://github.com/nvarner/typst-lsp/issues/434
  ;; FIXME workaround https://github.com/joaotavora/eglot/issues/1363#issuecomment-1948922204
  :custom (eglot-connect-hook nil)
  :config (add-to-list 'eglot-server-programs '(typst-ts-mode . ("typst-lsp"))))

(use-package! yadm
  :after (projectile magit)
  :init
  (advice-remove #'projectile-get-ext-command
                 #'doom--only-use-generic-command-a)
  (advice-add #'+vertico-file-search
              :around #'yadm-doom-vertico-file-search))

;; -----------------------------------------------------------------------------
;; Snippets
;; -----------------------------------------------------------------------------
(after! yasnippet
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change)))

(after! sh-script
  (set-company-backend! 'sh-mode
                        '(company-shell :with company-yasnippet)))

