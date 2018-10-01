;;; init-terraform.el --- Work with Terraform configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Terraform

(when (maybe-require-package 'terraform-mode)
  (when (maybe-require-package 'company-terraform)
    (after-load 'terraform-mode
      (company-terraform-init)))

  (defun terraform-fmt ()
    "Format *.tf terraform files with terraform fmt."
    (when (eq major-mode 'terraform-mode)
      (shell-command-to-string "tf-make fmt")))

  (add-hook 'after-save-hook #'terraform-fmt))

(provide 'init-terraform)
;;; init-terraform.el ends here
;;; init-terraform.el ends here
