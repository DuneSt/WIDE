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
WIDEAbstractStep >> browserStrategy [
	^ self previousStep browserStrategy
]

{ #category : #accessing }
WIDEAbstractStep >> nextStep [
	^ nextStep
]

{ #category : #accessing }
WIDEAbstractStep >> nextStep: anObject [
	nextStep := anObject
]

{ #category : #accessing }
WIDEAbstractStep >> previousStep [
	^ previousStep
]

{ #category : #accessing }
WIDEAbstractStep >> previousStep: anObject [
	previousStep := anObject
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
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
WIDEAbstractStep >> selectedElementWillChange [
	self nextStep ifNotNil: [ self nextStep remove ]
]
