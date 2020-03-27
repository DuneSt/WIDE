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

{ #category : #converting }
WIDEPath >> asUri [
	^ 'wide://browser/' , (((self stepsIterator collect: [ :step |
		step asUriSegment ]) reject: #isNil) joinUsing: '/')
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
WIDEPath >> browserEnvironment [
	^ self browser environment
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

{ #category : #'as yet unclassified' }
WIDEPath >> stepsBasicIterator [
	^ LinkedListIterator on: self packageStep nextLinkBlock: [ :step | [ step nextStep] on: Error do: [ nil ] ]
]

{ #category : #'as yet unclassified' }
WIDEPath >> stepsIterator [
	^ self stepsBasicIterator withCollectionAPI
]

{ #category : #accessing }
WIDEPath >> toggleInstanceOrClass [
	self packageStep toggleInstanceOrClass
]

{ #category : #accessing }
WIDEPath >> toggleMethodsOrVariables [
	self packageStep toggleMethodsOrVariables
]
