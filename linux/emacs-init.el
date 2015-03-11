
(setq org-todo-keywords
  '((sequence "TODO(t)" "IN_PROGRESS(p@/!)" "DONE(d!)")))


;; Puts line numbers
(global-linum-mode t)

;; Stop splash screen and message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Other people's stuff
;;; Found at http://qdot.github.io/conf_emacs/

(defun reload-file ()
  "Reload a file, resetting the cursor to the current position"
  (interactive)
  (let ((curr-scroll (window-vscroll)))
    (find-file (buffer-name))
    (set-window-vscroll nil curr-scroll)))

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (>= (recursion-depth) 1)
    (abort-recursive-edit)))
;; Whenever a mouse click has happened, clear the minibuffer
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Set org babel backgrounds so we get nice blocks
;(setq org-indent-indentation-per-level 4)
;(set-face-background 'org-block-begin-line "#333")
;(set-face-background 'org-block-end-line "#333")
;(set-face-background 'org-block-background "#222")

;; Set defaults we expect
(setq-default py-indent-offset 4)

;; Set default directory
;(setq default-directory "~/Documents/software_studio/websurv/")

(show-paren-mode 1)
(setq show-paren-delay 0)

(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
