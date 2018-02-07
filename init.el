
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq-default tab-width 4)
(setq make-backup-files nil)

(show-paren-mode)

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


(defun other-window-backward (&optional n)
  "Select the previous window."
  (interactive "p")
  (if n
      (other-window (- n))
    (other-window -1)))

(global-set-key "\C-x\C-p" 'other-window-backward)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-x g") 'magit-status)

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

(defun my-c++-style-set ()
  (interactive)
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-style-set)
(add-hook 'c-mode-hook 'my-c++-style-set)

(projectile-global-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)
			(setq tab-width 2)))

;;(defun copy-line ()
;;  (interactive)
;;  (save-excursion
;;	(move-beginning-of-line nil)
;;	(set-mark-command nil)
;;	(move-end-of-line nil)
;;	(kill-ring-save)))

(defun copy-line ()
  (interactive)
  (save-excursion
	(kill-ring-save (line-beginning-position) (line-end-position))))

;;(defun cut-line ()
;;  (interactive)
;;  (save-excursion
;;	(move-beginning-of-line nil)
;;	(set-mark-command nil)
;;	(move-end-of-line nil)
;;	(kill-region)))

(defun cut-line ()
  (interactive)
  (save-excursion
	(kill-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "C-c M-w") 'copy-line)
(global-set-key (kbd "C-c C-w") 'cut-line)
