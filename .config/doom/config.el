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

;; (map! :map 'override :leader ":" nil
;;       :leader
;;       :prefix ":"
;;       :desc "M-x" ":" #'execute-extended-command
;;       :desc "M-x for buffer" "." #'execute-extended-command-for-buffer)

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
(after! yaml-mode
  (setq lsp-yaml-custom-tags ["!vault"]))

(after! jinja2-mode
  (set-formatter! 'prettier-jinja2 '("") :modes '(jinja2-mode)))

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

(after! org
  ;; defaults
  (setq org-attach-dir-relative t
        time-stamp-format "%Y-%02m-%02d %02H:%02M")
  ;; hooks
  (add-hook! 'before-save-hook 'time-stamp)
  (add-hook! 'org-mode-hook #'auto-fill-mode)
  ;; (add-hook! 'org-mode-hook #'aerz/default-org-mode)
  (add-hook! 'org-mode-hook #'+org-enable-auto-reformat-tables-h))

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

;; -----------------------------------------------------------------------------
;; sh-mode
;; -----------------------------------------------------------------------------
(pushnew! +lookup-provider-url-alist
          '("ShellCheck Wiki" "https://www.shellcheck.net/wiki/%s"))

;; -----------------------------------------------------------------------------
;; Packages
;; -----------------------------------------------------------------------------
(load! "+ui.el")
(load! "+typst.el")

(use-package! yadm
  :after (projectile magit)
  :init
  (add-to-list 'projectile-known-projects "~/")
  (advice-remove #'projectile-get-ext-command
                 #'doom--only-use-generic-command-a))

(use-package! poly-ansible
  :after systemd)

;; -----------------------------------------------------------------------------
;; Snippets
;; -----------------------------------------------------------------------------
(after! yasnippet
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change)))

(after! sh-script
  (set-company-backend! 'sh-mode
                        '(company-shell :with company-yasnippet)))

