;;; init-terraform.el --- Work with Terraform configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Terraform
(setq-default terraform-format-on-save-mode-lighter t)

(when (maybe-require-package 'terraform-mode)
  (when (maybe-require-package 'company-terraform)
    (with-eval-after-load 'terraform-mode
      (company-terraform-init)

      (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
      ;; I find formatters based on "reformatter" to be more reliable
      ;; so I redefine `terraform-format-on-save-mode' here.
      (when (maybe-require-package 'reformatter)
        (reformatter-define terraform-format
          :program "terraform" :args '("fmt" "-"))))))

(provide 'init-terraform)
;;; init-terraform.el ends here
