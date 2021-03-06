"
I am the variable step, i will propose all variable from the previous step (ClassStep) and depending also on the level (Class or Instance)
"
Class {
	#name : #WIDEVariableStep,
	#superclass : #WIDEAbstractStep,
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEVariableStep >> allElements [
	^ self browserEnvironment slotsFor: self selectedClass
]

{ #category : #accessing }
WIDEVariableStep >> methodsForSelectedElement [
	^ self browserEnvironment methodsReferencingSlot: self selectedElement
]

{ #category : #hooks }
WIDEVariableStep >> nextStepClass [
	^ WIDEMethodStep 
]

{ #category : #hooks }
WIDEVariableStep >> selectedClass [
	^ self previousStep selectedElement
]
