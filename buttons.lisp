(in-package #:gtk4-demos)


(defun print-hello ()
  (format t "Hello World! ~%"))


(defun buttons1 (app)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	(button (gir:invoke (*gtk* "Button" 'new-with-label) "new window")))
    (setf(window-title window)"buttons")
    (setf (widget-size-request window ) '(500 500))

    (gir:connect button :clicked
                 (lambda (button)
		   (declare (ignore button))
                 ;  (window-destroy window)
		   (new-window)))
    (box-append box button)
    (gir:invoke (window 'set-child) box)
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



(defun buttons3 (app)
  (let* ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
         (button (gir:invoke (*gtk* "Button" 'new-with-label) "Open New Window"))
         (label (gir:invoke (*gtk* "Label" 'new) "My Test"))
         (box (gir:invoke (*gtk* "Box" 'new) 1 6)))
    ;; Set window properties
    (setf (window-title window) "Buttons")
    (setf (widget-size-request window) '(200 200))
    
    ;; Create a callback function for the button click event
    (defun open-new-window (button)
      (declare (ignore button))
      ;; Create and show a new window
      (let ((new-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	    (box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	    (label (gir:invoke (*gtk* "Label" 'new) "I'm a new window")))
        (setf (window-title new-window) "New Window")
        (setf (widget-size-request new-window) '(200 200))
	(box-append box label)
	(gir:invoke (window 'set-child) box)
        (gir:invoke (new-window 'show))))
    
    ;; Connect the "clicked" signal of the button to the callback function
    (gir:connect button :clicked #'open-new-window)
    
    ;; Set properties for the button and label
    (setf (gir:property button 'margin-top) 40
          (gir:property button 'margin-bottom) 40
          (gir:property button 'margin-start) 20
          (gir:property button 'margin-end) 20)
    
    (setf (gir:property label 'margin-top) 50)
    
    ;; Pack the label and button into the box
    (box-append box label)
    (box-append box button)
    
    ;; Add the box to the window
    (gir:invoke (window 'set-child) box)
    
    ;; Show the window
    (gir:invoke (window 'show))))


(defun buttons-test2 (app)
  (let* ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
         (grid (gir:invoke (*gtk* "Grid" 'new)))
         (button1 (gir:invoke (*gtk* "Button" 'new-with-label) "Print 'Hello World'"))
         (button2 (gir:invoke (*gtk* "Button" 'new-with-label) "Open New Window"))
         (button3 (gir:invoke (*gtk* "Button" 'new-with-label) "Close Application"))
         (label (gir:invoke (*gtk* "Label" 'new) "My Test")))
    ;; Set window properties
    (setf (window-title window) "Buttons")
    (setf (widget-size-request window) '(200 200))
    
    ;; Create a callback function for button 1
    (defun print-hello-world (button)
      (declare (ignore button))
      (format t "Hello World~%"))
    
    ;; Create a callback function for button 2
    (defun open-new-window (button)
      (declare (ignore button))
      ;; Create and show a new window
      (let ((new-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app)))
        (setf (window-title new-window) "New Window")
        (setf (widget-size-request new-window) '(200 200))
        (gir:invoke (new-window 'show))))
    
    ;; Create a callback function for button 3
    (defun close-application (button)
      (declare (ignore button))
      ;; Close the application
       (window-destroy window))
    
    ;; Connect the "clicked" signal of each button to their respective callback functions
    (gir:connect button1 :clicked #'print-hello-world)
    (gir:connect button2 :clicked #'open-new-window)
    (gir:connect button3 :clicked #'close-application)
    
    ;; Set properties for the label
    (setf (gir:property label 'margin-top) 20)
    
    ;; Pack the buttons and label into the grid
    (gir:invoke (grid 'attach) label 0 0 3 1)
    (gir:invoke (grid 'attach) button1 0 1 1 1)
    (gir:invoke (grid 'attach) button2 1 1 1 1)
    (gir:invoke (grid 'attach) button3 2 1 1 1)
    
    ;; Set grid properties
    (setf (gir:property grid 'row-spacing) 10)
    (setf (gir:property grid 'column-spacing) 10)
    
    ;; Add the grid to the window
    (gir:invoke (window 'set-child) grid)
    
    ;; Show the window
    (gir:invoke (window 'show))))

(defun buttons-test3 (app)
  (let* ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
         (grid (gir:invoke (*gtk* "Grid" 'new)))
         (button1 (gir:invoke (*gtk* "Button" 'new-with-label) "Print 'Hello World'"))
         (button2 (gir:invoke (*gtk* "Button" 'new-with-label) "Open New Window"))
         (button3 (gir:invoke (*gtk* "Button" 'new-with-label) "Close Application"))
         (button4 (gir:invoke (*gtk* "Button" 'new-with-label) "Open New Window with Scale"))
         (label (gir:invoke (*gtk* "Label" 'new) "My Test")))
    ;; Set window properties
    (setf (window-title window) "Buttons")
    (setf (widget-size-request window) '(200 200))
    
    ;; Create a callback function for button 1
    (defun print-hello-world (button)
      (declare (ignore button))
      (format t "Hello World~%"))
    
    ;; Create a callback function for button 2
    (defun open-new-window (button)
      (declare (ignore button))
      ;; Create and show a new window
      (let ((new-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app)))
        (setf (window-title new-window) "New Window")
        (setf (widget-size-request new-window) '(200 200))
        (gir:invoke (new-window 'show))))
    
    ;; Create a callback function for button 3
    (defun close-application (button)
      (declare (ignore button))
      ;; Close the application if the app object is valid
      (when app
        (gir:invoke app 'quit)))
    
    ;; Create a callback function for button 4
    (defun open-new-window-with-scale (button)
      (declare (ignore button))
      ;; Create and show a new window with a scale widget
      (let* ((new-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
             (scale (gir:invoke (*gtk* "Scale" 'new-with-range) 0 100.0d0 1.0d0 1.0d0)))
        (setf (window-title new-window) "New Window with Scale")
        (setf (widget-size-request new-window) '(300 200))
        (gir:invoke (new-window 'set-child) scale)
        (gir:invoke (new-window 'show))))
    
    ;; Connect the "clicked" signal of each button to their respective callback functions
    (gir:connect button1 :clicked #'print-hello-world)
    (gir:connect button2 :clicked #'open-new-window)
    (gir:connect button3 :clicked #'close-application)
    (gir:connect button4 :clicked #'open-new-window-with-scale)
    
    ;; Set properties for the label
    (setf (gir:property label 'margin-top) 20)
    
    ;; Pack the buttons and label into the grid
    (gir:invoke (grid 'attach) label 0 0 2 1)
    (gir:invoke (grid 'attach) button1 0 1 1 1)
    (gir:invoke (grid 'attach) button2 1 1 1 1)
    (gir:invoke (grid 'attach) button3 0 2 1 1)
    (gir:invoke (grid 'attach) button4 1 2 1 1)
    
    ;; Set grid properties
    (setf (gir:property grid 'row-spacing) 10)
    (setf (gir:property grid 'column-spacing) 10)
    
    ;; Add the grid to the window
    (gir:invoke (window 'set-child) grid)
    
    ;; Show the window
    (gir:invoke (window 'show))))
