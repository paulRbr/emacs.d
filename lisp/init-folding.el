;;; init-folding.el --- Support code and region folding -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'origami)
  (with-eval-after-load 'origami
    (define-key origami-mode-map (kbd "C-c f") 'origami-recursively-toggle-node)
    (define-key origami-mode-map (kbd "C-c F") 'origami-toggle-all-nodes)))

(when (maybe-require-package 'yafolding)
  (after-load 'yafolding
    (global-set-key (kbd "C-c y") 'yafolding-discover)
    (defvar yafolding-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "<C-S-return>") #'yafolding-hide-parent-element)
        (define-key map (kbd "<C-M-return>") #'yafolding-toggle-all)
        (define-key map (kbd "<C-return>") #'yafolding-toggle-element)
        map))
    ))

(provide 'init-folding)
;;; init-folding.el ends here
