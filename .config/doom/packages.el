;; -*- no-byte-compile: t; -*-

(package! darkman
  :pin "fa80face9fb6e6c13dc2a0d84631d770fbef71fe"
  :recipe (:host sourcehut :repo "grtcdr/darkman.el"))
(package! dotenv-mode)
(package! fennel-mode)
(package! jinja2-mode)
(package! just-mode)
(package! nginx-mode)
(package! olivetti)
(unpin! org-roam)
(package! org-roam-ui)
(package! polymode)
(package! pkgbuild-mode)
(package! poly-ansible)
(package! scss-mode)
(package! systemd)
(package! typst-ts-mode
  :pin "430f0b8d647ca320a674cbccda2b6ccdbe145cde"
  :recipe (:host sourcehut :repo "meow_king/typst-ts-mode"
           :files (:defaults "*.el")))
(package! yadm
  :pin "0b8148f0b90cdf7f36dc591a83b39b309d2c0e63"
  :recipe (:host github :repo "seanfarley/yadm.el"))

;; darkman local development
;; (package! darkman
;;   :recipe (:local-repo "~/dev/github/darkman.el"
;;            :files ("darkman.el")
;;            :build (:not compile)))
