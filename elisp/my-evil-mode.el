;; my evil mode
;; forbiden single key change

(defun dummy-bind ()
	(interactive)
	(message "dummy key"))

(defvar my-evil-mode-hook nil)

(defvar my-evil-mode-map
	(let ((map (make-keymap)))
		(define-key evil-motion-state-map (kbd "1") 'dummy-bind)
		map))

(define-minor-mode my-evil-mode
	"read only except prefix keystrokes"
	:lighter " my-evil")


(defvar my-evil-mode nil)
(global-set-key (kbd "M-h") 'toggle-my-evil-mode)

(provide 'my-evil-mode)
