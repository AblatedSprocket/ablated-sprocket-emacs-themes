;;;; as-theme.el --- My themes for Emacs -*- lexical-binding: t -*-

;; Copyright (c) 2013 Lee Machin
;; Copyright (c) 2013-2016 Eduardo Lavaque
;; Copyright (c) 2016-2017 Jason Milkins
;; Copyright (c) 2017-2018 Martijn Terpstra
;; Copyright (c) 2021 Andrew Burch

;; Author: Andrew Burch <andrewwburch@gmail.com>
;; (current maintainer)
;;
;; URL: http://github.com/ablatedsprocket/ablated-sprocket-emacs-themes.git
;; Version: 1.0.0

;; Package-Requires: ((autothemer "0.2"))

;;; Credits:

;; Lee Machin created the codebase this theme was adapted to.
;; Greduan developed further adding support for several major modes.

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))
;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(defmacro as-deftheme (name description palette &rest body)
  `(autothemer-deftheme
    ,name
    ,description
    ,palette
    ((default                                   (:background as-theme-bg :foreground as-theme-light0))
     (cursor                                    (:background as-theme-light0))
     (mode-line                                 (:background as-theme-dark3 :foreground as-theme-light2 :box nil))
     (mode-line-inactive                        (:background as-theme-dark1 :foreground as-theme-light4 :box nil))
     (fringe                                    (:background as-theme-bg))
     (hl-line                                   (:background as-theme-dark1))
     (region                                    (:background as-theme-dark2)) ;;selection
     (secondary-selection                       (:background as-theme-dark1))
     (minibuffer-prompt                         (:background as-theme-bg :foreground as-theme-bright_green :bold t))
     (vertical-border                           (:foreground as-theme-dark2))
     (internal-border                           (:background as-theme-dark2))
     (window-divider                            (:foreground as-theme-dark2))
     (link                                      (:foreground as-theme-faded_blue :underline t))
     (shadow                                    (:foreground as-theme-dark4))

     ;; Built-in syntax

     (font-lock-builtin-face                            (:foreground as-theme-bright_orange))
     (font-lock-constant-face                           (:foreground as-theme-bright_purple))
     (font-lock-comment-face                            (:foreground as-theme-dark4))
     (font-lock-function-name-face                      (:foreground as-theme-bright_yellow))
     (font-lock-keyword-face                            (:foreground as-theme-bright_red))
     (font-lock-string-face                             (:foreground as-theme-bright_green))
     (font-lock-variable-name-face                      (:foreground as-theme-bright_blue))
     (font-lock-type-face                               (:foreground as-theme-bright_purple))
     (font-lock-warning-face                            (:foreground as-theme-bright_red :bold t))

     ;; Basic faces
     (error                                             (:foreground as-theme-bright_red :bold t))
     (success                                           (:foreground as-theme-bright_green :bold t))
     (warning                                           (:foreground as-theme-bright_yellow :bold t))
     (alert-low-face                                    (:foreground as-theme-bright_blue))
     (trailing-whitespace                               (:background as-theme-bright_red))
     (escape-glyph                                      (:foreground as-theme-bright_aqua))
     (header-line                                       (:background as-theme-dark0 :foreground as-theme-light3 :box nil :inherit nil))
     (highlight                                         (:background as-theme-dark4 :foreground as-theme-light0))
     (homoglyph                                         (:foreground as-theme-bright_yellow))
     (match                                             (:foreground as-theme-dark0 :background as-theme-bright_blue))

     ;; Customize faces
     (widget-field                                      (:background as-theme-dark3))
     (custom-group-tag                                  (:foreground as-theme-bright_blue :weight 'bold))
     (custom-variable-tag                               (:foreground as-theme-bright_blue :weight 'bold))

     ;; whitespace-mode

     (whitespace-space                          (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-hspace                         (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-tab                            (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-newline                        (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-trailing                       (:background as-theme-dark1 :foreground as-theme-bright_red))
     (whitespace-line                           (:background as-theme-dark1 :foreground as-theme-bright_red))
     (whitespace-space-before-tab               (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-indentation                    (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-empty                          (:background nil :foreground nil))
     (whitespace-space-after-tab                (:background as-theme-bg :foreground as-theme-dark4))

     ;; RainbowDelimiters

     (rainbow-delimiters-depth-1-face           (:foreground as-theme-delimiter-one))
     (rainbow-delimiters-depth-2-face           (:foreground as-theme-delimiter-two))
     (rainbow-delimiters-depth-3-face           (:foreground as-theme-delimiter-three))
     (rainbow-delimiters-depth-4-face           (:foreground as-theme-delimiter-four))
     (rainbow-delimiters-depth-5-face           (:foreground as-theme-delimiter-one))
     (rainbow-delimiters-depth-6-face           (:foreground as-theme-delimiter-two))
     (rainbow-delimiters-depth-7-face           (:foreground as-theme-delimiter-three))
     (rainbow-delimiters-depth-8-face           (:foreground as-theme-delimiter-four))
     (rainbow-delimiters-depth-9-face           (:foreground as-theme-delimiter-one))
     (rainbow-delimiters-depth-10-face          (:foreground as-theme-delimiter-two))
     (rainbow-delimiters-depth-11-face          (:foreground as-theme-delimiter-three))
     (rainbow-delimiters-depth-12-face          (:foreground as-theme-delimiter-four))
     (rainbow-delimiters-unmatched-face         (:background nil :foreground as-theme-light0))


     ;; line numbers
     (line-number                               (:foreground as-theme-dark4 :background as-theme-dark1))
     (line-number-current-line                  (:foreground as-theme-bright_orange :background as-theme-dark2))
     (linum                                     (:foreground as-theme-dark4 :background as-theme-dark1))
     (linum-highlight-face                      (:foreground as-theme-bright_orange :background as-theme-dark2))
     (linum-relative-current-face               (:foreground as-theme-bright_orange :background as-theme-dark2))

     ;; Highlight indentation mode
     (highlight-indentation-current-column-face (:background as-theme-dark2))
     (highlight-indentation-face                (:background as-theme-dark1))

     ;; smartparens
     (sp-pair-overlay-face                      (:background as-theme-dark2))
     (sp-show-pair-match-face                   (:background as-theme-dark2)) ;; Pair tags highlight
     (sp-show-pair-mismatch-face                (:background as-theme-bright_red)) ;; Highlight for bracket without pair
     ;;(sp-wrap-overlay-face                     (:inherit 'sp-wrap-overlay-face))
     ;;(sp-wrap-tag-overlay-face                 (:inherit 'sp-wrap-overlay-face))

     ;; elscreen
     (elscreen-tab-background-face              (:background as-theme-bg :box nil)) ;; Tab bar, not the tabs
     (elscreen-tab-control-face                 (:background as-theme-dark2 :foreground as-theme-bright_red :underline nil :box nil)) ;; The controls
     (elscreen-tab-current-screen-face          (:background as-theme-dark4 :foreground as-theme-dark0 :box nil)) ;; Current tab
     (elscreen-tab-other-screen-face            (:background as-theme-dark2 :foreground as-theme-light4 :underline nil :box nil)) ;; Inactive tab

     ;; ag (The Silver Searcher)
     (ag-hit-face                               (:foreground as-theme-bright_blue))
     (ag-match-face                             (:foreground as-theme-bright_red))

     ;; Diffs
     (diff-header                               (:background as-theme-dark1))
     (diff-file-header                          (:background as-theme-dark2))
     (diff-hunk-header                          (:background as-theme-dark2))
     (diff-context                              (:background as-theme-dark1 :foreground as-theme-light1))
     (diff-added                                (:background nil :foreground as-theme-neutral_green))
     (diff-refine-added                         (:background nil :foreground as-theme-bright_green))
     (diff-removed                              (:background nil :foreground as-theme-neutral_red))
     (diff-refine-removed                       (:background nil :foreground as-theme-bright_red))
     (diff-indicator-changed                    (:inherit 'diff-changed))
     (diff-indicator-added                      (:inherit 'diff-added))
     (diff-indicator-removed                    (:inherit 'diff-removed))

     ;; Ediff
     (ediff-even-diff-A                         (:background as-theme-dark1))
     (ediff-even-diff-B                         (:background as-theme-dark1))
     (ediff-even-diff-C                         (:background as-theme-dark1))
     (ediff-even-diff-Ancestor                  (:background as-theme-dark1))
     (ediff-odd-diff-A                          (:background as-theme-dark2))
     (ediff-odd-diff-B                          (:background as-theme-dark2))
     (ediff-odd-diff-C                          (:background as-theme-dark2))
     (ediff-odd-diff-Ancestor                   (:background as-theme-dark2))

     (ediff-fine-diff-A                         (:background as-theme-ediff-fine-diff-A))
     (ediff-fine-diff-Ancestor                  (:background as-theme-ediff-fine-diff-Ancestor))
     (ediff-fine-diff-B                         (:background as-theme-ediff-fine-diff-B))
     (ediff-fine-diff-C                         (:background as-theme-ediff-fine-diff-C))
     (ediff-current-diff-A                      (:background as-theme-ediff-current-diff-A))
     (ediff-current-diff-Ancestor               (:background as-theme-ediff-current-diff-Ancestor))
     (ediff-current-diff-B                      (:background as-theme-ediff-current-diff-B))
     (ediff-current-diff-C                      (:background as-theme-ediff-current-diff-C))

     (js2-warning                               (:underline (:color as-theme-bright_yellow :style 'wave)))
     (js2-error                                 (:underline (:color as-theme-bright_red :style 'wave)))
     (js2-external-variable                     (:underline (:color as-theme-bright_aqua :style 'wave)))
     (js2-jsdoc-tag                             (:background nil :foreground as-theme-gray  ))
     (js2-jsdoc-type                            (:background nil :foreground as-theme-light4))
     (js2-jsdoc-value                           (:background nil :foreground as-theme-light3))
     (js2-function-param                        (:background nil :foreground as-theme-bright_aqua))
     (js2-function-call                         (:background nil :foreground as-theme-bright_blue))
     (js2-instance-member                       (:background nil :foreground as-theme-bright_orange))
     (js2-private-member                        (:background nil :foreground as-theme-faded_yellow))
     (js2-private-function-call                 (:background nil :foreground as-theme-faded_aqua))
     (js2-jsdoc-html-tag-name                   (:background nil :foreground as-theme-light4))
     (js2-jsdoc-html-tag-delimiter              (:background nil :foreground as-theme-light3))

     ;; popup
     (popup-face                                (:underline nil :foreground as-theme-light1 :background as-theme-dark1))
     (popup-menu-mouse-face                     (:underline nil :foreground as-theme-light0 :background as-theme-faded_green))
     (popup-menu-selection-face                 (:underline nil :foreground as-theme-light0 :background as-theme-faded_green))
     (popup-tip-face                            (:underline nil :foreground as-theme-light2 :background as-theme-dark2))

     ;; helm
     (helm-M-x-key                              (:foreground as-theme-bright_orange ))
     (helm-action                               (:foreground as-theme-light0_hard :underline t))
     (helm-bookmark-addressbook                 (:foreground as-theme-bright_red))
     (helm-bookmark-directory                   (:foreground as-theme-bright_purple))
     (helm-bookmark-file                        (:foreground as-theme-faded_blue))
     (helm-bookmark-gnus                        (:foreground as-theme-faded_purple))
     (helm-bookmark-info                        (:foreground as-theme-turquoise4))
     (helm-bookmark-man                         (:foreground as-theme-sienna))
     (helm-bookmark-w3m                         (:foreground as-theme-bright_yellow))
     (helm-buffer-directory                     (:foreground as-theme-white :background as-theme-bright_blue))
     (helm-buffer-not-saved                     (:foreground as-theme-faded_red))
     (helm-buffer-process                       (:foreground as-theme-burlywood4))
     (helm-buffer-saved-out                     (:foreground as-theme-bright_red))
     (helm-buffer-size                          (:foreground as-theme-bright_purple))
     (helm-candidate-number                     (:foreground as-theme-bright_green))
     (helm-eshell-prompts-buffer-name           (:foreground as-theme-bright_green))
     (helm-eshell-prompts-promptidx             (:foreground as-theme-turquoise4))
     (helm-ff-directory                         (:foreground as-theme-bright_purple))
     (helm-ff-executable                        (:foreground as-theme-turquoise4))
     (helm-ff-file                              (:foreground as-theme-sienna))
     (helm-ff-invalid-symlink                   (:foreground as-theme-white :background as-theme-bright_red))
     (helm-ff-prefix                            (:foreground as-theme-black :background as-theme-bright_yellow))
     (helm-ff-symlink                           (:foreground as-theme-bright_orange))
     (helm-grep-cmd-line                        (:foreground as-theme-bright_green))
     (helm-grep-file                            (:foreground as-theme-faded_purple))
     (helm-grep-finish                          (:foreground as-theme-turquoise4))
     (helm-grep-lineno                          (:foreground as-theme-bright_orange))
     (helm-grep-match                           (:foreground as-theme-bright_yellow))
     (helm-grep-running                         (:foreground as-theme-bright_red))
     (helm-header                               (:foreground as-theme-aquamarine4))
     (helm-helper                               (:foreground as-theme-aquamarine4))
     (helm-history-deleted                      (:foreground as-theme-black :background as-theme-bright_red))
     (helm-history-remote                       (:foreground as-theme-faded_red))
     (helm-lisp-completion-info                 (:foreground as-theme-faded_orange))
     (helm-lisp-show-completion                 (:foreground as-theme-bright_red))
     (helm-locate-finish                        (:foreground as-theme-white :background as-theme-aquamarine4))
     (helm-match                                (:foreground as-theme-bright_orange))
     (helm-moccur-buffer                        (:foreground as-theme-bright_aqua :underline t))
     (helm-prefarg                              (:foreground as-theme-turquoise4))
     (helm-selection                            (:foreground as-theme-white :background as-theme-dark2))
     (helm-selection-line                       (:foreground as-theme-white :background as-theme-dark2))
     (helm-separator                            (:foreground as-theme-faded_red))
     (helm-source-header                        (:foreground as-theme-light2))
     (helm-visible-mark                         (:foreground as-theme-black :background as-theme-light3))

     ;; helm-rg
     (helm-rg-preview-line-highlight              (:foreground as-theme-black :background as-theme-bright_green))
     (helm-rg-base-rg-cmd-face                    (:foreground as-theme-light2))
     (helm-rg-extra-arg-face                      (:foreground as-theme-bright_yellow))
     (helm-rg-inactive-arg-face                   (:foreground as-theme-faded_aqua))
     (helm-rg-active-arg-face                     (:foreground as-theme-bright_green))
     (helm-rg-directory-cmd-face                  (:foreground as-theme-burlywood4 :background as-theme-black))
     (helm-rg-error-message                       (:foreground as-theme-bright_red))
     (helm-rg-title-face                          (:foreground as-theme-bright_purple))
     (helm-rg-directory-header-face               (:foreground as-theme-white :background as-theme-dark1))
     (helm-rg-file-match-face                     (:foreground as-theme-turquoise4))
     (helm-rg-colon-separator-ripgrep-output-face (:foreground as-theme-dark3 :background as-theme-bg))
     (helm-rg-line-number-match-face              (:foreground as-theme-faded_orange))
     (helm-rg-match-text-face                     (:foreground as-theme-white :background as-theme-bright_purple))

     ;; hi-lock-mode
     (hi-black-b                                (:foreground as-theme-black :weight 'bold))
     (hi-black-hb                               (:foreground as-theme-black :weight 'bold :height 1.5))
     (hi-blue                                   (:foreground as-theme-dark0 :background as-theme-bright_blue))
     (hi-blue-b                                 (:foreground as-theme-bright_blue :weight 'bold))
     (hi-green                                  (:foreground as-theme-dark0 :background as-theme-bright_green))
     (hi-green-b                                (:foreground as-theme-bright_green :weight 'bold))
     (hi-pink                                   (:foreground as-theme-dark0 :background as-theme-bright_purple))
     (hi-red-b                                  (:foreground as-theme-bright_red :weight 'bold))
     (hi-yellow                                 (:foreground as-theme-dark0 :background as-theme-faded_yellow))

     ;; company-mode
     (company-scrollbar-bg                      (:background as-theme-dark2))
     (company-scrollbar-fg                      (:background as-theme-dark1))
     (company-tooltip                           (:background as-theme-dark1))
     (company-tooltip-annotation                (:foreground as-theme-bright_green))
     (company-tooltip-annotation-selection      (:inherit 'company-tooltip-annotation))
     (company-tooltip-selection                 (:foreground as-theme-bright_purple :background as-theme-dark2))
     (company-tooltip-common                    (:foreground as-theme-bright_blue :underline t))
     (company-tooltip-common-selection          (:foreground as-theme-bright_blue :underline t))
     (company-preview-common                    (:foreground as-theme-light0))
     (company-preview                           (:background as-theme-lightblue4))
     (company-preview-search                    (:background as-theme-turquoise4))
     (company-template-field                    (:foreground as-theme-black :background as-theme-bright_yellow))
     (company-echo-common                       (:foreground as-theme-faded_red))

     ;; tool tips
     (tooltip                                   (:foreground as-theme-light1 :background as-theme-dark1))

     ;; marginalia
     (marginalia-documentation                  (:italic t :foreground as-theme-light3))
     
     ;; corfu
     (corfu-background                          (:background as-theme-dark1))
     (corfu-current                             (:foreground as-theme-bright_purple :background as-theme-dark2))
     (corfu-bar                                 (:background as-theme-dark2))
     (corfu-border                              (:background as-theme-dark1))

     ;; term
     (term-color-black                          (:foreground as-theme-dark2 :background as-theme-dark1))
     (term-color-blue                           (:foreground as-theme-bright_blue :background as-theme-bright_blue))
     (term-color-cyan                           (:foreground as-theme-bright_aqua :background as-theme-bright_aqua))
     (term-color-green                          (:foreground as-theme-bright_green :background as-theme-bright_green))
     (term-color-magenta                        (:foreground as-theme-bright_purple :background as-theme-bright_purple))
     (term-color-red                            (:foreground as-theme-bright_red :background as-theme-bright_red))
     (term-color-white                          (:foreground as-theme-light1 :background as-theme-light1))
     (term-color-yellow                         (:foreground as-theme-bright_yellow :background as-theme-bright_yellow))
     (term-default-fg-color                     (:foreground as-theme-light0))
     (term-default-bg-color                     (:background as-theme-bg))

     ;; message-mode
     (message-header-to                         (:inherit 'font-lock-variable-name-face))
     (message-header-cc                         (:inherit 'font-lock-variable-name-face))
     (message-header-subject                    (:foreground as-theme-bright_orange :weight 'bold))
     (message-header-newsgroups                 (:foreground as-theme-bright_yellow :weight 'bold))
     (message-header-other                      (:inherit 'font-lock-variable-name-face))
     (message-header-name                       (:inherit 'font-lock-keyword-face))
     (message-header-xheader                    (:foreground as-theme-faded_blue))
     (message-separator                         (:inherit 'font-lock-comment-face))
     (message-cited-text                        (:inherit 'font-lock-comment-face))
     (message-mml                               (:foreground as-theme-faded_green :weight 'bold))

     ;; org-mode
     (org-hide                                  (:foreground as-theme-dark0))
     (org-level-1                               (:foreground as-theme-bright_blue))
     (org-level-2                               (:foreground as-theme-bright_yellow))
     (org-level-3                               (:foreground as-theme-bright_purple))
     (org-level-4                               (:foreground as-theme-bright_red))
     (org-level-5                               (:foreground as-theme-bright_green))
     (org-level-6                               (:foreground as-theme-bright_aqua))
     (org-level-7                               (:foreground as-theme-faded_blue))
     (org-level-8                               (:foreground as-theme-bright_orange))
     (org-special-keyword                       (:inherit 'font-lock-comment-face))
     (org-drawer                                (:inherit 'font-lock-function-name-face))
     (org-column                                (:background as-theme-dark0))
     (org-column-title                          (:background as-theme-dark0 :underline t :weight 'bold))
     (org-warning                               (:foreground as-theme-bright_red :weight 'bold :underline nil :bold t))
     (org-archived                              (:foreground as-theme-light0 :weight 'bold))
     (org-link                                  (:foreground as-theme-faded_aqua :underline t))
     (org-footnote                              (:foreground as-theme-bright_aqua :underline t))
     (org-ellipsis                              (:foreground as-theme-light4))
     (org-date                                  (:foreground as-theme-bright_blue :underline t))
     (org-sexp-date                             (:foreground as-theme-faded_blue :underline t))
     (org-tag                                   (:bold t :weight 'bold))
     (org-list-dt                               (:bold t :weight 'bold))
     (org-todo                                  (:foreground as-theme-bright_red :weight 'bold :bold t))
     (org-done                                  (:foreground as-theme-bright_aqua :weight 'bold :bold t))
     (org-agenda-done                           (:foreground as-theme-bright_aqua))
     (org-headline-done                         (:foreground as-theme-bright_aqua))
     (org-table                                 (:foreground as-theme-bright_blue))
     (org-block                                 (:background as-theme-dark0_soft))
     (org-block-begin-line                      (:background as-theme-dark1))
     (org-block-end-line                        (:background as-theme-dark1))
     (org-formula                               (:foreground as-theme-bright_yellow))
     (org-document-title                        (:foreground as-theme-faded_blue))
     (org-document-info                         (:foreground as-theme-faded_blue))
     (org-agenda-structure                      (:inherit 'font-lock-comment-face))
     (org-agenda-date-today                     (:foreground as-theme-light0 :weight 'bold :italic t))
     (org-scheduled                             (:foreground as-theme-bright_yellow))
     (org-scheduled-today                       (:foreground as-theme-bright_blue))
     (org-scheduled-previously                  (:foreground as-theme-faded_red))
     (org-upcoming-deadline                     (:inherit 'font-lock-keyword-face))
     (org-deadline-announce                     (:foreground as-theme-faded_red))
     (org-time-grid                             (:foreground as-theme-faded_orange))
     (org-latex-and-related                     (:foreground as-theme-bright_blue))

     ;; org-habit
     (org-habit-clear-face                      (:background as-theme-faded_blue))
     (org-habit-clear-future-face               (:background as-theme-bright_blue))
     (org-habit-ready-face                      (:background as-theme-faded_green))
     (org-habit-ready-future-face               (:background as-theme-bright_green))
     (org-habit-alert-face                      (:background as-theme-faded_yellow))
     (org-habit-alert-future-face               (:background as-theme-bright_yellow))
     (org-habit-overdue-face                    (:background as-theme-faded_red))
     (org-habit-overdue-future-face             (:background as-theme-bright_red))

     ;; elfeed
     (elfeed-search-title-face                  (:foreground as-theme-gray  ))
     (elfeed-search-unread-title-face           (:foreground as-theme-light0))
     (elfeed-search-date-face                   (:inherit 'font-lock-builtin-face :underline t))
     (elfeed-search-feed-face                   (:inherit 'font-lock-variable-name-face))
     (elfeed-search-tag-face                    (:inherit 'font-lock-keyword-face))
     (elfeed-search-last-update-face            (:inherit 'font-lock-comment-face))
     (elfeed-search-unread-count-face           (:inherit 'font-lock-comment-face))
     (elfeed-search-filter-face                 (:inherit 'font-lock-string-face))

     ;; smart-mode-line
     (sml/global                                (:foreground as-theme-light4 :inverse-video nil))
     (sml/modes                                 (:foreground as-theme-bright_green))
     (sml/filename                              (:foreground as-theme-bright_red :weight 'bold))
     (sml/prefix                                (:foreground as-theme-light1))
     (sml/read-only                             (:foreground as-theme-bright_blue))
     (persp-selected-face                       (:foreground as-theme-bright_orange))

     ;; powerline
     (powerline-active0                         (:background as-theme-dark4 :foreground as-theme-light0))
     (powerline-active1                         (:background as-theme-dark3 :foreground as-theme-light0))
     (powerline-active2                         (:background as-theme-dark2 :foreground as-theme-light0))
     (powerline-inactive0                       (:background as-theme-dark2 :foreground as-theme-light4))
     (powerline-inactive1                       (:background as-theme-dark1 :foreground as-theme-light4))
     (powerline-inactive2                       (:background as-theme-dark0 :foreground as-theme-light4))

     ;; isearch
     (isearch                                   (:foreground as-theme-black :background as-theme-bright_orange))
     (lazy-highlight                            (:foreground as-theme-black :background as-theme-bright_yellow))
     (isearch-fail                              (:foreground as-theme-light0 :background as-theme-bright_red))

     ;; markdown-mode
     (markdown-header-face-1                    (:foreground as-theme-bright_blue))
     (markdown-header-face-2                    (:foreground as-theme-bright_yellow))
     (markdown-header-face-3                    (:foreground as-theme-bright_purple))
     (markdown-header-face-4                    (:foreground as-theme-bright_red))
     (markdown-header-face-5                    (:foreground as-theme-bright_green))
     (markdown-header-face-6                    (:foreground as-theme-bright_aqua))

     ;; anzu-mode
     (anzu-mode-line                            (:foreground as-theme-bright_yellow :weight 'bold))
     (anzu-match-1                              (:background as-theme-bright_green))
     (anzu-match-2                              (:background as-theme-faded_yellow))
     (anzu-match-3                              (:background as-theme-aquamarine4))
     (anzu-replace-to                           (:foreground as-theme-bright_yellow))
     (anzu-replace-highlight                    (:inherit 'isearch))

     ;; ace-jump-mode
     (ace-jump-face-background                  (:foreground as-theme-light4 :background as-theme-bg :inverse-video nil))
     (ace-jump-face-foreground                  (:foreground as-theme-bright_red :background as-theme-bg :inverse-video nil))

     ;; ace-window
     (aw-background-face                        (:foreground as-theme-light1 :background as-theme-bg :inverse-video nil))
     (aw-leading-char-face                      (:foreground as-theme-bright_red :background as-theme-bg :height 4.0))

     ;; show-paren
     (show-paren-match                          (:background as-theme-dark3 :foreground as-theme-bright_blue  :weight 'bold))
     (show-paren-mismatch                       (:background as-theme-bright_red :foreground as-theme-dark3 :weight 'bold))

     ;; ivy
     (ivy-current-match                         (:foreground as-theme-light0_hard :weight 'bold :underline t))
     (ivy-minibuffer-match-face-1               (:foreground as-theme-bright_orange))
     (ivy-minibuffer-match-face-2               (:foreground as-theme-bright_yellow))
     (ivy-minibuffer-match-face-3               (:foreground as-theme-faded_orange))
     (ivy-minibuffer-match-face-4               (:foreground as-theme-faded_yellow))

     ;; ido
     (ido-only-match                            (:inherit 'success))
     (ido-first-match                           (:foreground as-theme-light0_hard :weight 'bold :underline t))
     (ido-subdir                                (:inherit 'dired-directory))

     ;; magit
     (magit-bisect-bad                          (:foreground as-theme-faded_red))
     (magit-bisect-good                         (:foreground as-theme-faded_green))
     (magit-bisect-skip                         (:foreground as-theme-faded_yellow))
     (magit-blame-heading                       (:foreground as-theme-light0 :background as-theme-dark2))
     (magit-branch-local                        (:foreground as-theme-bright_blue))
     (magit-branch-current                      (:underline as-theme-bright_blue :inherit 'magit-branch-local))
     (magit-branch-remote                       (:foreground as-theme-bright_green))
     (magit-cherry-equivalent                   (:foreground as-theme-bright_purple))
     (magit-cherry-unmatched                    (:foreground as-theme-bright_aqua))
     (magit-diff-added                          (:foreground as-theme-bright_green))
     (magit-diff-added-highlight                (:foreground as-theme-bright_green :inherit 'magit-diff-context-highlight))
     (magit-diff-base                           (:background as-theme-faded_yellow :foreground as-theme-light2))
     (magit-diff-base-highlight                 (:background as-theme-faded_yellow :foreground as-theme-light0))
     (magit-diff-context                        (:foreground as-theme-dark1  :foreground as-theme-light1))
     (magit-diff-context-highlight              (:background as-theme-dark1 :foreground as-theme-light0))
     (magit-diff-hunk-heading                   (:background as-theme-dark3 :foreground as-theme-light2))
     (magit-diff-hunk-heading-highlight         (:background as-theme-dark2 :foreground as-theme-light0))
     (magit-diff-hunk-heading-selection         (:background as-theme-dark2 :foreground as-theme-bright_orange))
     (magit-diff-lines-heading                  (:background as-theme-faded_orange :foreground as-theme-light0))
     (magit-diff-removed                        (:foreground as-theme-bright_red))
     (magit-diff-removed-highlight              (:foreground as-theme-bright_red :inherit 'magit-diff-context-highlight))
     (magit-diffstat-added                      (:foreground as-theme-faded_green))
     (magit-diffstat-removed                    (:foreground as-theme-faded_red))
     (magit-dimmed                              (:foreground as-theme-dark4))
     (magit-hash                                (:foreground as-theme-bright_blue))
     (magit-log-author                          (:foreground as-theme-bright_red))
     (magit-log-date                            (:foreground as-theme-bright_aqua))
     (magit-log-graph                           (:foreground as-theme-dark4))
     (magit-process-ng                          (:foreground as-theme-bright_red :weight 'bold))
     (magit-process-ok                          (:foreground as-theme-bright_green :weight 'bold))
     (magit-reflog-amend                        (:foreground as-theme-bright_purple))
     (magit-reflog-checkout                     (:foreground as-theme-bright_blue))
     (magit-reflog-cherry-pick                  (:foreground as-theme-bright_green))
     (magit-reflog-commit                       (:foreground as-theme-bright_green))
     (magit-reflog-merge                        (:foreground as-theme-bright_green))
     (magit-reflog-other                        (:foreground as-theme-bright_aqua))
     (magit-reflog-rebase                       (:foreground as-theme-bright_purple))
     (magit-reflog-remote                       (:foreground as-theme-bright_blue))
     (magit-reflog-reset                        (:foreground as-theme-bright_red))
     (magit-refname                             (:foreground as-theme-light4))
     (magit-section-heading                     (:foreground as-theme-bright_yellow :weight 'bold))
     (magit-section-heading-selection           (:foreground as-theme-faded_yellow))
     (magit-section-highlight                   (:background as-theme-dark1))
     (magit-sequence-drop                       (:foreground as-theme-faded_yellow))
     (magit-sequence-head                       (:foreground as-theme-bright_aqua))
     (magit-sequence-part                       (:foreground as-theme-bright_yellow))
     (magit-sequence-stop                       (:foreground as-theme-bright_green))
     (magit-signature-bad                       (:foreground as-theme-bright_red :weight 'bold))
     (magit-signature-error                     (:foreground as-theme-bright_red))
     (magit-signature-expired                   (:foreground as-theme-bright_orange))
     (magit-signature-good                      (:foreground as-theme-bright_green))
     (magit-signature-revoked                   (:foreground as-theme-bright_purple))
     (magit-signature-untrusted                 (:foreground as-theme-bright_blue))
     (magit-tag                                 (:foreground as-theme-bright_yellow))

     ;; cider
     (cider-debug-code-overlay-face             (:background as-theme-dark2 :foreground as-theme-light0))
     (cider-deprecated-face                     (:background as-theme-dark2 :foreground as-theme-bright_orange))
     (cider-enlightened-local-face              (:foreground as-theme-bright_orange :weight 'bold))
     (cider-error-highlight-face                (:foreground as-theme-bright_red :underline t :style 'wave))
     (cider-fringe-good-face                    (:foreground as-theme-neutral_green))
     (cider-instrumented-face                   (:background as-theme-dark1 :box (:line-width -1 :color as-theme-bright_red)))
     (cider-result-overlay-face                 (:background as-theme-dark2 :box (:line-width -1 :color as-theme-bright_yellow)))
     (cider-test-error-face                     (:background as-theme-faded_red))
     (cider-test-error-face                     (:background as-theme-neutral_orange))
     (cider-test-success-face                   (:background as-theme-bright_green))
     (cider-traced                              (:background as-theme-bright_aqua))
     (cider-warning-highlight-face              (:foreground as-theme-bright_yellow :underline t :style 'wave))

     ;; git-gutter
     (git-gutter:modified                       (:background as-theme-faded_blue :foreground as-theme-faded_blue))
     (git-gutter:added                          (:background as-theme-faded_green :foreground as-theme-faded_green))
     (git-gutter:deleted                        (:background as-theme-faded_red :foreground as-theme-faded_red))

     ;; git-gutter+
     (git-gutter+-modified                      (:foreground as-theme-faded_blue :background as-theme-faded_blue))
     (git-gutter+-added                         (:foreground as-theme-faded_green :background as-theme-faded_green))
     (git-gutter+-deleted                       (:foreground as-theme-faded_red :background as-theme-faded_red))

     ;; git-gutter-fringe
     (git-gutter-fr:modified                    (:inherit 'git-gutter:modified))
     (git-gutter-fr:added                       (:inherit 'git-gutter:added))
     (git-gutter-fr:deleted                     (:inherit 'git-gutter:deleted))

     ;; diff-hl
     (diff-hl-change (:background as-theme-faded_blue :foreground as-theme-faded_blue))
     (diff-hl-delete (:background as-theme-faded_red :foreground as-theme-faded_red))
     (diff-hl-insert (:background as-theme-faded_green :foreground as-theme-faded_green))

     ;; flyspell
     (flyspell-duplicate                        (:underline (:color as-theme-light4 :style 'line)))
     (flyspell-incorrect                        (:underline (:color as-theme-bright_red :style 'line)))

     ;; langtool
     (langtool-errline                          (:foreground as-theme-dark0 :background as-theme-bright_red))
     (langtool-correction-face                  (:foreground as-theme-bright_yellow :weight 'bold))

     ;; latex
     (font-latex-bold-face                      (:foreground as-theme-faded_green :bold t))
     (font-latex-italic-face                    (:foreground as-theme-bright_green :underline t))
     (font-latex-math-face                      (:foreground as-theme-light3))
     (font-latex-script-char-face               (:foreground as-theme-faded_aqua))
     (font-latex-sectioning-5-face              (:foreground as-theme-bright_yellow :bold t))
     (font-latex-sedate-face                    (:foreground as-theme-light4))
     (font-latex-string-face                    (:foreground as-theme-bright_orange))
     (font-latex-verbatim-face                  (:foreground as-theme-light4))
     (font-latex-warning-face                   (:foreground as-theme-bright_red :weight 'bold))
     (preview-face                              (:background as-theme-dark1))

     ;; lsp
     (lsp-lsp-flycheck-warning-unnecessary-face (:underline (:color as-theme-bright_orange :style 'wave)
                                                            :foreground as-theme-burlywood4))
     (lsp-ui-doc-background                     (:background as-theme-dark3))
     (lsp-ui-doc-header                         (:background as-theme-faded_blue))
     (lsp-ui-peek-filename                      (:foreground as-theme-bright_red))
     (lsp-ui-sideline-code-action               (:foreground as-theme-bright_yellow))
     (lsp-ui-sideline-current-symbol            (:foreground as-theme-faded_aqua))
     (lsp-ui-sideline-symbol                    (:foreground as-theme-gray))

     ;; mu4e
     (mu4e-header-key-face                      (:foreground as-theme-bright_green :weight 'bold ))
     (mu4e-unread-face                          (:foreground as-theme-bright_blue :weight 'bold ))
     (mu4e-highlight-face                       (:foreground as-theme-bright_green))

     ;; shell script
     (sh-quoted-exec                            (:foreground as-theme-bright_purple))
     (sh-heredoc                                (:foreground as-theme-bright_orange))

     ;; undo-tree
     (undo-tree-visualizer-active-branch-face   (:foreground as-theme-light0))
     (undo-tree-visualizer-current-face         (:foreground as-theme-bright_red))
     (undo-tree-visualizer-default-face         (:foreground as-theme-dark4))
     (undo-tree-visualizer-register-face        (:foreground as-theme-bright_yellow))
     (undo-tree-visualizer-unmodified-face      (:foreground as-theme-bright_aqua))

     ;; widget faces
     (widget-button-pressed-face                (:foreground as-theme-bright_red))
     (widget-documentation-face                 (:foreground as-theme-faded_green))
     (widget-field                              (:foreground as-theme-light0 :background as-theme-dark2))
     (widget-single-line-field                  (:foreground as-theme-light0 :background as-theme-dark2))

     ;; dired+
     (diredp-file-name                          (:foreground as-theme-light2))
     (diredp-file-suffix                        (:foreground as-theme-light4))
     (diredp-compressed-file-suffix             (:foreground as-theme-faded_blue))
     (diredp-dir-name                           (:foreground as-theme-faded_blue))
     (diredp-dir-heading                        (:foreground as-theme-bright_blue))
     (diredp-symlink                            (:foreground as-theme-bright_orange))
     (diredp-date-time                          (:foreground as-theme-light3))
     (diredp-number                             (:foreground as-theme-faded_blue))
     (diredp-no-priv                            (:foreground as-theme-dark4))
     (diredp-other-priv                         (:foreground as-theme-dark2))
     (diredp-rare-priv                          (:foreground as-theme-dark4))
     (diredp-ignored-file-name                  (:foreground as-theme-dark4))

     (diredp-dir-priv                           (:foreground as-theme-faded_blue  :background as-theme-dark_blue))
     (diredp-exec-priv                          (:foreground as-theme-faded_blue  :background as-theme-dark_blue))
     (diredp-link-priv                          (:foreground as-theme-faded_aqua  :background as-theme-dark_aqua))
     (diredp-read-priv                          (:foreground as-theme-bright_red  :background as-theme-dark_red))
     (diredp-write-priv                         (:foreground as-theme-bright_aqua :background as-theme-dark_aqua))

     ;; diredfl
     (diredfl-autofile-name                     (:foreground as-theme-light2))
     (diredfl-compressed-file-name              (:foreground as-theme-light2))
     (diredfl-compressed-file-suffix            (:foreground as-theme-faded_blue))
     (diredfl-date-time                         (:foreground as-theme-bright_aqua))
     (diredfl-deletion                          (:foreground as-theme-bright_red :bold t))
     (diredfl-deletion-file-name                (:foreground as-theme-bright_red :bold t))
     (diredfl-dir-heading                       (:foreground as-theme-bright_blue :bold t))
     (diredfl-dir-name                          (:foreground as-theme-bright_blue))
     (diredfl-dir-priv                          (:foreground as-theme-bright_blue :background as-theme-dark_blue))
     (diredfl-exec-priv                         (:foreground as-theme-bright_blue :background as-theme-dark_blue))
     (diredfl-executable-tag                    (:foreground as-theme-bright_green))
     (diredfl-file-name                         (:foreground as-theme-light2))
     (diredfl-file-suffix                       (:foreground as-theme-light4))
     (diredfl-symlink                           (:foreground as-theme-bright_purple))
     (diredfl-flag-mark                         (:foreground as-theme-bright_yellow :background as-theme-dark3))
     (diredfl-flag-mark-line                    (:foreground as-theme-bright_yellow :background as-theme-dark2))
     (diredfl-ignored-file-name                 (:foreground as-theme-dark4))
     (diredfl-link-priv                         (:foreground as-theme-faded_purple))
     (diredfl-no-priv                           (:foreground as-theme-light2))
     (diredfl-number                            (:foreground as-theme-bright_yellow))
     (diredfl-other-priv                        (:foreground as-theme-bright_purple))
     (diredfl-rare-priv                         (:foreground as-theme-light2))
     (diredfl-read-priv                         (:foreground as-theme-bright_yellow))
     (diredfl-write-priv                        (:foreground as-theme-bright_red))
     (diredfl-tagged-autofile-name              (:foreground as-theme-light4))

     ;; neotree
     (neo-banner-face                           (:foreground as-theme-bright_purple :bold t))
     (neo-dir-link-face                         (:foreground as-theme-bright_yellow))
     (neo-expand-btn-face                       (:foreground as-theme-bright_orange))
     (neo-file-link-face                        (:foreground as-theme-light0))
     (neo-header-face                           (:foreground as-theme-bright_purple))
     (neo-root-dir-face                         (:foreground as-theme-bright_purple :bold t))

     ;; eshell
     (eshell-prompt                              (:foreground as-theme-bright_aqua))
     (eshell-ls-archive                          (:foreground as-theme-light3))
     (eshell-ls-backup                           (:foreground as-theme-light4))
     (eshell-ls-clutter                          (:foreground as-theme-bright_orange :weight 'bold))
     (eshell-ls-directory                        (:foreground as-theme-bright_yellow))
     (eshell-ls-executable                       (:weight 'bold))
     (eshell-ls-missing                          (:foreground as-theme-bright_red :bold t))
     (eshell-ls-product                          (:foreground as-theme-faded_red))
     (eshell-ls-readonly                         (:foreground as-theme-light2))
     (eshell-ls-special                          (:foreground as-theme-bright_yellow :bold t))
     (eshell-ls-symlink                          (:foreground as-theme-bright_red))
     (eshell-ls-unreadable                       (:foreground as-theme-bright_red :bold t))

     ;; tabbar
     (tabbar-default                             (:foreground as-theme-light0 :background as-theme-dark3 :bold nil :height 1.0 :box (:line-width -5 :color as-theme-dark3)))
     (tabbar-separator                           (:foreground as-theme-light0 :background as-theme-dark3))
     (tabbar-highlight                           (:inherit 'highlight))
     (tabbar-button                              (:foreground as-theme-dark3 :background as-theme-dark3 :box nil :line-width 0))
     (tabbar-button-highlight                    (:inherit 'tabbar-button :inverse-video t))
     (tabbar-modified                            (:foreground as-theme-bright_green :background as-theme-dark3 :box (:line-width -5 :color as-theme-dark3)))
     (tabbar-unselected                          (:inherit 'tabbar-default))
     (tabbar-unselected-modified                 (:inherit 'tabbar-modified))
     (tabbar-selected                            (:inherit 'tabbar-default :foreground as-theme-bright_yellow))
     (tabbar-selected-modified                   (:inherit 'tabbar-selected))

     ;; wgrep
     (wgrep-delete-face                          (:strike-through as-theme-bright_red))
     (wgrep-done-face                            (:foreground as-theme-turquoise4))
     (wgrep-face                                 (:underline (:color as-theme-bright_yellow :style 'line)))
     (wgrep-file-face                            (:inherit 'highlight))
     (wgrep-reject-face                          (:foreground as-theme-bright_red :bold t))

     ;; hydra
     (hydra-face-red (:foreground as-theme-bright_red :weight 'bold))
     (hydra-face-blue (:foreground as-theme-bright_blue :weight 'bold))
     (hydra-face-amaranth (:foreground as-theme-bright_yellow :weight 'bold))
     (hydra-face-pink (:foreground as-theme-bright_purple :weight 'bold))
     (hydra-face-teal (:foreground as-theme-bright_aqua :weight 'bold))

     ;; which-function-mode
     (which-func                                 (:foreground as-theme-faded_blue))

     ;; auto-dim-other-buffers
     (auto-dim-other-buffers-face                (:background as-theme-bg_inactive))

     ;; flycheck
     (flycheck-warning                          (:underline (:style 'wave :color as-theme-bright_yellow)))
     (flycheck-error                            (:underline (:style 'wave :color as-theme-bright_red)))
     (flycheck-info                             (:underline (:style 'wave :color as-theme-bright_blue)))
     (flycheck-fringe-warning                   (:foreground as-theme-bright_yellow))
     (flycheck-fringe-error                     (:foreground as-theme-bright_red))
     (flycheck-fringe-info                      (:foreground as-theme-bright_blue))
     (flycheck-error-list-warning               (:foreground as-theme-bright_yellow :bold t))
     (flycheck-error-list-error                 (:foreground as-theme-bright_red :bold t))
     (flycheck-error-list-info                  (:foreground as-theme-bright_blue :bold t))

     ;; tab-bar
     (tab-bar-tab-inactive (:background as-theme-bg :foreground as-theme-light0))
     (tab-bar-tab (:background as-theme-dark2 :foreground as-theme-light0))
     (tab-bar (:background as-theme-bg :foreground as-theme-light0))

     ;; circe
     (circe-prompt-face               (:foreground as-theme-turquoise4))
     (circe-fool                      (:foreground as-theme-dark2))
     (circe-highlight-nick-face       (:foreground as-theme-bright_yellow))
     (circe-server-face               (:foreground as-theme-dark4))
     (circe-my-message-face           (:foreground as-theme-bright_aqua))
     (lui-time-stamp-face             (:foreground as-theme-bright_blue))

     ;; erc
     (erc-action-face            (:inherit 'erc-default-face))
     (erc-bold-face              (:weight 'bold))
     (erc-current-nick-face      (:foreground as-theme-aquamarine4))
     (erc-dangerous-host-face    (:inherit 'font-lock-warning-face))
     (erc-default-face           (:inherit 'default))
     (erc-direct-msg-face        (:inherit 'erc-default-face))
     (erc-error-face             (:inherit 'font-lock-warning-face))
     (erc-fool-face              (:inherit 'erc-default-face))
     (erc-input-face             (:foreground as-theme-turquoise4))
     (erc-my-nick-face           (:foreground as-theme-turquoise4))
     (erc-nick-msg-face          (:inherit 'erc-default-face))
     (erc-notice-face            (:foreground as-theme-dark4))
     (erc-timestamp-face         (:foreground as-theme-neutral_green))
     (erc-underline-face         (:underline t))
     (erc-prompt-face            (:foreground as-theme-turquoise4))
     (erc-pal-face               (:foreground as-theme-neutral_yellow :weight 'bold))
     (erc-keyword-face           (:foreground as-theme-bright_orange :weight 'bold))
     (erc-nick-default-face      (:weight 'regular))
     (erc-button                 (:weight 'bold  :underline t))

     ;; gnus
     (gnus-group-mail-1           (:weight 'bold :foreground as-theme-light0))
     (gnus-group-mail-2           (:inherit 'gnus-group-mail-1))
     (gnus-group-mail-3           (:inherit 'gnus-group-mail-1))
     (gnus-group-mail-1-empty     (:foreground as-theme-dark4))
     (gnus-group-mail-2-empty     (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-mail-3-empty     (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-news-1           (:inherit 'gnus-group-mail-1))
     (gnus-group-news-2           (:inherit 'gnus-group-news-1))
     (gnus-group-news-3           (:inherit 'gnus-group-news-1))
     (gnus-group-news-4           (:inherit 'gnus-group-news-1))
     (gnus-group-news-5           (:inherit 'gnus-group-news-1))
     (gnus-group-news-6           (:inherit 'gnus-group-news-1))
     (gnus-group-news-1-empty     (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-news-2-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-3-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-4-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-5-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-6-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-mail-low         (:inherit 'gnus-group-mail-1 :weight 'normal))
     (gnus-group-mail-low-empty   (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-news-low         (:inherit 'gnus-group-mail-1 :foreground as-theme-dark4))
     (gnus-group-news-low-empty   (:inherit 'gnus-group-news-low :weight 'normal))
     (gnus-header-content         (:inherit 'message-header-other))
     (gnus-header-from            (:inherit 'message-header-other))
     (gnus-header-name            (:inherit 'message-header-name))
     (gnus-header-newsgroups      (:inherit 'message-header-other))
     (gnus-header-subject         (:inherit 'message-header-subject))
     (gnus-summary-cancelled      (:foreground as-theme-bright_red :strike-through t))
     (gnus-summary-normal-ancient (:foreground as-theme-dark4 :inherit 'italic))
     (gnus-summary-normal-read    (:foreground as-theme-light0))
     (gnus-summary-normal-ticked  (:foreground as-theme-bright_purple))
     (gnus-summary-normal-unread  (:foreground as-theme-bright_green :inherit 'bold))
     (gnus-summary-selected       (:foreground as-theme-bright_blue :weight 'bold))
     (gnus-cite-1                 (:foreground as-theme-bright_purple))
     (gnus-cite-2                 (:foreground as-theme-bright_purple))
     (gnus-cite-3                 (:foreground as-theme-bright_purple))
     (gnus-cite-4                 (:foreground as-theme-bright_green))
     (gnus-cite-5                 (:foreground as-theme-bright_green))
     (gnus-cite-6                 (:foreground as-theme-bright_green))
     (gnus-cite-7                 (:foreground as-theme-bright_purple))
     (gnus-cite-8                 (:foreground as-theme-bright_purple))
     (gnus-cite-9                 (:foreground as-theme-bright_purple))
     (gnus-cite-10                (:foreground as-theme-faded_orange))
     (gnus-cite-11                (:foreground as-theme-faded_orange))
     (gnus-signature              (:foreground as-theme-faded_orange))
     (gnus-x-face                 (:background as-theme-dark4 :foreground as-theme-light0))

     ;; web-mode
     (web-mode-doctype-face          (:foreground as-theme-bright_blue))
     (web-mode-html-tag-bracket-face (:foreground as-theme-bright_blue))
     (web-mode-html-tag-face         (:foreground as-theme-bright_blue))
     (web-mode-html-attr-name-face   (:foreground as-theme-bright_yellow))
     (web-mode-html-attr-equal-face  (:foreground as-theme-bright_yellow))
     (web-mode-html-attr-value-face  (:foreground as-theme-bright_green))

     ;; Coq
     (coq-solve-tactics-face      (:inherit 'font-lock-constant-face))
     (coq-cheat-face              (:box (:line-width -1 :color as-theme-bright_red :style nil)
                                        :foreground as-theme-bright_red))

     ;; Proof General
     (proof-active-area-face      (:underline t))
     (proof-tacticals-name-face   (:inherit 'font-lock-constant-face))
     (proof-tactics-name-face     (:inherit 'font-lock-constant-face))

     ;; ledger-mode
     (ledger-font-xact-highlight-face  (:background as-theme-dark1))

     ),@body))

(provide 'as-theme)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; as-theme.el ends here
