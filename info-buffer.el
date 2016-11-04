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

;;;###autoload
(defun info-display-manual-in-buffer (topic)
  "Display Info TOPIC in its own buffer."
  (interactive
   (list
    (progn
      (info-initialize)
      (completing-read "Manual name: "
		       (info--manual-names nil)
		       nil t))))
  (let ((bufname (format "*info: %s*" topic)))
    (if (get-buffer bufname)
        (switch-to-buffer bufname)
      (info topic bufname))))

(provide 'info-buffer)

;;; info-buffer.el ends here
