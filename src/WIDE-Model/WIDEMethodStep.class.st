"
I am the method step, i will propose all methods from the previous step (protocolStep or variableStep)
"
Class {
	#name : #WIDEMethodStep,
	#superclass : #WIDEAbstractStep,
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEMethodStep >> allElements [
	^ self selectedProtocol methods collect: [ :selector | self selectedClass >> selector ]
]

{ #category : #accessing }
WIDEMethodStep >> nextStep [
	^ self error: 'A method step does not have a next step'
]

{ #category : #accessing }
WIDEMethodStep >> nextStep: anObject [
	self error: 'A method step does not have a next step'
]

{ #category : #accesssing }
WIDEMethodStep >> selectedClass [
	^ self previousStep selectedClass
]

{ #category : #accessing }
WIDEMethodStep >> selectedElementHasChanged [
]

{ #category : #accessing }
WIDEMethodStep >> selectedElementWillChange [
]

{ #category : #accesssing }
WIDEMethodStep >> selectedProtocol [
	^ self previousStep selectedElement
]
