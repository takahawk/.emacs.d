(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

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
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages
   (quote
    (cargo company racer racer-mode company-mode magit yaml-mode kotlin-mode rust-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; auto-install packages if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package rust-mode)
(use-package kotlin-mode)
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

