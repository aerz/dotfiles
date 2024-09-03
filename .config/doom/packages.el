;; -*- no-byte-compile: t; -*-

(package! darkman
  :pin "fa80face9fb6e6c13dc2a0d84631d770fbef71fe"
  :recipe (:host sourcehut :repo "grtcdr/darkman.el"))
(package! dotenv-mode
  :pin "e3701bf739bde44f6484eb7753deadaf691b73fb")
(package! fennel-mode
  :pin "f4bd34e1c3b14313c20af94dd34430b40c0ef35f")
(package! just-mode
  :pin "4c0df4cc4b8798f1a7e99fb78b79c4bf7eec12c1")
(package! nginx-mode
  :pin "c4ac5de975d65c84893a130a470af32a48b0b66c")
(package! org-roam
  :pin "0b9fcbc97b65b349826e63bad89ca121a08fd2be")
(package! pkgbuild-mode
  :pin "8ef396d8fa9187b65c065a6bc2ca15dfaf3255df")
(package! jinja2-mode
  :pin "03e5430a7efe1d163a16beaf3c82c5fd2c2caee1")
(package! systemd
  :pin "8742607120fbc440821acbc351fda1e8e68a8806")

(package! polymode
  :pin "ca060e081a1f849a880732670dc15370ac987b89")
(package! poly-ansible
  :pin "6fcfbb7163f7a74db9da0d54a5ecaec2ac93b315")

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
