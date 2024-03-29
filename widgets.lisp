(in-package #:gtk4-demos)


;(defvar *group* (gir:invoke (*gtk* "RadioButton" 'new)))

(defun widgets (app)
  (let* ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
         (button (gir:invoke (*gtk* "Button" 'new-with-label) "Close"))
         (label (gir:invoke (*gtk* "Label" 'new) "My Test"))
	 (progress-bar (gir:invoke (*gtk* "ProgressBar" 'new)))
         (separator (gir:invoke (*gtk* "Separator" 'new)0))
	 (check1 (gir:invoke (*gtk* "CheckButton" 'new-with-label) "option 1"))
	 (check2 (gir:invoke (*gtk* "CheckButton" 'new-with-label) "option 2"))
	 (entry (gir:invoke (*gtk* "Entry" 'new)))
	 (scale (gir:invoke (*gtk* "Scale" 'new-with-range) 0 0.1d0 10.d0 1.d0))
         (box (gir:invoke (*gtk* "Box" 'new) 1 6))
	 (print-button (gir:invoke (*gtk* "Button" 'new-with-label) "Print Entry Contents"))
	 (toggle (gir:invoke (*gtk* "ToggleButton" 'new-with-label) "option 1"))
	 (toggle2 (gir:invoke (*gtk* "ToggleButton" 'new-with-label) "option 2"))
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

        ;; Set progress bar to be half complete
    (gir:invoke (progress-bar 'set-fraction) 0.5d0)


    ;; Callback function to print entry contents
    (defun print-entry-contents (button)
      (declare (ignore button))
      (format t "Entry Contents: ~a~%" (gir:invoke (entry 'get-text))))
    ;; Connect the "clicked" signal of the print button to the callback function
    (gir:connect print-button :clicked #'print-entry-contents)
    
    ;; Set properties for the button, label, and radio buttons
    (setf (gir:property button 'margin-top) 40
          (gir:property button 'margin-bottom) 40
          (gir:property button 'margin-start) 20
          (gir:property button 'margin-end) 20)
    
    (setf (gir:property label 'margin-top) 50)

    ;; Group the Toggle buttons
    (gir:invoke (toggle 'set-group) toggle)
    (gir:invoke (toggle2 'set-group) toggle)

    ;Group the check buttons
    (gir:invoke (check1 'set-group)check1)
    (gir:invoke (check2 'set-group)check1)
    


      ;Toggle signals
    (gir:connect  toggle :toggled (lambda (button) (declare (ignore button)) (format t "Option 1 toggled~%" )))
    
        ;; Connect callback functions for toggled signal
    (gir:connect  check1 :toggled (lambda (button) (declare (ignore button)) (format t "Option 1 toggled~%" )))
    (gir:connect  check2 :toggled (lambda (button) (declare (ignore button)) (format t "~a ~%" (gir:invoke (check2 'get-label)))))
    
    ;; Pack the label, radio buttons, and button into the box
    (box-append box label)
    (box-append box separator) ;; Add separator here
    (box-append box toggle)
    (box-append box toggle2)
    (box-append box progress-bar)
    (box-append box check1)
    (box-append box entry)
    (box-append box check2)
    (box-append box button)
    (box-append box scale)
    (box-append box print-button)
    
    ;; Add the box to the window
    (gir:invoke (window 'set-child) box)
    
    ;; Show the window
    (gir:invoke (window 'show))))
