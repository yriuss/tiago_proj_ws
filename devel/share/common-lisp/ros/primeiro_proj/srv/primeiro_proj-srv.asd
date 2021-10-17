
(cl:in-package :asdf)

(defsystem "primeiro_proj-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "situation" :depends-on ("_package_situation"))
    (:file "_package_situation" :depends-on ("_package"))
  ))