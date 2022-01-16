;; ---
;; Package manager
;; ---
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     ;;'("melpa-stable" . "https://stable.melpa.org/packages/") t)
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure use-package macro is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :init (which-key-mode))

;; ---
;; UI
;; ---
;; Hide elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Disable default startup page
;;(setq inhibit-startup-message t)

;; Cursor push line by line when reaches visible end
(setq scroll-conservatively 100)

;; Highlight cursor line when gui mode
;;(when window-system (global-hl-line-mode t))

;; ---
;; Aliases
;; ---
(defalias 'yes-or-no-p 'y-or-n-p)

;; ---
;; org-mode
;; ---
(require 'org-tempo)

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

;; ---
;; Self-added variables
;; ---
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages '(org-bullets which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
