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
       debugger
       (eval +overlay)
       magit
       (lookup +docsets)
       (lsp +eglot)
       pdf
       tree-sitter

       :os
       tty

       :lang
       (go +lsp)
       (javascript +lsp +tree-sitter)
       (json +lsp)
       (org +roam2 +dragndrop +pandoc)
       (python +lsp)
       (sh +lsp +tree-sitter)
       emacs-lisp
       latex
       lua
       markdown
       web
       yaml

       :config
       (default +bindings +smartparens))
