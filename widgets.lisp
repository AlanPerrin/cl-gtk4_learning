(in-package #:gtk4-demos)


(defvar *group* nil) 

(defun widgets (app)
  (let* ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
         (button (gir:invoke (*gtk* "Button" 'new-with-label) "Close"))
         (label (gir:invoke (*gtk* "Label" 'new) "My Test"))
	 (check (gir:invoke (*gtk* "CheckButton" 'new-with-label) "option 2"))
         (box (gir:invoke (*gtk* "Box" 'new) 1 6))
	 (toggle (gir:invoke (*gtk* "ToggleButton" 'new-with-label) "option 1"))
	; (scale (gir:invoke (*gtk* "Scale" 'new-with-range) :orientation :horizontal :adjustment (gir:invoke (*gtk* "Adjustment" 'new) 0.0 0.0 100.0 1.0 10.0)))
	 )
    ;; Set window properties
    (setf (window-title window) "Buttons")
    (setf (widget-size-request window) '(200 200))
    
    ;; Connect the "clicked" signal of the button to a callback function
    (gir:connect button :clicked
                 (lambda (button)
                   (declare (ignore button))
                   (format t "Hello~%")
                   ))
    
    ;; Set properties for the button, label, and radio buttons
    (setf (gir:property button 'margin-top) 40
          (gir:property button 'margin-bottom) 40
          (gir:property button 'margin-start) 20
          (gir:property button 'margin-end) 20)
    
    (setf (gir:property label 'margin-top) 50)
    
    ;; Pack the label, radio buttons, and button into the box
    (box-append box label)
    (box-append box toggle)
    (box-append box check)
 ;   (box-append box scale)
    (box-append box button)
    
    ;; Add the box to the window
    (gir:invoke (window 'set-child) box)
    
    ;; Show the window
    (gir:invoke (window 'show))))
