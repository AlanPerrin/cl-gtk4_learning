#(in-package :gtk4-demos)


(defun print-hello ()
  (format t "Hello World! ~%"))

(defun buttons (app)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app)))
    (setf(window-title window)"buttons")
    (setf (widget-size-request window ) '(500 500))
    (gir:invoke (window 'show))))



(defun buttons (app)
 ; (defparameter box nil)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(button (gir:invoke (*gtk* "Button" 'new-with-label) "close"))
	(label (gir:invoke (*gtk* "Label"  'new) "My Test"))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	)
;window
    (setf(window-title window)"buttons")
    (setf (widget-size-request window ) '(200 200))


;scale

  ;  (setf (gir:propert scale '
    
;buttons
    (setf (gir:property button 'margin-top) 40
         (gir:property button 'margin-bottom) 40
         (gir:property button 'margin-start) 20
         (gir:property button 'margin-end) 20)
    (gir:connect button :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (window-destroy window)))

;radio buttons


    
;label
    (setf (gir:property label 'margin-top)50)
;packing 

    (box-append box label)

    (box-append box button)

    (gir:invoke (window 'set-child) box)
    
    (gir:invoke (window 'show))))
