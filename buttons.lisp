#(in-package :gtk4-demos)


(defun print-hello ()
  (format t "Hello World! ~%"))

(defun buttons (app)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app)))
    (setf(window-title window)"buttons")
    (setf (widget-size-request window ) '(500 500))
    (gir:invoke (window 'show))))

