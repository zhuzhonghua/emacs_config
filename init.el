
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;evil-search-next &evil-search-next &evil-search-next &evil-search-next &; just comment it out by adding a semicolon to the start oevil-define-motionevil-define-motionevil-define-motionevil-define-motionevil-define-motionevil-define-motionevil-define-motionevil-define-motionevil-define-motionf the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq-default tab-width 2)
(setq make-backup-files nil)

(show-paren-mode)

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
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit)))
 '(show-paren-mode t)
 '(transient-mark-mode nil))
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
 '(solarized-italic nil))

;;(set-face-attribute 'default nil :family "Consolas" :height 160)
(set-face-attribute 'default nil :font "Consolas 16")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset (font-spec :family "Consolas"
				       :size 16)))

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
		(delete-trailing-whitespace (line-beginning-position) (line-end-position))
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

;; my evil mode
;; read only layer mode
(load "~/.emacs.d/rol.el")
(defun toggle-evil-mode ()
	(interactive)
	(if (bound-and-true-p evil-mode)
			(evil-mode 0)
		(progn
			(evil-mode 1)
			(progn
				(setq evil-normal-state-map (make-sparse-keymap))
				(setq evil-motion-state-map (make-sparse-keymap))
				(setq evil-visual-state-map (make-sparse-keymap))
				(setq evil-insert-state-map (make-sparse-keymap))
				(setq evil-operator-state-map (make-sparse-keymap))
				(setq evil-replace-state-map (make-sparse-keymap))
				(setq evil-move-cursor-back nil)
				(define-key evil-motion-state-map (kbd "h") 'backward-char)
				(define-key evil-motion-state-map (kbd "j") 'next-line)
				(define-key evil-motion-state-map (kbd "k") 'previous-line)
				(define-key evil-motion-state-map (kbd "l") 'forward-char)
				(define-key evil-motion-state-map (kbd "n") 'next-line)
				(define-key evil-motion-state-map (kbd "p") 'previous-line)
				(define-key evil-motion-state-map (kbd "0") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "1") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "2") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "3") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "4") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "5") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "6") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "7") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "8") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "9") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "a") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "A") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "b") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "B") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "c") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "C") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "d") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "D") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "e") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "E") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "f") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "F") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "g") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "G") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "i") 'toggle-evil-mode)
				(define-key evil-motion-state-map (kbd "I") 'toggle-evil-mode)
				(define-key evil-motion-state-map (kbd "m") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "M") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "o") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "O") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "q") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "Q") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "r") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "R") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "s") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "S") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "t") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "T") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "u") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "U") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "v") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "V") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "w") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "W") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "x") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "X") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "y") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "Y") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "z") 'dummy-bind)
				(define-key evil-motion-state-map (kbd "Z") 'dummy-bind)
				(define-key evil-motion-state-map (kbd " ") 'dummy-bind)))))

(global-set-key (kbd "M-ESC") 'toggle-evil-mode)
(require 'evil)
(toggle-evil-mode)

;;paredit mode
(paredit-mode)

;;super-save-mode
(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)

;;company-mode
(require 'company)
(company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-,")
		'(lambda ()
		   (interactive)
		   (company-complete)))

;;yasnippet
(add-to-list 'load-path
						 "~/.emacs.d/elpa/yasnippet-0.12.2")

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-0.12.2/snippets/" ;; the yasmate collection
        ))
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/elpa/yasnippet-0.12.2/snippets")
