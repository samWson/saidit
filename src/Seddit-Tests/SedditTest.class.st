Class {
	#name : #SedditTest,
	#superclass : #TestCase,
	#instVars : [
		'server'
	],
	#category : #'Seddit-Tests'
}

{ #category : #running }
SedditTest >> setUp [
	server := Teapot on
		GET: '/' -> 'Hello, World!';
		start
]

{ #category : #running }
SedditTest >> tearDown [
	server stop
]

{ #category : #tests }
SedditTest >> testHome [
	| response |
	response := ZnEasy get: 'http://localhost:1701'.
	self assert: response isSuccess.
	self assert: response entity contents equals: 'Hello, World!'.
]
