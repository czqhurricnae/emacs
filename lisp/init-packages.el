;; (when (>= emacs-major-version 24)
;;   (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;; 			   ;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
;; 			("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; ;; cl - Common Lisp Extension
;; (require 'cl)

;; ;; Add Packages
;; (defvar my/packages '(
;; 		;; --- Auto-completion ---
;; 		company
;; 		;; --- Better Editor ---
;; 		hungry-delete
;; 		swiper
;; 		counsel
;; 		smartparens
;; 		pallet
;; 		;; --- Major Mode ---
;; 		js2-mode
;; 		web-mode
;; 		js2-refactor
;; 		expand-region
;; 		iedit
;; 		evil
;; 		evil-surround
;; 		evil-nerd-commenter
;; 		which-key
;; 		;; org-mode
;; 		;; --- Minor Mode ---
;; 		nodejs-repl
;; 		exec-path-from-shell
;; 		popwin
;; 		imenu-list
;; 		org-pomodoro
;; 		helm-ag
;; 		flycheck
;; 		auto-yasnippet
;; 		window-numbering
;; 		;; --- Themes ---
;; 		monokai-theme
;; 		solarized-theme
;; 		powerline
;; 		) "Default packages")

;; (setq package-selected-packages my/packages)
;; (setq package-selected-packages my/packages)

;; (defun my/packages-installed-p ()
;;   (loop for pkg in my/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))

;; (unless (my/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg my/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

;; 配置Cask
;; 在终端curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
;; 删除.emacs/.cask目录
;; 正常安装pallet

;; 配置evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)
(evil-leader/set-leader "<SPC>")

;; 配置evil
(require 'evil)
(evil-mode 1)
(dolist (mode '(occur-mode
		recentf-dialog-mode
		imenu-list-minor-mode
		flycheck-error-list-mode
		git-rebase-mode
		helm-ag-mode
		package-menu-mode))
  (add-to-list 'evil-emacs-state-modes mode))

;; 在occur-mode下使用hjkl,同时使用emacs-state
(add-hook 'occur-mode-hook
	  (lambda () (evil-add-hjkl-bindings occur-mode-map 'emacs
		       (kbd "/") 'evil-search-forward
		       (kbd "?") 'evil-search-backward
		       (kbd "n") 'evil-search-next
		       (kbd "p") 'evil-search-previous
		       (kbd "C-f") 'evil-scroll-down
		       (kbd "C-b") 'evil-scroll-up
		       (kbd "SPC w o") 'other-window
		       (kbd "SPC w c") 'kill-buffer-and-window
		       (kbd "C-[") 'keyboard-quit
		       )))

(add-hook 'recentf-dialog-mode-hook
	  (lambda () (evil-add-hjkl-bindings recentf-mode-map 'emacs
		       (kbd "/") 'evil-search-forward
		       (kbd "?") 'evil-search-backward
		       (kbd "n") 'evil-search-next
		       (kbd "p") 'evil-search-previous
		       (kbd "C-f") 'evil-scroll-down
		       (kbd "C-b") 'evil-scroll-up
		       (kbd "SPC w o") 'other-window
		       (kbd "SPC w c") 'kill-buffer-and-window
		       (kbd "C-[") 'keyboard-quit
		       )))

(add-hook 'package-menu-mode-hook
	  (lambda () (evil-add-hjkl-bindings package-menu-mode-map 'emacs
		       (kbd "/") 'evil-search-forward
		       (kbd "?") 'evil-search-backward
		       (kbd "n") 'evil-search-next
		       (kbd "p") 'evil-search-previous
		       (kbd "C-f") 'evil-scroll-down
		       (kbd "C-b") 'evil-scroll-up
		       (kbd "SPC w o") 'other-window
		       (kbd "SPC w c") 'kill-buffer-and-window
		       (kbd "C-[") 'keyboard-quit
		       )))

;; 配置smartparens
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;;        (t (save-excursion
;;           (ignore-errors (backward-up-list))
;; 	  (funcall fn)))))

(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it)))
  )

;; 配置swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; 配置js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; 配置popwin
(require 'popwin)
(popwin-mode t)

;; 配置imenu-list
(setq imenu-list-focus-after-activation t)

;; 配置org-pomodoro
(require 'org-pomodoro)

;; 配置flycheck
(add-hook 'js2-mode-hook 'flycheck-mode)

;; 配置yasnippets
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; 配置window-numbering
(window-numbering-mode 1)

;; 配置powerline
(require 'powerline)
(powerline-center-evil-theme)

;; 配置evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; 配置evil-nerd-commenter
(evilnc-default-hotkeys)

;; 配置whick-key
(which-key-mode 1)

;; 配置use-package
(require 'package)

;; 如果启用exec-path-from-shell,启动时可能提示PATH变量重复定义
(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (progn
    (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell.  A login shell, because my
      ;; environment variables are mostly set in `.zprofile'.
      (setq exec-path-from-shell-arguments '("-l")))

    (exec-path-from-shell-initialize)
    )
  )

;; 配置python-mode下company-backends
(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda company-files company-dabbrev-code company-dabbrev)))
(add-hook 'python-mode-hook 'anaconda-mode)

(provide 'init-packages)
