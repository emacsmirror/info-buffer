;;; info-buffer.el --- Display info topics on separate buffers
;;
;; Copyright (C) 2015-2016 Lluís Vilanova
;;
;; Author: Lluís Vilanova <vilanova@ac.upc.edu>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see http://www.gnu.org/licenses/.

;;; Commentary:
;;
;; Display every info topic on a separate buffer.

;;; Code:

(require 'info)

(defun info-buffer--open (topic bufname)
  "Open info on TOPIC in BUFNAME."
  (if (get-buffer bufname)
      (switch-to-buffer bufname)
    (info topic bufname)))

;;;###autoload
(defun info-display-manual-in-buffer (topic replicate)
  "Display Info TOPIC in its own buffer.

With prefix, or if REPLICATE is non-nil, never reuse an existing
buffer."
  (interactive
   (list
    (progn
      (info-initialize)
      (completing-read "Manual name: "
		       (info--manual-names nil)
		       nil t))
    current-prefix-arg))
  (let ((base-bufname (format "*info: %s*" topic)))
    (if replicate
        (let ((num 0)
              (bufname base-bufname))
          (while (get-buffer bufname)
            (setq num (1+ num))
            (setq bufname (concat base-bufname "<" (number-to-string num) ">")))
          (info-buffer--open topic bufname))
      (info-buffer--open topic base-bufname))))

(provide 'info-buffer)

;;; info-buffer.el ends here
