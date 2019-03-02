;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files

;;; Commentary:
;;
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7b3ba651975798959ba78e56ad1f8270a8259a5af3b34a256820ef26149ca86b" "a91e45c500326e7beb041d59d2a474bec99f05450fec3471429d49818a73da42" "673b827b97cbd218e300a5e4b6ea0ac965ca57418252866cf621fe865d34f0b5" "12b04c86ffa135c7f55e0b9f6a31b8c0ffffd4e2b60516d4f91e38bd5dea5ef0" "5dab35616d517755c869bebf0c658a0bddfaa62db39ecafefc7f2daf4e3286e2" "9d6e8b92abb18fb77db7763d431d2c41320cfdcaafa1d4095a669bb1b99ddbaa" "3eb17761909488767a178d503463bbe437fb1654442298066ec6f3e23228972f" "e1943fd6568d49ec819ee3711c266a8a120e452ba08569045dd8f50cc5ec5dd3" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (flycheck yaml-mode ssh-config-mode scss-mode org-fstree ox-mediawiki org-bullets rjsx-mode js2-mode crontab-mode ansible helm-projectile projectile react-snippets yasnippet emmet-mode helm company undo-tree smartparens ledger-mode rainbow-mode multi-term melancholy-theme ace-jump-mode diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
