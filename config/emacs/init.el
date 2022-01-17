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

;; ---
;; Packages
;; ---
(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package avy
  :ensure t
  :bind ("C-:" . avy-goto-char))

(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))

(use-package helpful
  :ensure t
  :bind
  ("C-h f" . helpful-callable)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key))

;; ---
;; Minibufer
;; ---
;; Autocompletion
;; ido-mode + ido-vertical-mode + smex
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex))

;; ibuffer
(global-set-key (kbd "C-x b") 'ibuffer)
(setq ibuffer-expert t)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;; ---
;; Windows
;; ---
(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "j" "k" "l" "i" "o"))
  :bind ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

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
;; Code
;; ---
(global-subword-mode 1)

(setq electric-pair-pairs
      '(
	(?\( . ?\))
	(?\[ . ?\))
	))
(electric-pair-mode 1)

;; ---
;; org-mode
;; ---
(require 'org-tempo)

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(helpful switch-window rainbow-mode avy smex ido-vertical-mode org-bullets which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
