;;; scenery-theme.el --- A retro-groove colour theme for Emacs -*- lexical-binding: t -*-

;; Copyright (c) 2013 Lee Machin
;; Copyright (c) 2013-2016 Eduardo Lavaque
;; Copyright (c) 2016-2017 Jason Milkins
;; Copyright (c) 2017-2018 Martijn Terpstra

;; Author: Jason Milkins <jasonm23@gmail.com>
;; (current maintainer)
;;
;; Author-list: Lee Machin <ljmachin@gmail.com>,
;;              Eduardo Lavaque <me@greduan.com>
;;
;; URL: http://github.com/greduan/emacs-theme-everforest
;; Version: 1.26.0

;; Package-Requires: ((autothemer "0.2"))

;;; Commentary:

;; Using autothemer since 1.00

;; A port of the Everforest colorscheme for Vim, built on top of the new built-in
;; theme support in Emacs 24.
;;
;; This theme contains my own modifications and it's a bit opinionated
;; sometimes, deviating from the original because of it. I try to stay
;; true to the original as much as possible, however. I only make
;; changes where I would have made the changes on the original.
;;
;; Since there is no direct equivalent in syntax highlighting from Vim to Emacs
;; some stuff may look different, especially in stuff like JS2-mode, where it
;; adds stuff that Vim doesn't have, in terms of syntax.

;;; Credits:

;; Pavel Pertsev created the original theme for Vim, on which this port
;; is based.

;; Lee Machin created the first port of the original theme, which
;; Greduan developed further adding support for several major modes.
;;
;; Jason Milkins (ocodo) has maintained the theme since 2015 and is
;; working with the community to add further mode support and align
;; the project more closely with Vim Everforest.

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'as-theme)

(as-deftheme
 scenery
 "A retro-groove colour theme (dark version)"

 ((((class color) (min-colors #xFFFFFF))        ; col 1 GUI/24bit
   ((class color) (min-colors #xFF)))           ; col 2 Xterm/256

  (as-theme-dark0_hard "#110400" "#1c1c1c")
  (as-theme-dark0      "#10134c" "#262626")
  (as-theme-dark0_soft "#171a5d" "#303030")
  (as-theme-dark1      "#152669" "#3a3a3a")
  (as-theme-dark2      "#212f85" "#4e4e4e")
  (as-theme-dark3      "#1e3d8b" "#626262")
  (as-theme-dark4      "#31569c" "#767676")

  (as-theme-gray "#7a8478" "#8a8a8a")

  (as-theme-light0_hard "#ffefe7" "#ffffd7")
  (as-theme-light0      "#ffefe7" "#ffffaf")
  (as-theme-light1      "#efead4" "#ffdfaf")
  (as-theme-light2      "#e9e5cf" "#bcbcbc")
  (as-theme-light3      "#e1ddc9" "#a8a8a8")
  (as-theme-light4      "#dcd8c4" "#949494")

  (as-theme-palette1 "#e67e80" "#d75f5f")
  (as-theme-palette2 "#8ade60" "#afaf00")
  (as-theme-palette3 "#f4ec91" "#ffaf00")
  (as-theme-palette4 "#5badd4" "#87afaf")
  (as-theme-palette5 "#d699b6" "#d787af")
  (as-theme-palette6 "#83c092" "#87af87")
  (as-theme-palette7 "#e6a97d" "#ff8700")

  (as-theme-faded_palette1 "#b7596a" "#d75f5f")
  (as-theme-faded_palette2 "#69ba54" "#afaf00")
  (as-theme-faded_palette3 "#d1c883" "#ffaf00")
  (as-theme-faded_palette4 "#1c8dc4" "#87afaf")
  (as-theme-faded_palette5 "#b475a1" "#d787af")
  (as-theme-faded_palette6 "#5d9d80" "#87af87")
  (as-theme-faded_palette7 "#ba7d72" "#ff8700")

  (as-theme-dark_palette1 "#544247" "#5f0000")
  (as-theme-dark_palette4 "#3b5360" "#000087")
  (as-theme-dark_palette6 "#445349" "#005f5f")

  (as-theme-delimiter-one   "#1c8dc4" "#008787")
  (as-theme-delimiter-two   "#b475a1" "#d75f87")
  (as-theme-delimiter-three "#83c092" "#87af87")
  (as-theme-delimiter-four  "#ba7d72" "#d75f00")
  (as-theme-white           "#FFFFFF" "#FFFFFF")
  (as-theme-black           "#000000" "#000000")

  (as-theme-ediff-current-diff-A        "#544247" "#4f2121")
  (as-theme-ediff-current-diff-B        "#504f45" "#5f5f00")
  (as-theme-ediff-current-diff-C        "#3b5360" "#4f214f")
  (as-theme-ediff-current-diff-Ancestor "#445349" "#21214f")
  (as-theme-ediff-fine-diff-A           "#503946" "#761919")
  (as-theme-ediff-fine-diff-B           "#1c691c" "#1c691c")
  (as-theme-ediff-fine-diff-C           "#761976" "#761976")
  (as-theme-ediff-fine-diff-Ancestor    "#12129d" "#12129d")

  (as-theme-bg as-theme-dark0)
  (as-theme-bg_inactive as-theme-dark0_soft)
  )
 

 (custom-theme-set-variables 'scenery
                             `(ansi-color-names-vector
                               [,as-theme-dark1
                                ,as-theme-palette1
                                ,as-theme-palette2
                                ,as-theme-palette3
                                ,as-theme-palette4
                                ,as-theme-palette5
                                ,as-theme-palette6
                                ,as-theme-light1])
			     `(pdf-view-midnight-colors '(,as-theme-light0 . ,as-theme-bg))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'scenery)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; scenery-theme.el ends here
