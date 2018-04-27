#�ҵ�emacs����

#����Ĭ�ϵ�tab���Ϊ2

	(setq-default tab-width 2)

#���ô˹��ܣ�������ֹ����м��ļ�

	(setq make-backup-files nil)

#����ƥ������

	(show-paren-mode)

#��Control-Tab���л���һ�ε�Buffer

	(global-set-key (kbd "C-<tab>")
			'(lambda ()
			   (interactive)
			   (switch-to-buffer nil)))

#���ð�װԴ

	(require 'package)
	(add-to-list 'package-archives
	             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

#�������壬������������

	(set-face-attribute 'default nil :font "Consolas 16")
	;; Chinese Font
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
			    charset (font-spec :family "Consolas"
					       :size 16)))

#magit����
��git-commit-mode-hook��д���Ļ�����룬�Զ�ת��utf8

	;; magit
	(global-set-key (kbd "C-x g") 'magit-status)
	;; magit commit ����
	(defun my-git-commit-hook ()
	  (auto-fill-mode)
	  (set-buffer-file-coding-system 'utf-8-unix))
	(add-hook 'git-commit-mode-hook 'my-git-commit-hook)

#ivy counsel swiper����
C-s��C-r ���ҵ�ϰ�߲�һ�������Խ�����


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

#����ʾWindows��β^M

	(defun hide-ctrl-M ()
	  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
	  (interactive)
	  (setq buffer-display-table (make-display-table))
	  (aset buffer-display-table ?\^M []))
	
	(add-hook 'text-mode-hook 'hide-ctrl-M)
	(add-hook 'c++-mode-hook 'hide-ctrl-M)

#���ø���ģʽ��tab���

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

#projectile����

	(projectile-global-mode)

#Python����

	(add-hook 'python-mode-hook
			  (lambda ()
				(setq indent-tabs-mode t)
				(setq tab-width 2)
				(setq python-indent-offset 2)))

#�Զ��尴��
C-o ģ������VIM������ģʽ��O
C-c M-w ������  
C-c C-w ������  
C-c C-y ճ����
C-c 0 �رմ���ͬʱkill-buffer
C-c d ɾ��ĩβ�пհ�


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

#��Mac�µ�Emacs��ȡ��ȷ��path��������shell�б���һ��

	(when (memq window-system '(mac ns x))
	  (exec-path-from-shell-initialize))

#��ʾ�ļ�·��

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

#�Զ����evilģʽ  
ֻ����hjkl������n��p��������
������Emacs��������һ�£�ֻ�ǲ�������  

	(global-set-key (kbd "M-ESC") 'toggle-evil-mode)
	(require 'evil)
	(toggle-evil-mode)


