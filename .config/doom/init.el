;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (corfu +icons +orderless)
       (vertico +icons)

       :ui
       doom
       doom-dashboard
       hl-todo
       indent-guides
       modeline
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       window-select
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       multiple-cursors
       snippets

       :emacs
       (dired +icons)
       electric
       undo
       vc

       :term
       eshell
       vterm

       :checkers
       (syntax +flymake)

       :tools
       ansible
       biblio
       (debugger +lsp)
       (eval +overlay)
       magit
       (lookup +docsets)
       (lsp +eglot)
       pdf
       tree-sitter

       :os
       tty

       :lang
       emacs-lisp
       (go +lsp)
       (json +lsp)
       latex
       markdown
       (org +roam2 +dragndrop +pandoc)
       (python +lsp)
       (javascript +lsp +tree-sitter)
       (sh +lsp +tree-sitter)
       web
       yaml

       :config
       (default +bindings +smartparens))
