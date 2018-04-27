#我的emacs配置

#设置默认的tab宽度为2

	(setq-default tab-width 2)

#禁用此功能，避免出现过多中间文件

	(setq make-backup-files nil)

#高亮匹配括号

	(show-paren-mode)

#绑定Control-Tab，切换上一次的Buffer

	(global-set-key (kbd "C-<tab>")
			'(lambda ()
			   (interactive)
			   (switch-to-buffer nil)))

#设置安装源

	(require 'package)
	(add-to-list 'package-archives
	             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

#设置字体，包括中文字体

	(set-face-attribute 'default nil :font "Consolas 16")
	;; Chinese Font
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
			    charset (font-spec :family "Consolas"
					       :size 16)))

#magit设置
绑定git-commit-mode-hook，写中文会出乱码，自动转换utf8

	;; magit
	(global-set-key (kbd "C-x g") 'magit-status)
	;; magit commit 乱码
	(defun my-git-commit-hook ()
	  (auto-fill-mode)
	  (set-buffer-file-coding-system 'utf-8-unix))
	(add-hook 'git-commit-mode-hook 'my-git-commit-hook)

#ivy counsel swiper设置
C-s和C-r 跟我的习惯不一样，所以禁用了


	(ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq enable-recursive-minibuffers t)
	;;(global-set-key "\C-s" 'swiper)
	(global-set-key (kbd "C-c C-r") 'ivy-resume)
	(global-set-key (kbd "<f6>") 'ivy-resume)
	(global-set-key (kbd "M-x") 'counsel-M-x)
	(global-set-key (kbd "C-x C-f") 'counsel-find-file)
	(global-set-key (kbd "<f1> f") 'counsel-describe-function)
	(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
	(global-set-key (kbd "<f1> l") 'counsel-find-library)
	(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
	(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
	(global-set-key (kbd "C-c g") 'counsel-git)
	(global-set-key (kbd "C-c j") 'counsel-git-grep)
	(global-set-key (kbd "C-c k") 'counsel-ag)
	(global-set-key (kbd "C-x l") 'counsel-locate)
	(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
	;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

#不显示Windows行尾^M

	(defun hide-ctrl-M ()
	  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
	  (interactive)
	  (setq buffer-display-table (make-display-table))
	  (aset buffer-display-table ?\^M []))
	
	(add-hook 'text-mode-hook 'hide-ctrl-M)
	(add-hook 'c++-mode-hook 'hide-ctrl-M)

#设置各个模式的tab宽度

	(defun my-typescript-mode ()
		(interactive)
		(setq typescript-indent-level 2)
		(setq js-indent-level 2))
	
	(add-hook 'typescript-mode-hook 'my-typescript-mode)
	(add-hook 'js-mode-hook 'my-typescript-mode)
	
	(defun my-c++-style-set ()
	  (interactive)
	  (setq c-basic-offset 2)
	  (c-set-offset 'substatement-open 0))
	(add-hook 'c++-mode-hook 'my-c++-style-set)
	(add-hook 'c-mode-hook 'my-c++-style-set)

#projectile设置

	(projectile-global-mode)

#Python设置

	(add-hook 'python-mode-hook
			  (lambda ()
				(setq indent-tabs-mode t)
				(setq tab-width 2)
				(setq python-indent-offset 2)))

#自定义按键
C-o 模拟类似VIM的命令模式的O
C-c M-w 拷贝行  
C-c C-w 剪切行  
C-c C-y 粘贴行
C-c 0 关闭窗口同时kill-buffer
C-c d 删除末尾行空白


	(defun copy-line ()
	  (interactive)
	  (save-excursion
			(delete-trailing-whitespace (line-beginning-position) (line-end-position))
			(kill-ring-save (line-beginning-position) (line-end-position))))
	
	(defun cut-line ()
	  (interactive)
	  (save-excursion
			(delete-trailing-whitespace (line-beginning-position) (line-end-position))
			(kill-region (line-beginning-position) (line-end-position))))
	
	(defun kill-buffer-delete-window ()
	  (interactive)
	  (kill-buffer)
	  (delete-window))
	
	(defun yank-copy-cut ()
	  (interactive)
	  (save-excursion
			(move-beginning-of-line nil)		
			(yank)
			(delete-trailing-whitespace (line-beginning-position) (line-end-position))))
	
	(defun my-open-line ()
		(interactive)
		(open-line 1)
		(next-line)
		(indent-for-tab-command)
		(previous-line)
		(indent-for-tab-command))
	
	(defun del-trail-ws-line ()
		(interactive)
		(delete-trailing-whitespace (line-beginning-position) (line-end-position)))
	
	(global-set-key (kbd "C-o") 'my-open-line)
	(global-set-key (kbd "C-c M-w") 'copy-line)
	(global-set-key (kbd "C-c C-w") 'cut-line)
	(global-set-key (kbd "C-c C-y") 'yank-copy-cut)
	(global-set-key (kbd "C-c 0") 'kill-buffer-delete-window)
	(global-set-key (kbd "C-c d") 'del-trail-ws-line)

#让Mac下的Emacs读取正确的path变量，与shell中保持一致

	(when (memq window-system '(mac ns x))
	  (exec-path-from-shell-initialize))

#显示文件路径

	(defun frame-title-string ()
		"Return the file name of current buffer, using ~ if under home directory"
		(let 
	      ((fname (or 
	                 (buffer-file-name (current-buffer))
	                 (buffer-name))))
	      ;;let body
			(when (string-match (getenv "HOME") fname)
				(setq fname (replace-match "~" t t fname))        )
			fname))
	
	;;; Title = 'system-name File: foo.bar'
	(setq frame-title-format '("" system-name "  File: "(:eval (frame-title-string))))

#自定义的evil模式  
只保留hjkl，增加n和p，上下行
其他与Emacs操作保持一致，只是不能输入  

	(global-set-key (kbd "M-ESC") 'toggle-evil-mode)
	(require 'evil)
	(toggle-evil-mode)


