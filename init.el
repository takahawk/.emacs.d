(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; appearance
(load-theme 'dakrone t)
(menu-bar-mode      -1)
(toggle-scroll-bar  -1)
(tool-bar-mode      -1)


;; custom bindings
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-i")        'imenu)


;; editing
(electric-pair-mode t)
(show-paren-mode    t)


;; ido mode
(setq ido-enable-flex-matching       t)
(setq ido-everywhere                 t)
(setq ido-create-new-buffer    'always)
(setq ido-file-extensions-order
           '(".el" ".kt" ".java" ".c"))
(setq ido-ignore-extensions          t)
(ido-mode                            t)


;; movement
(setq next-screen-context-lines 5)
(setq line-move-visual        nil)
(global-subword-mode            t)
(global-superword-mode         -1)
(setq shift-select-mode       nil)


;; other config
(setq            kill-ring-max 1000)
(setq kill-do-not-save-duplicates t)

;; projectile mode
(if (fboundp 'projectile-mode)
      (setq projectile-enable-caching t))


;; customize interface
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (projectile helm auctex dakrone-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
