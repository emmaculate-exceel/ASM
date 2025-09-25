;;; init.el --- Refined Emacs Configuration
;;; Commentary:
;;; A clean, organized Emacs configuration with proper package management

;;; Code:

;; ============================================================================
;; PACKAGE MANAGEMENT
;; ============================================================================

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Configure use-package with straight.el
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; ============================================================================
;; CORE EDITOR SETTINGS
;; ============================================================================

;; Display line numbers globally
(global-display-line-numbers-mode 1)

;; File handling - disable auto-save and backups
(setq auto-save-default nil              ; No #file# auto-save files
      make-backup-files nil              ; No ~file~ backup files  
      auto-save-list-file-prefix nil     ; No .saves-* files
      create-lockfiles nil)              ; No .#file lock files

;; ============================================================================
;; INDENTATION & WHITESPACE
;; ============================================================================

;; Default indentation settings
(setq-default tab-width 4                ; Display tabs as 4 columns
              indent-tabs-mode t          ; Use actual tab characters
              standard-indent 4)          ; Default indentation level

;; Language-specific indentation
(setq python-indent-offset 4             ; Python
      js-indent-level 2                  ; JavaScript
      typescript-indent-level 2          ; TypeScript
      css-indent-offset 2                ; CSS
      web-mode-markup-indent-offset 2    ; HTML (web-mode)
      sgml-basic-offset 2                ; HTML (built-in)
      java-indent-level 4                ; Java
      c-basic-offset 4                   ; C/C++
      ruby-indent-level 2                ; Ruby (2 is more common)
      lua-indent-level 2                 ; Lua
      sh-basic-offset 2                  ; Shell scripts
      json-reformat:indent-width 2       ; JSON
      yaml-indent-offset 2)              ; YAML

;; Python-specific configuration (Python strongly prefers spaces per PEP 8)
(defun my-python-mode-settings ()
  "Configure Python-specific settings."
  (setq-local tab-width 4
              python-indent-offset 4
              indent-tabs-mode nil))     ; Python PEP 8 requires spaces

(add-hook 'python-mode-hook #'my-python-mode-settings)

;; Whitespace visualization
(use-package whitespace
  :config
  (setq whitespace-style '(face trailing tabs tab-mark))
  (set-face-attribute 'whitespace-trailing nil 
                      :background "red" 
                      :foreground "white")
  (set-face-attribute 'whitespace-tab nil 
                      :background nil 
                      :foreground "gray30")
  :hook (prog-mode . whitespace-mode))

;; Optional: Clean trailing whitespace on save
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ============================================================================
;; AI ASSISTANCE
;; ============================================================================

;; GitHub Copilot integration
;;(use-package copilot
;;  :straight (copilot :type git :host github :repo "copilot-emacs/copilot.el")
;;  :hook (prog-mode . copilot-mode)
;;  :bind (:map copilot-mode-map
;;             ("C-<tab>" . copilot-accept-completion)
;;              ("C-c c a" . copilot-accept-completion)
;;              ("C-c c n" . copilot-next-completion)
;;              ("C-c c p" . copilot-previous-completion)))

;; ============================================================================
;; APPEARANCE & THEME
;; ============================================================================

;; Load theme
;;(load-theme 'modus-vivendi-tinted t)

;; Frame appearance settings
(setq-default frame-background-mode 'dark)

;; Background color and transparency
(add-to-list 'default-frame-alist '(background-color . "#282a36"))
(add-to-list 'default-frame-alist '(alpha-background . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

;; Ensure background color is set
(set-face-background 'default "#282a36")

;; Set transparency for current frame
(when (display-graphic-p)
  (set-frame-parameter (selected-frame) 'alpha '(85 . 85)))

;; ============================================================================
;; UTILITY FUNCTIONS
;; ============================================================================

;; Toggle transparency function
(defun my-toggle-transparency ()
  "Toggle between transparent and opaque background."
  (interactive)
  (let ((current (or (frame-parameter nil 'alpha-background) 100)))
    (set-frame-parameter nil 'alpha-background 
                        (if (= current 100) 70 100))
    (message "Background transparency: %s" 
             (if (= current 100) "70%" "100%"))))

;; Bind transparency toggle
(global-set-key (kbd "C-c t") #'my-toggle-transparency)

;; ============================================================================
;; PERFORMANCE & STARTUP
;; ============================================================================

;; Increase garbage collection threshold during startup
(setq gc-cons-threshold (* 50 1000 1000))

;; Reset garbage collection threshold after startup
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 2 1000 1000))))

;; ============================================================================
;; ADDITIONAL PACKAGES (Optional - uncomment to enable)
;; ============================================================================

;; Enhanced completion framework
;; (use-package vertico
;;   :init (vertico-mode))

;; Better minibuffer completion
;; (use-package marginalia
;;   :init (marginalia-mode))

;; Fuzzy matching for completion
;; (use-package orderless
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-overrides '((file (styles basic partial-completion)))))

;; Project management
;; (use-package projectile
;;   :config (projectile-mode +1)
;;   :bind-keymap ("C-c p" . projectile-command-map))

;; Git integration  
;; (use-package magit
;;   :bind ("C-x g" . magit-status))

;; Syntax checking
;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; ============================================================================
;; FINAL MESSAGE
;; ============================================================================

(message "Emacs configuration loaded successfully!")

;;; init.el ends here
