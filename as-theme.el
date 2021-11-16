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
     (minibuffer-prompt                         (:background as-theme-bg :foreground as-theme-palette2 :bold t))
     (vertical-border                           (:foreground as-theme-dark2))
     (internal-border                           (:background as-theme-dark2))
     (window-divider                            (:foreground as-theme-dark2))
     (link                                      (:foreground as-theme-faded_palette4 :underline t))
     (shadow                                    (:foreground as-theme-dark4))

     ;; Built-in syntax

     (font-lock-builtin-face                            (:foreground as-theme-palette7))
     (font-lock-constant-face                           (:foreground as-theme-palette5))
     (font-lock-comment-face                            (:foreground as-theme-dark4))
     (font-lock-function-name-face                      (:foreground as-theme-palette3))
     (font-lock-keyword-face                            (:foreground as-theme-palette1))
     (font-lock-string-face                             (:foreground as-theme-palette2))
     (font-lock-variable-name-face                      (:foreground as-theme-palette4))
     (font-lock-type-face                               (:foreground as-theme-palette5))
     (font-lock-warning-face                            (:foreground as-theme-palette1 :bold t))

     ;; Basic faces
     (error                                             (:foreground as-theme-palette1 :bold t))
     (success                                           (:foreground as-theme-palette2 :bold t))
     (warning                                           (:foreground as-theme-palette3 :bold t))
     (alert-low-face                                    (:foreground as-theme-palette4))
     (trailing-whitespace                               (:background as-theme-palette1))
     (escape-glyph                                      (:foreground as-theme-palette6))
     (header-line                                       (:background as-theme-dark0 :foreground as-theme-light3 :box nil :inherit nil))
     (highlight                                         (:background as-theme-dark4 :foreground as-theme-light0))
     (homoglyph                                         (:foreground as-theme-palette3))
     (match                                             (:foreground as-theme-dark0 :background as-theme-palette4))

     ;; Customize faces
     (widget-field                                      (:background as-theme-dark3))
     (custom-group-tag                                  (:foreground as-theme-palette4 :weight 'bold))
     (custom-variable-tag                               (:foreground as-theme-palette4 :weight 'bold))

     ;; whitespace-mode

     (whitespace-space                          (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-hspace                         (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-tab                            (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-newline                        (:background as-theme-bg :foreground as-theme-dark4))
     (whitespace-trailing                       (:background as-theme-dark1 :foreground as-theme-palette1))
     (whitespace-line                           (:background as-theme-dark1 :foreground as-theme-palette1))
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
     (line-number-current-line                  (:foreground as-theme-palette7 :background as-theme-dark2))
     (linum                                     (:foreground as-theme-dark4 :background as-theme-dark1))
     (linum-highlight-face                      (:foreground as-theme-palette7 :background as-theme-dark2))
     (linum-relative-current-face               (:foreground as-theme-palette7 :background as-theme-dark2))

     ;; Highlight indentation mode
     (highlight-indentation-current-column-face (:background as-theme-dark2))
     (highlight-indentation-face                (:background as-theme-dark1))

     ;; smartparens
     (sp-pair-overlay-face                      (:background as-theme-dark2))
     (sp-show-pair-match-face                   (:background as-theme-dark2)) ;; Pair tags highlight
     (sp-show-pair-mismatch-face                (:background as-theme-palette1)) ;; Highlight for bracket without pair
     ;;(sp-wrap-overlay-face                     (:inherit 'sp-wrap-overlay-face))
     ;;(sp-wrap-tag-overlay-face                 (:inherit 'sp-wrap-overlay-face))

     ;; elscreen
     (elscreen-tab-background-face              (:background as-theme-bg :box nil)) ;; Tab bar, not the tabs
     (elscreen-tab-control-face                 (:background as-theme-dark2 :foreground as-theme-palette1 :underline nil :box nil)) ;; The controls
     (elscreen-tab-current-screen-face          (:background as-theme-dark4 :foreground as-theme-dark0 :box nil)) ;; Current tab
     (elscreen-tab-other-screen-face            (:background as-theme-dark2 :foreground as-theme-light4 :underline nil :box nil)) ;; Inactive tab

     ;; ag (The Silver Searcher)
     (ag-hit-face                               (:foreground as-theme-palette4))
     (ag-match-face                             (:foreground as-theme-palette1))

     ;; Diffs
     (diff-header                               (:background as-theme-dark1))
     (diff-file-header                          (:background as-theme-dark2))
     (diff-hunk-header                          (:background as-theme-dark2))
     (diff-context                              (:background as-theme-dark1 :foreground as-theme-light1))
     (diff-added                                (:background nil :foreground as-theme-palette2))
     (diff-refine-added                         (:background nil :foreground as-theme-palette2))
     (diff-removed                              (:background nil :foreground as-theme-palette1))
     (diff-refine-removed                       (:background nil :foreground as-theme-palette1))
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

     (js2-warning                               (:underline (:color as-theme-palette3 :style 'wave)))
     (js2-error                                 (:underline (:color as-theme-palette1 :style 'wave)))
     (js2-external-variable                     (:underline (:color as-theme-palette6 :style 'wave)))
     (js2-jsdoc-tag                             (:background nil :foreground as-theme-gray  ))
     (js2-jsdoc-type                            (:background nil :foreground as-theme-light4))
     (js2-jsdoc-value                           (:background nil :foreground as-theme-light3))
     (js2-function-param                        (:background nil :foreground as-theme-palette6))
     (js2-function-call                         (:background nil :foreground as-theme-palette4))
     (js2-instance-member                       (:background nil :foreground as-theme-palette7))
     (js2-private-member                        (:background nil :foreground as-theme-faded_palette3))
     (js2-private-function-call                 (:background nil :foreground as-theme-faded_palette6))
     (js2-jsdoc-html-tag-name                   (:background nil :foreground as-theme-light4))
     (js2-jsdoc-html-tag-delimiter              (:background nil :foreground as-theme-light3))

     ;; popup
     (popup-face                                (:underline nil :foreground as-theme-light1 :background as-theme-dark1))
     (popup-menu-mouse-face                     (:underline nil :foreground as-theme-light0 :background as-theme-faded_palette2))
     (popup-menu-selection-face                 (:underline nil :foreground as-theme-light0 :background as-theme-faded_palette2))
     (popup-tip-face                            (:underline nil :foreground as-theme-light2 :background as-theme-dark2))

     ;; helm
     (helm-M-x-key                              (:foreground as-theme-palette7 ))
     (helm-action                               (:foreground as-theme-light0_hard :underline t))
     (helm-bookmark-addressbook                 (:foreground as-theme-palette1))
     (helm-bookmark-directory                   (:foreground as-theme-palette5))
     (helm-bookmark-file                        (:foreground as-theme-faded_palette4))
     (helm-bookmark-gnus                        (:foreground as-theme-faded_palette5))
     (helm-bookmark-info                        (:foreground as-theme-palette4))
     (helm-bookmark-man                         (:foreground as-theme-faded_palette5))
     (helm-bookmark-w3m                         (:foreground as-theme-palette3))
     (helm-buffer-directory                     (:foreground as-theme-white :background as-theme-palette4))
     (helm-buffer-not-saved                     (:foreground as-theme-faded_palette1))
     (helm-buffer-process                       (:foreground as-theme-faded_palette3))
     (helm-buffer-saved-out                     (:foreground as-theme-palette1))
     (helm-buffer-size                          (:foreground as-theme-palette5))
     (helm-candidate-number                     (:foreground as-theme-palette2))
     (helm-eshell-prompts-buffer-name           (:foreground as-theme-palette2))
     (helm-eshell-prompts-promptidx             (:foreground as-theme-palette4))
     (helm-ff-directory                         (:foreground as-theme-palette5))
     (helm-ff-executable                        (:foreground as-theme-palette4))
     (helm-ff-file                              (:foreground as-theme-faded_palette5))
     (helm-ff-invalid-symlink                   (:foreground as-theme-white :background as-theme-palette1))
     (helm-ff-prefix                            (:foreground as-theme-black :background as-theme-palette3))
     (helm-ff-symlink                           (:foreground as-theme-palette7))
     (helm-grep-cmd-line                        (:foreground as-theme-palette2))
     (helm-grep-file                            (:foreground as-theme-faded_palette5))
     (helm-grep-finish                          (:foreground as-theme-palette4))
     (helm-grep-lineno                          (:foreground as-theme-palette7))
     (helm-grep-match                           (:foreground as-theme-palette3))
     (helm-grep-running                         (:foreground as-theme-palette1))
     (helm-header                               (:foreground as-theme-faded_palette6))
     (helm-helper                               (:foreground as-theme-faded_palette6))
     (helm-history-deleted                      (:foreground as-theme-black :background as-theme-palette1))
     (helm-history-remote                       (:foreground as-theme-faded_palette1))
     (helm-lisp-completion-info                 (:foreground as-theme-faded_palette7))
     (helm-lisp-show-completion                 (:foreground as-theme-palette1))
     (helm-locate-finish                        (:foreground as-theme-white :background as-theme-faded_palette6))
     (helm-match                                (:foreground as-theme-palette7))
     (helm-moccur-buffer                        (:foreground as-theme-palette6 :underline t))
     (helm-prefarg                              (:foreground as-theme-palette4))
     (helm-selection                            (:foreground as-theme-white :background as-theme-dark2))
     (helm-selection-line                       (:foreground as-theme-white :background as-theme-dark2))
     (helm-separator                            (:foreground as-theme-faded_palette1))
     (helm-source-header                        (:foreground as-theme-light2))
     (helm-visible-mark                         (:foreground as-theme-black :background as-theme-light3))

     ;; helm-rg
     (helm-rg-preview-line-highlight              (:foreground as-theme-black :background as-theme-palette2))
     (helm-rg-base-rg-cmd-face                    (:foreground as-theme-light2))
     (helm-rg-extra-arg-face                      (:foreground as-theme-palette3))
     (helm-rg-inactive-arg-face                   (:foreground as-theme-faded_palette6))
     (helm-rg-active-arg-face                     (:foreground as-theme-palette2))
     (helm-rg-directory-cmd-face                  (:foreground as-theme-faded_palette3 :background as-theme-black))
     (helm-rg-error-message                       (:foreground as-theme-palette1))
     (helm-rg-title-face                          (:foreground as-theme-palette5))
     (helm-rg-directory-header-face               (:foreground as-theme-white :background as-theme-dark1))
     (helm-rg-file-match-face                     (:foreground as-theme-palette4))
     (helm-rg-colon-separator-ripgrep-output-face (:foreground as-theme-dark3 :background as-theme-bg))
     (helm-rg-line-number-match-face              (:foreground as-theme-faded_palette7))
     (helm-rg-match-text-face                     (:foreground as-theme-white :background as-theme-palette5))

     ;; hi-lock-mode
     (hi-black-b                                (:foreground as-theme-black :weight 'bold))
     (hi-black-hb                               (:foreground as-theme-black :weight 'bold :height 1.5))
     (hi-blue                                   (:foreground as-theme-dark0 :background as-theme-palette4))
     (hi-blue-b                                 (:foreground as-theme-palette4 :weight 'bold))
     (hi-green                                  (:foreground as-theme-dark0 :background as-theme-palette2))
     (hi-green-b                                (:foreground as-theme-palette2 :weight 'bold))
     (hi-pink                                   (:foreground as-theme-dark0 :background as-theme-palette5))
     (hi-red-b                                  (:foreground as-theme-palette1 :weight 'bold))
     (hi-yellow                                 (:foreground as-theme-dark0 :background as-theme-faded_palette3))

     ;; company-mode
     (company-scrollbar-bg                      (:background as-theme-dark2))
     (company-scrollbar-fg                      (:background as-theme-dark1))
     (company-tooltip                           (:background as-theme-dark1))
     (company-tooltip-annotation                (:foreground as-theme-palette2))
     (company-tooltip-annotation-selection      (:inherit 'company-tooltip-annotation))
     (company-tooltip-selection                 (:foreground as-theme-palette5 :background as-theme-dark2))
     (company-tooltip-common                    (:foreground as-theme-palette4 :underline t))
     (company-tooltip-common-selection          (:foreground as-theme-palette4 :underline t))
     (company-preview-common                    (:foreground as-theme-light0))
     (company-preview                           (:background as-theme-faded_palette4))
     (company-preview-search                    (:background as-theme-palette4))
     (company-template-field                    (:foregrqund as-theme-black :background as-theme-palette3))
     (company-echo-common                       (:foreground as-theme-faded_palette1))

     ;; tool tips
     (tooltip                                   (:foreground as-theme-light1 :background as-theme-dark1))

     ;; marginalia
     (marginalia-documentation                  (:italic t :foreground as-theme-light3))
     
     ;; corfu
     (corfu-background                          (:background as-theme-dark1))
     (corfu-current                             (:foreground as-theme-palette5 :background as-theme-dark2))
     (corfu-bar                                 (:background as-theme-dark2))
     (corfu-border                              (:background as-theme-dark1))

     ;; term
     (term-color-black                          (:foreground as-theme-dark2 :background as-theme-dark1))
     (term-color-blue                           (:foreground as-theme-palette4 :background as-theme-palette4))
     (term-color-cyan                           (:foreground as-theme-palette6 :background as-theme-palette6))
     (term-color-green                          (:foreground as-theme-palette2 :background as-theme-palette2))
     (term-color-magenta                        (:foreground as-theme-palette5 :background as-theme-palette5))
     (term-color-red                            (:foreground as-theme-palette1 :background as-theme-palette1))
     (term-color-white                          (:foreground as-theme-light1 :background as-theme-light1))
     (term-color-yellow                         (:foreground as-theme-palette3 :background as-theme-palette3))
     (term-default-fg-color                     (:foreground as-theme-light0))
     (term-default-bg-color                     (:background as-theme-bg))

     ;; message-mode
     (message-header-to                         (:inherit 'font-lock-variable-name-face))
     (message-header-cc                         (:inherit 'font-lock-variable-name-face))
     (message-header-subject                    (:foreground as-theme-palette7 :weight 'bold))
     (message-header-newsgroups                 (:foreground as-theme-palette3 :weight 'bold))
     (message-header-other                      (:inherit 'font-lock-variable-name-face))
     (message-header-name                       (:inherit 'font-lock-keyword-face))
     (message-header-xheader                    (:foreground as-theme-faded_palette4))
     (message-separator                         (:inherit 'font-lock-comment-face))
     (message-cited-text                        (:inherit 'font-lock-comment-face))
     (message-mml                               (:foreground as-theme-faded_palette2 :weight 'bold))

     ;; org-mode
     (org-hide                                  (:foreground as-theme-dark0))
     (org-level-1                               (:foreground as-theme-palette4))
     (org-level-2                               (:foreground as-theme-palette3))
     (org-level-3                               (:foreground as-theme-palette5))
     (org-level-4                               (:foreground as-theme-palette1))
     (org-level-5                               (:foreground as-theme-palette2))
     (org-level-6                               (:foreground as-theme-palette6))
     (org-level-7                               (:foreground as-theme-faded_palette4))
     (org-level-8                               (:foreground as-theme-palette7))
     (org-special-keyword                       (:inherit 'font-lock-comment-face))
     (org-drawer                                (:inherit 'font-lock-function-name-face))
     (org-column                                (:background as-theme-dark0))
     (org-column-title                          (:background as-theme-dark0 :underline t :weight 'bold))
     (org-warning                               (:foreground as-theme-palette1 :weight 'bold :underline nil :bold t))
     (org-archived                              (:foreground as-theme-light0 :weight 'bold))
     (org-link                                  (:foreground as-theme-faded_palette6 :underline t))
     (org-footnote                              (:foreground as-theme-palette6 :underline t))
     (org-ellipsis                              (:foreground as-theme-light4))
     (org-date                                  (:foreground as-theme-palette4 :underline t))
     (org-sexp-date                             (:foreground as-theme-faded_palette4 :underline t))
     (org-tag                                   (:bold t :weight 'bold))
     (org-list-dt                               (:bold t :weight 'bold))
     (org-todo                                  (:foreground as-theme-palette1 :weight 'bold :bold t))
     (org-done                                  (:foreground as-theme-palette6 :weight 'bold :bold t))
     (org-agenda-done                           (:foreground as-theme-palette6))
     (org-headline-done                         (:foreground as-theme-palette6))
     (org-table                                 (:foreground as-theme-palette4))
     (org-block                                 (:background as-theme-dark0_soft))
     (org-block-begin-line                      (:background as-theme-dark1))
     (org-block-end-line                        (:background as-theme-dark1))
     (org-formula                               (:foreground as-theme-palette3))
     (org-document-title                        (:foreground as-theme-faded_palette4))
     (org-document-info                         (:foreground as-theme-faded_palette4))
     (org-agenda-structure                      (:inherit 'font-lock-comment-face))
     (org-agenda-date-today                     (:foreground as-theme-light0 :weight 'bold :italic t))
     (org-scheduled                             (:foreground as-theme-palette3))
     (org-scheduled-today                       (:foreground as-theme-palette4))
     (org-scheduled-previously                  (:foreground as-theme-faded_palette1))
     (org-upcoming-deadline                     (:inherit 'font-lock-keyword-face))
     (org-deadline-announce                     (:foreground as-theme-faded_palette1))
     (org-time-grid                             (:foreground as-theme-faded_palette7))
     (org-latex-and-related                     (:foreground as-theme-palette4))

     ;; org-habit
     (org-habit-clear-face                      (:background as-theme-faded_palette4))
     (org-habit-clear-future-face               (:background as-theme-palette4))
     (org-habit-ready-face                      (:background as-theme-faded_palette2))
     (org-habit-ready-future-face               (:background as-theme-palette2))
     (org-habit-alert-face                      (:background as-theme-faded_palette3))
     (org-habit-alert-future-face               (:background as-theme-palette3))
     (org-habit-overdue-face                    (:background as-theme-faded_palette1))
     (org-habit-overdue-future-face             (:background as-theme-palette1))

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
     (sml/modes                                 (:foreground as-theme-palette2))
     (sml/filename                              (:foreground as-theme-palette1 :weight 'bold))
     (sml/prefix                                (:foreground as-theme-light1))
     (sml/read-only                             (:foreground as-theme-palette4))
     (persp-selected-face                       (:foreground as-theme-palette7))

     ;; powerline
     (powerline-active0                         (:background as-theme-dark4 :foreground as-theme-light0))
     (powerline-active1                         (:background as-theme-dark3 :foreground as-theme-light0))
     (powerline-active2                         (:background as-theme-dark2 :foreground as-theme-light0))
     (powerline-inactive0                       (:background as-theme-dark2 :foreground as-theme-light4))
     (powerline-inactive1                       (:background as-theme-dark1 :foreground as-theme-light4))
     (powerline-inactive2                       (:background as-theme-dark0 :foreground as-theme-light4))

     ;; isearch
     (isearch                                   (:foreground as-theme-black :background as-theme-palette7))
     (lazy-highlight                            (:foreground as-theme-black :background as-theme-palette3))
     (isearch-fail                              (:foreground as-theme-light0 :background as-theme-palette1))

     ;; markdown-mode
     (markdown-header-face-1                    (:foreground as-theme-palette4))
     (markdown-header-face-2                    (:foreground as-theme-palette3))
     (markdown-header-face-3                    (:foreground as-theme-palette5))
     (markdown-header-face-4                    (:foreground as-theme-palette1))
     (markdown-header-face-5                    (:foreground as-theme-palette2))
     (markdown-header-face-6                    (:foreground as-theme-palette6))

     ;; anzu-mode
     (anzu-mode-line                            (:foreground as-theme-palette3 :weight 'bold))
     (anzu-match-1                              (:background as-theme-palette2))
     (anzu-match-2                              (:background as-theme-faded_palette3))
     (anzu-match-3                              (:background as-theme-faded_palette6))
     (anzu-replace-to                           (:foreground as-theme-palette3))
     (anzu-replace-highlight                    (:inherit 'isearch))

     ;; ace-jump-mode
     (ace-jump-face-background                  (:foreground as-theme-light4 :background as-theme-bg :inverse-video nil))
     (ace-jump-face-foreground                  (:foreground as-theme-palette1 :background as-theme-bg :inverse-video nil))

     ;; ace-window
     (aw-background-face                        (:foreground as-theme-light1 :background as-theme-bg :inverse-video nil))
     (aw-leading-char-face                      (:foreground as-theme-palette1 :background as-theme-bg :height 4.0))

     ;; show-paren
     (show-paren-match                          (:background as-theme-dark3 :foreground as-theme-palette4  :weight 'bold))
     (show-paren-mismatch                       (:background as-theme-palette1 :foreground as-theme-dark3 :weight 'bold))

     ;; ivy
     (ivy-current-match                         (:foreground as-theme-light0_hard :weight 'bold :underline t))
     (ivy-minibuffer-match-face-1               (:foreground as-theme-palette7))
     (ivy-minibuffer-match-face-2               (:foreground as-theme-palette3))
     (ivy-minibuffer-match-face-3               (:foreground as-theme-faded_palette7))
     (ivy-minibuffer-match-face-4               (:foreground as-theme-faded_palette3))

     ;; ido
     (ido-only-match                            (:inherit 'success))
     (ido-first-match                           (:foreground as-theme-light0_hard :weight 'bold :underline t))
     (ido-subdir                                (:inherit 'dired-directory))

     ;; magit
     (magit-bisect-bad                          (:foreground as-theme-faded_palette1))
     (magit-bisect-good                         (:foreground as-theme-faded_palette2))
     (magit-bisect-skip                         (:foreground as-theme-faded_palette3))
     (magit-blame-heading                       (:foreground as-theme-light0 :background as-theme-dark2))
     (magit-branch-local                        (:foreground as-theme-palette4))
     (magit-branch-current                      (:underline as-theme-palette4 :inherit 'magit-branch-local))
     (magit-branch-remote                       (:foreground as-theme-palette2))
     (magit-cherry-equivalent                   (:foreground as-theme-palette5))
     (magit-cherry-unmatched                    (:foreground as-theme-palette6))
     (magit-diff-added                          (:foreground as-theme-palette2))
     (magit-diff-added-highlight                (:foreground as-theme-palette2 :inherit 'magit-diff-context-highlight))
     (magit-diff-base                           (:background as-theme-faded_palette3 :foreground as-theme-light2))
     (magit-diff-base-highlight                 (:background as-theme-faded_palette3 :foreground as-theme-light0))
     (magit-diff-context                        (:foreground as-theme-dark1  :foreground as-theme-light1))
     (magit-diff-context-highlight              (:background as-theme-dark1 :foreground as-theme-light0))
     (magit-diff-hunk-heading                   (:background as-theme-dark3 :foreground as-theme-light2))
     (magit-diff-hunk-heading-highlight         (:background as-theme-dark2 :foreground as-theme-light0))
     (magit-diff-hunk-heading-selection         (:background as-theme-dark2 :foreground as-theme-palette7))
     (magit-diff-lines-heading                  (:background as-theme-faded_palette7 :foreground as-theme-light0))
     (magit-diff-removed                        (:foreground as-theme-palette1))
     (magit-diff-removed-highlight              (:foreground as-theme-palette1 :inherit 'magit-diff-context-highlight))
     (magit-diffstat-added                      (:foreground as-theme-faded_palette2))
     (magit-diffstat-removed                    (:foreground as-theme-faded_palette1))
     (magit-dimmed                              (:foreground as-theme-dark4))
     (magit-hash                                (:foreground as-theme-palette4))
     (magit-log-author                          (:foreground as-theme-palette1))
     (magit-log-date                            (:foreground as-theme-palette6))
     (magit-log-graph                           (:foreground as-theme-dark4))
     (magit-process-ng                          (:foreground as-theme-palette1 :weight 'bold))
     (magit-process-ok                          (:foreground as-theme-palette2 :weight 'bold))
     (magit-reflog-amend                        (:foreground as-theme-palette5))
     (magit-reflog-checkout                     (:foreground as-theme-palette4))
     (magit-reflog-cherry-pick                  (:foreground as-theme-palette2))
     (magit-reflog-commit                       (:foreground as-theme-palette2))
     (magit-reflog-merge                        (:foreground as-theme-palette2))
     (magit-reflog-other                        (:foreground as-theme-palette6))
     (magit-reflog-rebase                       (:foreground as-theme-palette5))
     (magit-reflog-remote                       (:foreground as-theme-palette4))
     (magit-reflog-reset                        (:foreground as-theme-palette1))
     (magit-refname                             (:foreground as-theme-light4))
     (magit-section-heading                     (:foreground as-theme-palette3 :weight 'bold))
     (magit-section-heading-selection           (:foreground as-theme-faded_palette3))
     (magit-section-highlight                   (:background as-theme-dark1))
     (magit-sequence-drop                       (:foreground as-theme-faded_palette3))
     (magit-sequence-head                       (:foreground as-theme-palette6))
     (magit-sequence-part                       (:foreground as-theme-palette3))
     (magit-sequence-stop                       (:foreground as-theme-palette2))
     (magit-signature-bad                       (:foreground as-theme-palette1 :weight 'bold))
     (magit-signature-error                     (:foreground as-theme-palette1))
     (magit-signature-expired                   (:foreground as-theme-palette7))
     (magit-signature-good                      (:foreground as-theme-palette2))
     (magit-signature-revoked                   (:foreground as-theme-palette5))
     (magit-signature-untrusted                 (:foreground as-theme-palette4))
     (magit-tag                                 (:foreground as-theme-palette3))

     ;; cider
     (cider-debug-code-overlay-face             (:background as-theme-dark2 :foreground as-theme-light0))
     (cider-deprecated-face                     (:background as-theme-dark2 :foreground as-theme-palette7))
     (cider-enlightened-local-face              (:foreground as-theme-palette7 :weight 'bold))
     (cider-error-highlight-face                (:foreground as-theme-palette1 :underline t :style 'wave))
     (cider-fringe-good-face                    (:foreground as-theme-palette2))
     (cider-instrumented-face                   (:background as-theme-dark1 :box (:line-width -1 :color as-theme-palette1)))
     (cider-result-overlay-face                 (:background as-theme-dark2 :box (:line-width -1 :color as-theme-palette3)))
     (cider-test-error-face                     (:background as-theme-faded_palette1))
     (cider-test-error-face                     (:background as-theme-palette7))
     (cider-test-success-face                   (:background as-theme-palette2))
     (cider-traced                              (:background as-theme-palette6))
     (cider-warning-highlight-face              (:foreground as-theme-palette3 :underline t :style 'wave))

     ;; git-gutter
     (git-gutter:modified                       (:background as-theme-faded_palette4 :foreground as-theme-faded_palette4))
     (git-gutter:added                          (:background as-theme-faded_palette2 :foreground as-theme-faded_palette2))
     (git-gutter:deleted                        (:background as-theme-faded_palette1 :foreground as-theme-faded_palette1))

     ;; git-gutter+
     (git-gutter+-modified                      (:foreground as-theme-faded_palette4 :background as-theme-faded_palette4))
     (git-gutter+-added                         (:foreground as-theme-faded_palette2 :background as-theme-faded_palette2))
     (git-gutter+-deleted                       (:foreground as-theme-faded_palette1 :background as-theme-faded_palette1))

     ;; git-gutter-fringe
     (git-gutter-fr:modified                    (:inherit 'git-gutter:modified))
     (git-gutter-fr:added                       (:inherit 'git-gutter:added))
     (git-gutter-fr:deleted                     (:inherit 'git-gutter:deleted))

     ;; diff-hl
     (diff-hl-change (:background as-theme-faded_palette4 :foreground as-theme-faded_palette4))
     (diff-hl-delete (:background as-theme-faded_palette1 :foreground as-theme-faded_palette1))
     (diff-hl-insert (:background as-theme-faded_palette2 :foreground as-theme-faded_palette2))

     ;; flyspell
     (flyspell-duplicate                        (:underline (:color as-theme-light4 :style 'line)))
     (flyspell-incorrect                        (:underline (:color as-theme-palette1 :style 'line)))

     ;; langtool
     (langtool-errline                          (:foreground as-theme-dark0 :background as-theme-palette1))
     (langtool-correction-face                  (:foreground as-theme-palette3 :weight 'bold))

     ;; latex
     (font-latex-bold-face                      (:foreground as-theme-faded_palette2 :bold t))
     (font-latex-italic-face                    (:foreground as-theme-palette2 :underline t))
     (font-latex-math-face                      (:foreground as-theme-light3))
     (font-latex-script-char-face               (:foreground as-theme-faded_palette6))
     (font-latex-sectioning-5-face              (:foreground as-theme-palette3 :bold t))
     (font-latex-sedate-face                    (:foreground as-theme-light4))
     (font-latex-string-face                    (:foreground as-theme-palette7))
     (font-latex-verbatim-face                  (:foreground as-theme-light4))
     (font-latex-warning-face                   (:foreground as-theme-palette1 :weight 'bold))
     (preview-face                              (:background as-theme-dark1))

     ;; lsp
     (lsp-lsp-flycheck-warning-unnecessary-face (:underline (:color as-theme-palette7 :style 'wave)
                                                            :foreground as-theme-faded_palette3))
     (lsp-ui-doc-background                     (:background as-theme-dark3))
     (lsp-ui-doc-header                         (:background as-theme-faded_palette4))
     (lsp-ui-peek-filename                      (:foreground as-theme-palette1))
     (lsp-ui-sideline-code-action               (:foreground as-theme-palette3))
     (lsp-ui-sideline-current-symbol            (:foreground as-theme-faded_palette6))
     (lsp-ui-sideline-symbol                    (:foreground as-theme-gray))

     ;; mu4e
     (mu4e-header-key-face                      (:foreground as-theme-palette2 :weight 'bold ))
     (mu4e-unread-face                          (:foreground as-theme-palette4 :weight 'bold ))
     (mu4e-highlight-face                       (:foreground as-theme-palette2))

     ;; shell script
     (sh-quoted-exec                            (:foreground as-theme-palette5))
     (sh-heredoc                                (:foreground as-theme-palette7))

     ;; undo-tree
     (undo-tree-visualizer-active-branch-face   (:foreground as-theme-light0))
     (undo-tree-visualizer-current-face         (:foreground as-theme-palette1))
     (undo-tree-visualizer-default-face         (:foreground as-theme-dark4))
     (undo-tree-visualizer-register-face        (:foreground as-theme-palette3))
     (undo-tree-visualizer-unmodified-face      (:foreground as-theme-palette6))

     ;; widget faces
     (widget-button-pressed-face                (:foreground as-theme-palette1))
     (widget-documentation-face                 (:foreground as-theme-faded_palette2))
     (widget-field                              (:foreground as-theme-light0 :background as-theme-dark2))
     (widget-single-line-field                  (:foreground as-theme-light0 :background as-theme-dark2))

     ;; dired+
     (diredp-file-name                          (:foreground as-theme-light2))
     (diredp-file-suffix                        (:foreground as-theme-light4))
     (diredp-compressed-file-suffix             (:foreground as-theme-faded_palette4))
     (diredp-dir-name                           (:foreground as-theme-faded_palette4))
     (diredp-dir-heading                        (:foreground as-theme-palette4))
     (diredp-symlink                            (:foreground as-theme-palette7))
     (diredp-date-time                          (:foreground as-theme-light3))
     (diredp-number                             (:foreground as-theme-faded_palette4))
     (diredp-no-priv                            (:foreground as-theme-dark4))
     (diredp-other-priv                         (:foreground as-theme-dark2))
     (diredp-rare-priv                          (:foreground as-theme-dark4))
     (diredp-ignored-file-name                  (:foreground as-theme-dark4))

     (diredp-dir-priv                           (:foreground as-theme-faded_palette4  :background as-theme-dark_palette4))
     (diredp-exec-priv                          (:foreground as-theme-faded_palette4  :background as-theme-dark_palette4))
     (diredp-link-priv                          (:foreground as-theme-faded_palette6  :background as-theme-dark_palette6))
     (diredp-read-priv                          (:foreground as-theme-palette1  :background as-theme-dark_palette1))
     (diredp-write-priv                         (:foreground as-theme-palette6 :background as-theme-dark_palette6))

     ;; diredfl
     (diredfl-autofile-name                     (:foreground as-theme-light2))
     (diredfl-compressed-file-name              (:foreground as-theme-light2))
     (diredfl-compressed-file-suffix            (:foreground as-theme-faded_palette4))
     (diredfl-date-time                         (:foreground as-theme-palette6))
     (diredfl-deletion                          (:foreground as-theme-palette1 :bold t))
     (diredfl-deletion-file-name                (:foreground as-theme-palette1 :bold t))
     (diredfl-dir-heading                       (:foreground as-theme-palette4 :bold t))
     (diredfl-dir-name                          (:foreground as-theme-palette4))
     (diredfl-dir-priv                          (:foreground as-theme-palette4 :background as-theme-dark_palette4))
     (diredfl-exec-priv                         (:foreground as-theme-palette4 :background as-theme-dark_palette4))
     (diredfl-executable-tag                    (:foreground as-theme-palette2))
     (diredfl-file-name                         (:foreground as-theme-light2))
     (diredfl-file-suffix                       (:foreground as-theme-light4))
     (diredfl-symlink                           (:foreground as-theme-palette5))
     (diredfl-flag-mark                         (:foreground as-theme-palette3 :background as-theme-dark3))
     (diredfl-flag-mark-line                    (:foreground as-theme-palette3 :background as-theme-dark2))
     (diredfl-ignored-file-name                 (:foreground as-theme-dark4))
     (diredfl-link-priv                         (:foreground as-theme-faded_palette5))
     (diredfl-no-priv                           (:foreground as-theme-light2))
     (diredfl-number                            (:foreground as-theme-palette3))
     (diredfl-other-priv                        (:foreground as-theme-palette5))
     (diredfl-rare-priv                         (:foreground as-theme-light2))
     (diredfl-read-priv                         (:foreground as-theme-palette3))
     (diredfl-write-priv                        (:foreground as-theme-palette1))
     (diredfl-tagged-autofile-name              (:foreground as-theme-light4))

     ;; neotree
     (neo-banner-face                           (:foreground as-theme-palette5 :bold t))
     (neo-dir-link-face                         (:foreground as-theme-palette3))
     (neo-expand-btn-face                       (:foreground as-theme-palette7))
     (neo-file-link-face                        (:foreground as-theme-light0))
     (neo-header-face                           (:foreground as-theme-palette5))
     (neo-root-dir-face                         (:foreground as-theme-palette5 :bold t))

     ;; eshell
     (eshell-prompt                              (:foreground as-theme-palette6))
     (eshell-ls-archive                          (:foreground as-theme-light3))
     (eshell-ls-backup                           (:foreground as-theme-light4))
     (eshell-ls-clutter                          (:foreground as-theme-palette7 :weight 'bold))
     (eshell-ls-directory                        (:foreground as-theme-palette3))
     (eshell-ls-executable                       (:weight 'bold))
     (eshell-ls-missing                          (:foreground as-theme-palette1 :bold t))
     (eshell-ls-product                          (:foreground as-theme-faded_palette1))
     (eshell-ls-readonly                         (:foreground as-theme-light2))
     (eshell-ls-special                          (:foreground as-theme-palette3 :bold t))
     (eshell-ls-symlink                          (:foreground as-theme-palette1))
     (eshell-ls-unreadable                       (:foreground as-theme-palette1 :bold t))

     ;; tabbar
     (tabbar-default                             (:foreground as-theme-light0 :background as-theme-dark3 :bold nil :height 1.0 :box (:line-width -5 :color as-theme-dark3)))
     (tabbar-separator                           (:foreground as-theme-light0 :background as-theme-dark3))
     (tabbar-highlight                           (:inherit 'highlight))
     (tabbar-button                              (:foreground as-theme-dark3 :background as-theme-dark3 :box nil :line-width 0))
     (tabbar-button-highlight                    (:inherit 'tabbar-button :inverse-video t))
     (tabbar-modified                            (:foreground as-theme-palette2 :background as-theme-dark3 :box (:line-width -5 :color as-theme-dark3)))
     (tabbar-unselected                          (:inherit 'tabbar-default))
     (tabbar-unselected-modified                 (:inherit 'tabbar-modified))
     (tabbar-selected                            (:inherit 'tabbar-default :foreground as-theme-palette3))
     (tabbar-selected-modified                   (:inherit 'tabbar-selected))

     ;; wgrep
     (wgrep-delete-face                          (:strike-through as-theme-palette1))
     (wgrep-done-face                            (:foreground as-theme-palette4))
     (wgrep-face                                 (:underline (:color as-theme-palette3 :style 'line)))
     (wgrep-file-face                            (:inherit 'highlight))
     (wgrep-reject-face                          (:foreground as-theme-palette1 :bold t))

     ;; hydra
     (hydra-face-red (:foreground as-theme-palette1 :weight 'bold))
     (hydra-face-blue (:foreground as-theme-palette4 :weight 'bold))
     (hydra-face-amaranth (:foreground as-theme-palette3 :weight 'bold))
     (hydra-face-pink (:foreground as-theme-palette5 :weight 'bold))
     (hydra-face-teal (:foreground as-theme-palette6 :weight 'bold))

     ;; which-function-mode
     (which-func                                 (:foreground as-theme-faded_palette4))

     ;; auto-dim-other-buffers
     (auto-dim-other-buffers-face                (:background as-theme-bg_inactive))

     ;; flycheck
     (flycheck-warning                          (:underline (:style 'wave :color as-theme-palette3)))
     (flycheck-error                            (:underline (:style 'wave :color as-theme-palette1)))
     (flycheck-info                             (:underline (:style 'wave :color as-theme-palette4)))
     (flycheck-fringe-warning                   (:foreground as-theme-palette3))
     (flycheck-fringe-error                     (:foreground as-theme-palette1))
     (flycheck-fringe-info                      (:foreground as-theme-palette4))
     (flycheck-error-list-warning               (:foreground as-theme-palette3 :bold t))
     (flycheck-error-list-error                 (:foreground as-theme-palette1 :bold t))
     (flycheck-error-list-info                  (:foreground as-theme-palette4 :bold t))

     ;; tab-bar
     (tab-bar-tab-inactive (:background as-theme-bg :foreground as-theme-light0))
     (tab-bar-tab (:background as-theme-dark2 :foreground as-theme-light0))
     (tab-bar (:background as-theme-bg :foreground as-theme-light0))

     ;; circe
     (circe-prompt-face               (:foreground as-theme-palette4))
     (circe-fool                      (:foreground as-theme-dark2))
     (circe-highlight-nick-face       (:foreground as-theme-palette3))
     (circe-server-face               (:foreground as-theme-dark4))
     (circe-my-message-face           (:foreground as-theme-palette6))
     (lui-time-stamp-face             (:foreground as-theme-palette4))

     ;; erc
     (erc-action-face            (:inherit 'erc-default-face))
     (erc-bold-face              (:weight 'bold))
     (erc-current-nick-face      (:foreground as-theme-faded_palette6))
     (erc-dangerous-host-face    (:inherit 'font-lock-warning-face))
     (erc-default-face           (:inherit 'default))
     (erc-direct-msg-face        (:inherit 'erc-default-face))
     (erc-error-face             (:inherit 'font-lock-warning-face))
     (erc-fool-face              (:inherit 'erc-default-face))
     (erc-input-face             (:foreground as-theme-palette4))
     (erc-my-nick-face           (:foreground as-theme-palette4))
     (erc-nick-msg-face          (:inherit 'erc-default-face))
     (erc-notice-face            (:foreground as-theme-dark4))
     (erc-timestamp-face         (:foreground as-theme-palette2))
     (erc-underline-face         (:underline t))
     (erc-prompt-face            (:foreground as-theme-palette4))
     (erc-pal-face               (:foreground as-theme-palette3 :weight 'bold))
     (erc-keyword-face           (:foreground as-theme-palette7 :weight 'bold))
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
     (gnus-summary-cancelled      (:foreground as-theme-palette1 :strike-through t))
     (gnus-summary-normal-ancient (:foreground as-theme-dark4 :inherit 'italic))
     (gnus-summary-normal-read    (:foreground as-theme-light0))
     (gnus-summary-normal-ticked  (:foreground as-theme-palette5))
     (gnus-summary-normal-unread  (:foreground as-theme-palette2 :inherit 'bold))
     (gnus-summary-selected       (:foreground as-theme-palette4 :weight 'bold))
     (gnus-cite-1                 (:foreground as-theme-palette5))
     (gnus-cite-2                 (:foreground as-theme-palette5))
     (gnus-cite-3                 (:foreground as-theme-palette5))
     (gnus-cite-4                 (:foreground as-theme-palette2))
     (gnus-cite-5                 (:foreground as-theme-palette2))
     (gnus-cite-6                 (:foreground as-theme-palette2))
     (gnus-cite-7                 (:foreground as-theme-palette5))
     (gnus-cite-8                 (:foreground as-theme-palette5))
     (gnus-cite-9                 (:foreground as-theme-palette5))
     (gnus-cite-10                (:foreground as-theme-faded_palette7))
     (gnus-cite-11                (:foreground as-theme-faded_palette7))
     (gnus-signature              (:foreground as-theme-faded_palette7))
     (gnus-x-face                 (:background as-theme-dark4 :foreground as-theme-light0))

     ;; web-mode
     (web-mode-doctype-face          (:foreground as-theme-palette4))
     (web-mode-html-tag-bracket-face (:foreground as-theme-palette4))
     (web-mode-html-tag-face         (:foreground as-theme-palette4))
     (web-mode-html-attr-name-face   (:foreground as-theme-palette3))
     (web-mode-html-attr-equal-face  (:foreground as-theme-palette3))
     (web-mode-html-attr-value-face  (:foreground as-theme-palette2))

     ;; Coq
     (coq-solve-tactics-face      (:inherit 'font-lock-constant-face))
     (coq-cheat-face              (:box (:line-width -1 :color as-theme-palette1 :style nil)
                                        :foreground as-theme-palette1))

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
