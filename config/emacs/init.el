;; ---
;; Package manager
;; ---
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure use-package macro is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; Self-added variables
(custom-set-variables
 '(package-selected-packages '(which-key use-package)))
(custom-set-faces
 )

;; ---
;; UI
;; ---
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
