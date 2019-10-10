"
I am the abstract class for each step of the navigation
"
Class {
	#name : #WIDEAbstractStep,
	#superclass : #WIDEObject,
	#instVars : [
		'previousStep',
		'nextStep',
		'selectedElement'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEAbstractStep >> allElements [ 
	^ self subclassResponsibility 
]

{ #category : #accessing }
WIDEAbstractStep >> allElementsSorted [
	^ self allElements sorted: #name ascending
]

{ #category : #accessing }
WIDEAbstractStep >> browserStrategy [
	^ self previousStep browserStrategy
]

{ #category : #accessing }
WIDEAbstractStep >> nextStep [
	^ nextStep
]

{ #category : #accessing }
WIDEAbstractStep >> nextStep: aWIDEStep [
	nextStep := aWIDEStep.
	aWIDEStep previousStep: self
]

{ #category : #'as yet unclassified' }
WIDEAbstractStep >> nextStepClass [
	^ self subclassResponsibility 
]

{ #category : #accessing }
WIDEAbstractStep >> previousStep [
	^ previousStep
]

{ #category : #accessing }
WIDEAbstractStep >> previousStep: anObject [
	previousStep := anObject
]

{ #category : #toDo }
WIDEAbstractStep >> remove [
	
]

{ #category : #accessing }
WIDEAbstractStep >> selectedElement [
	^ selectedElement
]

{ #category : #accessing }
WIDEAbstractStep >> selectedElement: anObject [
	self selectedElementWillChange.
	selectedElement := anObject.
	self selectedElementHasChanged
]

{ #category : #'as yet unclassified' }
WIDEAbstractStep >> selectedElementHasChanged [
	self nextStep: self nextStepClass new
]

{ #category : #'as yet unclassified' }
WIDEAbstractStep >> selectedElementWillChange [
	self nextStep ifNotNil: [ self nextStep remove ]
]
