(setq package-archives `(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'load-path "~/.emacs.d/elpa/pde-0.2.16")
(require 'flymake)
(load "pde-load")

(when (load "flymake" t)
  (defun flymake-perl-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "perl" (list buffer-file-name))))

  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.pl\\'" flymake-perl-init))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.pm\\'" flymake-perl-init))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.perl\\'" flymake-perl-init)))
