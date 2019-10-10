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

{ #category : #accessing }
WIDEProtocolStep >> methodsForSelectedElement [
	^ self selectedElement methods collect: [ :selector | self selectedClass >> selector ]
]

{ #category : #hooks }
WIDEProtocolStep >> nextStepClass [
	^ WIDEMethodStep 
]

{ #category : #accessing }
WIDEProtocolStep >> selectedClass [
	^ self previousStep selectedElement
]
