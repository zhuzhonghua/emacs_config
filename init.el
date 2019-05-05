
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq-default tab-width 2)
(setq make-backup-files nil)

(show-paren-mode)

(add-hook 'transient-mark-mode-off-hook
					(lambda ()
						(transient-mark-mode t)))

;;(transient-mark-mode)
(global-set-key (kbd "C-~")
		'(lambda ()
		   (interactive)
		   (set-mark-command nil)))

(global-set-key (kbd "C-<tab>")
		'(lambda ()
		   (interactive)
		   (switch-to-buffer nil)))

(global-set-key (kbd "C-j")
		'(lambda ()
		   (interactive)
		   (if (string= (thing-at-point 'char) '})
		       (progn
			 (save-excursion
			   (newline-and-indent))
			 (newline-and-indent))
		     (newline-and-indent))))


(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun other-window-backward (&optional n)
  "Select the previous window."
  (interactive "p")
  (if n
      (other-window (- n))
    (other-window -1)))

(global-set-key "\C-x\C-p" 'other-window-backward)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit)))
 '(show-paren-mode t)
 '(transient-mark-mode nil)
 '(c-offsets-alist
   (quote
    ((access-label . -)
     (innamespace . -)
     (substatement-open . 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages
   (quote
    (paredit evil auto-complete ag exec-path-from-shell typescript-mode magit)))
 '(show-paren-mode t)
 '(solarized-italic nil)
 '(region ((t (:background "green" :distant-foreground "gtk_selection_fg_color")))))

;;(set-face-attribute 'default nil :family "Consolas" :height 160)
(set-face-attribute 'default nil :font "Consolas 16")
;; Chinese Font
(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset (font-spec :family "Consolas"
					   :size 16))))

(global-set-key (kbd "C-`")
		'(lambda ()
		   (interactive)
		   (set-mark-command nil)))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
;; magit commit 乱码
(defun my-git-commit-hook ()
  (auto-fill-mode)
  (set-buffer-file-coding-system 'utf-8-unix))
(add-hook 'git-commit-mode-hook 'my-git-commit-hook)

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

(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'text-mode-hook 'hide-ctrl-M)
(add-hook 'c++-mode-hook 'hide-ctrl-M)

(defun my-typescript-mode ()
  (interactive)
  (setq typescript-indent-level 2)
  (setq js-indent-level 2))

(add-hook 'typescript-mode-hook 'my-typescript-mode)
(add-hook 'js-mode-hook 'my-typescript-mode)

;;c++ style
(defun my-c++-style-set ()
  (interactive)
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-style-set)
(add-hook 'c-mode-hook 'my-c++-style-set)
(add-hook 'c-mode-common-hook 'my-c++-style-set)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; compile
(global-set-key (kbd "C-c c") 'compile)

(projectile-global-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 2)
	    (setq python-indent-offset 2)))

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

(defun insert-tab ()
  (interactive)
  (quoted-insert 9))

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


(defun my-open-line-next ()
  (interactive)
  (move-end-of-line 1)
  (newline))

(defun my-delete-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line))

(defun other-window-backward (&optional n)
  "Select the previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n ))))

(global-set-key (kbd "M-k") 'other-window-backward)
(global-set-key (kbd "M-p") 'switch-to-prev-buffer)
(global-set-key (kbd "M-n") 'switch-to-next-buffer)

(global-set-key (kbd "C-<tab>")
		'(lambda ()
		   (interactive)
		   (switch-to-buffer nil)))

;;(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "C-c c") 'copy-line)
(global-set-key (kbd "C-c d") 'my-delete-line)
(global-set-key (kbd "C-o") 'my-open-line)
(global-set-key (kbd "C-S-o") 'my-open-line-next)
(global-set-key (kbd "C-c 0") 'kill-buffer-delete-window)
(global-set-key (kbd "C-x 3") '(lambda ()
				 (interactive)
				 (split-window-right)
				 (other-window -1)))


(defun kill-buffer-delete-window ()
  (interactive)
  (kill-buffer)
  (delete-window))

;;让Mac下的Emacs读取正确的path变量，与shell中保持一致
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;显示文件路径
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

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'unicad)

;; auto complete
;;(ac-config-default)
;;(auto-complete-mode)
;;(add-to-list 'ac-modes 'typescript-mode)
;;(setq ac-fuzzy-enable t)

(require 'my-evil)

;;paredit mode
(paredit-mode)

;;super-save-mode
(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(global-set-key (kbd "C-x g") 'magit-status)
