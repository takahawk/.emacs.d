(require 'package)
(setq package-archives
      '(("gnu-elpa" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("gnu-elpa" . 2)
        ("melpa-stable" . 3)
        ("melpa" . 1)))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; auto-install packages if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(display-battery-mode 1)

(electric-pair-mode 1)
(show-paren-mode t)
(global-linum-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(use-package ido
  :config
  (ido-mode t)
  (setq ido-case-fold nil))

(use-package auto-complete)

(use-package powerline
  :config
  (powerline-center-theme))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode))

;; Shell
(use-package shell-pop
  :config
  (global-set-key (kbd "C-t") 'shell-pop)
  (setq shell-pop-window-position "bottom"))

(use-package bash-completion
  :config
  (bash-completion-setup))

(defun shell-mode-cd-backward ()
  "Move to parent directory"
  (interactive)
  (insert "x")
  (goto-char (comint-line-beginning-position))
  (kill-line)
  (comint-kill-whole-line 0)
  (current-kill 1)
  (let ((beg (point)))
    (insert "cd ..")
    (comint-send-input)
    (delete-region beg (point))
    (yank)
    (delete-char -1)))

(defun shell-mode-config ()
  (linum-mode -1)
  (local-set-key (kbd "M-DEL") 'shell-mode-cd-backward)
  )

(add-hook 'shell-mode-hook 'shell-mode-config)

;; Web
(defun web-mode-config ()
  (setq web-mode-markup-indent-offset 2))

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-hook 'web-mode-hook 'web-mode-config))

;; C
(defun c-mode-config ()
  (setq indent-tabs-mode t)
  (setq c-syntactic-indentation nil)
  (local-set-key (kbd "DEL") 'delete-backward-char)
  (auto-complete-mode))
(add-hook 'c-mode-hook 'c-mode-config)
(setq-default c-basic-offset 4)

;; Gtk+
(add-to-list 'auto-mode-alist '("\\.ui\\'" . xml-mode))

;; XML
(setq-default nxml-slash-auto-complete-flag t)

;; Ruby
(defun ruby-mode-config ()
  (auto-complete-mode))
(add-hook 'ruby-mode-hook 'ruby-mode-config)

;; Lua
(use-package lua-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode)))

;; Kotlin
(use-package kotlin-mode
  :config
  (add-hook 'kotlin-mode-hook 'c-mode-config))

;; Groovy
(use-package groovy-mode
  :config
  (add-hook 'groovy-mode-hook 'c-mode-config))

(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (misterioso)))
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (minimap bash-completion groovy-mode escreen cargo company racer racer-mode company-mode magit yaml-mode kotlin-mode rust-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-cursor-color "#ffffff")


(use-package rust-mode)

(use-package yaml-mode)
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package minimap
  :config
  (global-set-key (kbd "C-x f") 'minimap-mode))


(use-package cargo
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode))

