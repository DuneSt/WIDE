"
I am the method step, i will propose all methods from the previous step (protocolStep or variableStep)
"
Class {
	#name : #WIDEMethodStep,
	#superclass : #WIDEAbstractStep,
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEMethodStep >> nextStep [
	^ self error: 'A method step does not have a next step'
]

{ #category : #accessing }
WIDEMethodStep >> nextStep: anObject [
	self error: 'A method step does not have a next step'
]

{ #category : #accessing }
WIDEMethodStep >> selectedElementWillChange [
]
