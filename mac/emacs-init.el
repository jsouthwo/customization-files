;;;; << That's how to comment. (Just one is all that's needed)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; org stuff
;(require 'org)
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
;(setq org-log-done 'time)
;(setq org-log-done 'note)

;; Clock stuff
;(setq org-clock-persist 'history)
;(org-clock-persistence-insinuate)
(setq org-todo-keywords
   '((sequence "TODO(t)" "IN_PROGRESS(p)" "DONE(d@!)")))
;  '((sequence "TODO(t)" "IN_PROGRESS(p@/!)" "DONE(d@!)")))
(setq org-todo-keyword-faces
      '(("IN_PROGRESS" . (:foreground "pale turquoise" :weight bold))))

;; No scratch message
(setq initial-scratch-message nil)


;; Puts line numbers
(global-linum-mode t)
(setq column-number-mode t)

;; Set default directory
(setq default-directory "~/Documents/School/Junior/")


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

;;(when macosx-p
  ;;Change meta to alt
;;  (setq mac-command-modifier 'meta)
  ;;avoid hiding with M-h
;;  (setq mac-pass-command-to-system nil))
;;(when linux-p
;;  (setq x-alt-keysym 'meta))

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Set org babel backgrounds so we get nice blocks
(setq org-indent-indentation-per-level 4)
;(set-face-background 'org-block-begin-line "#333")
;(set-face-background 'org-block-end-line "#333")
;(set-face-background 'org-block-background "#222")

;; Set defaults we expect
(setq-default py-indent-offset 4)

;; Set default directory
;; TODO: Change for OS and machine.
;(setq default-directory "~/Documents/software_studio/websurv/")

;; Shows matching parenthesis
(show-paren-mode 1)
;; And shows them immediately
(setq show-paren-delay 0)

;; Turns accelerated scrolling off
(setq mouse-wheel-progressive-speed nil)

;; Stop popups... They freeze emacs on Mac.
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))


;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time


;; ===== Set the highlight current line minor mode =====

;; In every buffer, the line which contains the cursor will be fully
;; highlighted

;(global-hl-line-mode 1)
;(set-face-foreground 'hl-line "#EEE")
;(set-face-background 'hl-line "#222")
;(set-face-foreground 'hl-line nil)


;;; http://www.aaronbedra.com/emacs.d/
(tool-bar-mode -1)
(scroll-bar-mode -1)

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

; 'yes or no' to 'y or n'
(defalias 'yes-or-no-p 'y-or-n-p)

;(global-set-key (kbd "RET") 'newline-and-indent)
;(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
;(global-set-key (kbd "M-/") 'hippie-expand)
;(global-set-key (kbd "C-+") 'text-scale-increase)
;(global-set-key (kbd "C--") 'text-scale-decrease)


(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

; Pairs (), [], {}, etc. when typed.
;(require 'autopair)

; Autocomplete
;(require 'auto-complete-config)
;(ac-config-default)

; Ruby
(add-hook 'ruby-mode-hook
          (lambda ()
            (autopair-mode)))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))

; RVM
;(rvm-use-default)

;; From http://davidmedinawiki.wordpress.com/2012/06/02/my-emacs-file/

; Makes switching buffers easier
(iswitchb-mode 1)

;; Changes line numbering format. Not needed in emacs24
;(setq linum-format "%d ")
;(setq linum-format “%4d \u2502 “)
