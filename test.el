;; -*- coding: utf-8; lexical-binding: t -*-

(defun my-sum (x y)
  (+ x y))

(print (symbol-function 'my-sum))

(print (lambda (x y) (+ x y)))
