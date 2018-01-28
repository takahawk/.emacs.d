(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))


;; appearance
(load-theme 'dakrone t)
(menu-bar-mode      -1)
(toggle-scroll-bar  -1)
(tool-bar-mode      -1)


;; custom bindings
(global-set-key (kbd "M-o") 'other-window)


;; ido mode
(setq ido-enable-flex-matching       t)
(setq ido-everywhere                 t)
(setq ido-create-new-buffer    'always)
(setq ido-file-extensions-order
           '(".el" ".kt" ".java" ".c"))
(setq ido-ignore-extensions          t)
(ido-mode                            t)


;; movement 
(setq line-move-visual nil)
(global-subword-mode     t)
(global-superword-mode  -1)


;; customize interface
(custom-set-variables
 '(package-selected-packages (quote (dakrone-theme))))
(custom-set-faces
 )
