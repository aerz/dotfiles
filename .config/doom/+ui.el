;;; +ui.el -*- lexical-binding: t; -*-

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
