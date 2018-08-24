

;; package
(require 'package)
(setq package-archives '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") 
                         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/") 
                         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                                        ;("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-unsigned-archives 
      (mapcar 
       #'car
       package-archives))
(package-initialize)
;;;vim mode
(require 'evil)
(evil-mode 
 1)
;; config-dir变量记录的是这个库clone到本地的路径，默认是“~/.emacs.”。
;; 如果不是这个目录，则需要进行修改，因为后续加载各种环境配置入口文件均需要该变量
(setq root-config-dir "~/.emacs.d")

;; load common configure entry file
(load-file 
 (concat 
  root-config-dir
  "/elisp/common/.entry.el"))

;; load golang develop environment configure entry file
(load-file 
 (concat 
  root-config-dir
  "/elisp/golang/.entry.el"))

;; load markdown edit environment configure entry file
(load-file 
 (concat 
  root-config-dir
  "/elisp/markdown/.entry.el"))

;; load c/cpp develop environment configure entry file
;;(load-file (concat root-config-dir "/elisp/cpp/.entry.el"))

;; load scheme develop environment configure entry file
(load-file 
 (concat 
  root-config-dir
  "/elisp/scheme/.entry.el"))

(load-file 
 (concat 
  root-config-dir
  "/elisp/yaml/.entry.el"))

;; (load-file (concat root-config-dir "/elisp/scala/.entry.el"))

                                        ;(load-file (concat root-config-dir "/elisp/protobuf/.entry.el"))

                                        ;(load-file (concat root-config-dir "/elisp/groovy/.entry.el"))

;; 使用空格缩进
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)

(setq inhibit-startup-message t)        ;close start page
(desktop-save-mode 
 t)                                     ;保存session
(electric-pair-mode 
 t)                                     ;括号补全
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode 
   t))
(add-to-list 
 'load-path
 "~/.emacs.d/elpa")
(require 'elisp-format)

                                        ;neotree
(require 'neotree)
(global-set-key 
 (kbd 
  "<f5>")
 'neotree-toggle)
(global-set-key 
 (kbd 
  "<f6>") 
 (lambda () 
   (interactive) 
   (neotree-dir 
    "~/www/goproject/src/sundry/gostudy")))
(defun neotree-close-up-node () 
  (interactive) 
  (neotree-select-up-node) 
  (neotree-enter))

(defun neotree-current-to-root () 
  (interactive) 
  (neotree-change-root))

(defun neotree-open-vsplite () 
  (interactive) 
  (neotree-enter-vertical-split))

(defun neotree-open-splite () 
  (interactive) 
  (neotree-enter-horizontal-split))

(setq neo-smart-open t)
(add-hook 
 'neotree-mode-hook 
 (lambda () 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "TAB")
     'neotree-enter) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "o")
     'neotree-enter) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "i")
     'neotree-open-splite) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "s")
     'neotree-open-vsplite) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "t")
     'neotree-current-to-root) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "x")
     'neotree-close-up-node) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "SPC")
     'neotree-enter) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "q")
     'neotree-hide) 
   (define-key 
     evil-normal-state-local-map 
     (kbd 
      "RET")
     'neotree-enter)))

(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode 
  (lambda () 
    (highlight-parentheses-mode 
     t)))
(global-highlight-parentheses-mode 
 t)

(defun my-go-mode-hook ()               ; Call Gofmt before saving
  (add-hook 
   'before-save-hook
   'gofmt-before-save))

(add-hook 
 'go-mode-hook
 'my-go-mode-hook)

(defun qiang-comment-dwim-line 
    (&optional 
     arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line." 
  (interactive 
   "*P") 
  (comment-normalize-vars) 
  (if 
      (and 
       (not 
        (region-active-p)) 
       (not 
        (looking-at 
         "[ \t]*$"))) 
      (comment-or-uncomment-region 
       (line-beginning-position) 
       (line-end-position)) 
    (comment-dwim 
     arg)))
(global-set-key 
 "\M-;"
 'qiang-comment-dwim-line)
