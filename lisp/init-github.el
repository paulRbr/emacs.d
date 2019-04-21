;;; Init-github.el --- Github integration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-git)

(maybe-require-package 'yagist)
(require-package 'bug-reference-github)
(add-hook 'prog-mode-hook 'bug-reference-prog-mode)

(maybe-require-package 'github-clone)
(maybe-require-package 'forge)
(define-key global-map (kbd "C-x p") 'forge-pull)
(with-eval-after-load 'magit
  (require 'forge)

  (add-to-list 'forge-alist '("framagit.org" "framagit.org/api/v4" "framagit.org" forge-gitlab-repository))
  (add-to-list 'forge-alist '("gitlab-perso.com" "gitlab-perso.com/api/v4" "gitlab-perso.com" forge-gitlab-repository))
  (add-to-list 'forge-alist '("github-perso.com" "api.github-perso.com" "github-perso.com" forge-github-repository)))

(provide 'init-github)
;;; init-github.el ends here
