;; -*- no-byte-compile: t; -*-
(package! systemd)
(package! pkgbuild-mode)
(package! nginx-mode)
(package! jinja2-mode)
(package! fennel-mode)
(package! scss-mode)
(package! dotenv-mode)

;; org-mode
(package! olivetti)
(unpin! org-roam)
(package! org-roam-ui)
(package! org-modern)

;; darkman local development
;; (package! darkman
;;   :recipe (:local-repo "~/dev/github/darkman.el"
;;            :files ("darkman.el")
;;            :build (:not compile)))

(package! darkman
  :pin "fa80face9fb6e6c13dc2a0d84631d770fbef71fe"
  :recipe (:host sourcehut :repo "grtcdr/darkman.el"))

(package! yadm
  :pin "0b8148f0b90cdf7f36dc591a83b39b309d2c0e63"
  :recipe (:host github :repo "seanfarley/yadm.el"))

(package! polymode)
(package! poly-ansible)
