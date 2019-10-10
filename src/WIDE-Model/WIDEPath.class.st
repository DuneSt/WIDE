"
I am the path of the browser. I point the first step of the navigation (WIDEPackageStep)
"
Class {
	#name : #WIDEPath,
	#superclass : #WIDEObject,
	#instVars : [
		'packageStep',
		'browser'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEPath >> allStepsDo: aBlock [
	| step |
	step := self packageStep.
	[ step ]
		whileNotNil: [ aBlock value: step.
			step := [ step nextStep ]
				on: Error
				do: [ nil ] ]
]

{ #category : #accessing }
WIDEPath >> browser [
	^ browser
]

{ #category : #accessing }
WIDEPath >> browser: anObject [
	browser := anObject
]

{ #category : #accessing }
WIDEPath >> browserStrategy [
	^ self browser strategy
]

{ #category : #accessing }
WIDEPath >> initialize [ 
	super initialize.
	self packageStep: WIDEPackageStep new
]

{ #category : #accessing }
WIDEPath >> packageStep [
	^ packageStep
]

{ #category : #accessing }
WIDEPath >> packageStep: aPackageStep [
	packageStep := aPackageStep.
	aPackageStep path: self
	
]

{ #category : #accessing }
WIDEPath >> selectedMethod [
	^ self packageStep selectedMethod
]

{ #category : #accessing }
WIDEPath >> toggleMethodsOrVariables [
	self packageStep toggleMethodsOrVariables
]
