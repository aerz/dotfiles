;;; +typst.el -*- lexical-binding: t; -*-

(use-package! typst-ts-mode
  :config
  ;;(add-hook! 'typst-ts-mode-hook #'lsp! 'append)
  (add-hook! 'typst-ts-mode-hook #'auto-fill-mode)
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-grammar-location (expand-file-name "tree-sitter/libtree-sitter-typst.so" user-emacs-directory))
  (typst-ts-mode-enable-raw-blocks-highlight t)
  (typst-ts-mode-highlight-raw-blocks-at-startup t))

(after! typst-ts-mode
  (add-to-list 'treesit-language-source-alist
               '(typst "https://github.com/uben0/tree-sitter-typst"))
  (treesit-install-language-grammar 'typst))

(use-package! eglot
  ;; FIXME related https://github.com/nvarner/typst-lsp/issues/434
  ;; FIXME workaround https://github.com/joaotavora/eglot/issues/1363#issuecomment-1948922204
  :custom (eglot-connect-hook nil)
  :config (add-to-list 'eglot-server-programs '(typst-ts-mode . ("typst-lsp"))))
