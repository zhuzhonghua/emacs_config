;; my evil mode
;; forbiden single key change

(defun dummy-bind ()
	(interactive)
	(message "dummy key"))

(defvar my-evil-mode-hook nil)

(defvar my-evil-local-mode-map
	(make-keymap))


(define-key my-evil-local-mode-map (kbd "1") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "2") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "3") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "4") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "5") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "6") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "7") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "8") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "9") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "a") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "A") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "b") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "B") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "c") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "C") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "d") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "D") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "e") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "E") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "f") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "F") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "g") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "G") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "h") 'backward-char)
(define-key my-evil-local-mode-map (kbd "H") 'backward-char)
(define-key my-evil-local-mode-map (kbd "i") 'my-evil-mode)
(define-key my-evil-local-mode-map (kbd "I") 'my-evil-mode)
(define-key my-evil-local-mode-map (kbd "j") 'next-line)
(define-key my-evil-local-mode-map (kbd "J") 'next-line)
(define-key my-evil-local-mode-map (kbd "k") 'previous-line)
(define-key my-evil-local-mode-map (kbd "K") 'previous-line)
(define-key my-evil-local-mode-map (kbd "l") 'forward-char)
(define-key my-evil-local-mode-map (kbd "L") 'forward-char)
(define-key my-evil-local-mode-map (kbd "m") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "M") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "n") 'next-line)
(define-key my-evil-local-mode-map (kbd "N") 'next-line)
(define-key my-evil-local-mode-map (kbd "o") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "O") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "p") 'previous-line)
(define-key my-evil-local-mode-map (kbd "P") 'previous-line)
(define-key my-evil-local-mode-map (kbd "q") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "Q") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "r") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "R") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "s") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "S") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "t") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "T") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "u") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "U") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "v") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "V") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "w") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "W") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "x") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "X") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "y") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "Y") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "z") 'dummy-bind)
(define-key my-evil-local-mode-map (kbd "Z") 'dummy-bind)


(define-minor-mode my-evil-local-mode
	"read only except prefix keystrokes"
	:init-value nil
	:lighter " my-evil"
	:keymap my-evil-local-mode-map)

(defun my-evil-initialize ()
	(unless (or (minibufferp)
							(not (equal (key-binding "k") 'self-insert-command)))
		(my-evil-local-mode 1)))

(define-globalized-minor-mode	my-evil-mode my-evil-local-mode	my-evil-initialize)

(defun my-evil-mode-disable ()
	"Disable my evil mode on special occation"
	(my-evil-local-mode -1))

;;(defun my-evil-mode-enable ()
;;	"auto enable my evil mode when evil mode")

(global-set-key (kbd "M-i") 'my-evil-mode)

;;(add-hook 'minibuffer-setup-hook 'my-evil-mode-disable)
;;(add-hook 'minibuffer-exit-hook 'my-evil-mode)

(provide 'my-evil-mode)
