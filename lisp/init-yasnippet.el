;;; init-yasnippet.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'yasnippet)
  (maybe-require-package 'yasnippet-snippets)
  (require 'yasnippet)
  (yas-global-mode 1))


(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
