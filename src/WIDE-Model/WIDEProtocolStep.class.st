"
I am the protocol step, i will propose all protocols from the previous step (ClassStep)
"
Class {
	#name : #WIDEProtocolStep,
	#superclass : #WIDEAbstractStep,
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEProtocolStep >> allElements [
	^ self selectedClass organization protocols
]

{ #category : #'as yet unclassified' }
WIDEProtocolStep >> nextStepClass [
	^ WIDEMethodStep 
]

{ #category : #accessing }
WIDEProtocolStep >> selectedClass [
	^ self previousStep selectedElement
]
