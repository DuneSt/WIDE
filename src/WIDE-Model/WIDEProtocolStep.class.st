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
	"^ self selectedClass organization protocols"
	^ self browserEnvironment protocolsFor: self selectedClass
]

{ #category : #accessing }
WIDEProtocolStep >> methodsForSelectedElement [
	"^ self selectedElement methods collect: [ :selector | self selectedClass >> selector ]"
	^ self browserEnvironment methodsFor: self selectedClass under: self selectedElement
]

{ #category : #hooks }
WIDEProtocolStep >> nextStepClass [
	^ WIDEMethodStep 
]

{ #category : #accessing }
WIDEProtocolStep >> selectedClass [
	^ self previousStep selectedElement
]
