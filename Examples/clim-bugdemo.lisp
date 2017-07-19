(defpackage :clim-bugdemo
  (:use :cl)
  (:export #:bugdemo2-frame))

(in-package :clim-bugdemo)

(clim:define-application-frame bugdemo2-frame ()
  ((rows :initform nil
         :accessor bugdemo2-frame/rows
         :documentation "List of entries. Each entry must have a unique id."))
  (:panes (content :application
                   :display-function 'display-content
                   :scroll-bars :vertical))
  (:layouts (default content))
  (:default-initargs :width 800 :height 700))

(defun display-content (frame stream)
  (declare (ignore frame))
  (clim:formatting-table (stream)
    :multiple-columns t
    (clim:formatting-row (stream)
      (clim:formatting-cell (stream)
        (loop
          for i from 0 below 100
          do (format stream " ~r" i)))
      (clim:formatting-cell (stream)
        (format stream (concatenate 'string "This is a message that does occupies~%"
                                    "a part of the width of the pane.~%~%"
                                    "The problem is that the right-most cell~%"
                                    "flows the text based on the width of the~%"
                                    "entire pane, not just the column.~%"))))))
