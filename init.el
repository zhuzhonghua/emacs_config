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
