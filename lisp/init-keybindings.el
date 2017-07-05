(global-set-key (kbd "C-h f") 'find-function)
(global-set-key (kbd "C-h v") 'find-variable)
(global-set-key (kbd "C-h k") 'find-function-on-key)

;; 设置打开配置文件的快捷键
(global-set-key (kbd "<home>") 'open-my-init-file)

;; 配置打开最近编辑文档的快捷键
(global-set-key (kbd "C-x r") 'recentf-open-files)

;; 配置swipe快捷键
(global-set-key "\C-s" 'swiper)
;; Recalls the state of the completion session just before its last exit.
;; (global-set-key (kbd "C-p r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-x y") 'counsel-find-library)
(global-set-key (kbd "C-x i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-x u") 'counsel-unicode-char)
(global-set-key (kbd "C-x g") 'counsel-git)
(global-set-key (kbd "C-x j") 'counsel-git-grep)
;; 必须先安装ag,sudo apt-get install silversearcher-ag
;; (global-set-key (kbd "C-x a") 'counsel-ag)
(global-set-key (kbd "C-x a") 'helm-do-ag)
;; 搜索出结果后,C-c C-e进入编辑模式,C-=选择,M-s-e开始编辑
(global-set-key (kbd "C-x l") 'counsel-locate)
;; 使用imenu-list插件替代，能够做到在左侧窗口
;; (global-set-key (kbd "M-s i") 'counsel-imenu)

(define-key read-expression-map (kbd "C-x h") 'counsel-expression-history)

;; 配置自动调整缩进的快捷键
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 配置hippie补全的快捷键
(global-set-key (kbd "M-/") 'hippie-expand)

;; 配置web-mode中两个和四个空格切换的快捷键
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 配置expand-region快捷键
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "M-s i") 'imenu-list-smart-toggle)

(global-set-key (kbd "M-s e") 'iedit-mode)

;; 配置org-mode快捷键
;; C-c C-s to schedule item
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c r") 'org-capture)

;; 配置company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 配置dired-x快捷键
;; 打开当前目录C-x C-j
;; 返回上一层目录Shift-6
;; 刷新目录l
;; 复制文件大写C
;; 批量编辑文件,C-x C-q进入编辑模式,C-=选中文字,较少的那部分,M-s e进入iedit模式

;; 配置在emacs-state下回退删除
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-w") 'backward-kill-word)

;; 使用"\"在normal-state和emacs-state之间切换

;; 配置window-numbering快捷键
;; 使用M-窗口数字进行切换

;; 配置evil-surround快捷键
;; 选中所需文字进入visual模式,按大写`S-字符`进行包围
;; 在所需文字中,按`cs-原字符 新字符`进行修改

;; 配置evil-nerd-commenter快捷键
(define-key evil-normal-state-map (kbd "SPC f c") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "SPC f c") 'evilnc-comment-or-uncomment-lines)

;; 配置evil-leader快捷键
(evil-leader/set-key
 "pr" 'recentf-open-files
 "pf" 'counsel-find-file
 "pl" 'counsel-find-library
 "pb" 'counsel-info-lookup-symbol
 "pu" 'counsel-unicode-char
 "pg" 'counsel-git
 "pj" 'counsel-git-grep
 "pa" 'helm-do-ag
 "pl" 'counsel-locate	 		
 "ph" 'counsel-expression-history
 "hf" 'find-function
 "hv" 'find-variable
 "hk" 'find-function-on-key
 "fs" 'swiper
 "fo" 'occur-dwim
 "fi" 'imenu-list-smart-toggle
 "fe" 'iedit-mode
 "bs" 'switch-to-buffer
 "bk" 'kill-buffer
 "m" 'counsel-M-x
 "w/" 'split-window-horizontally
 "w-" 'split-window-vertically
 "wc" 'kill-buffer-and-window
 "wo" 'other-window
 "0" 'select-window-0
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-3
 "4" 'select-window-4
 "qq" 'save-buffers-kill-terminal
 )

(provide 'init-keybindings)
