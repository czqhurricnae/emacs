;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode 1)

(require 'init-packages)
(require 'init-ui)
;; init-better-defaults必须在init-keybindings之前
;; 因为init-keybindings中有使用其定义的函数
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
(setq custom-file (expand-file-name "lisp/customized.el" user-emacs-directory))

(load-file custom-file)
