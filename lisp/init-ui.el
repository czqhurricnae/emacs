(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(delete-selection-mode t)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode)
;; 设置主题
(load-theme 'solarized-dark t)

(provide 'init-ui)
