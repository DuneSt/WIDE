Class {
	#name : #WIDEEnvironment,
	#superclass : #Object,
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEEnvironment >> classesFor: aPackage [
	^ aPackage definedClasses
]

{ #category : #accessing }
WIDEEnvironment >> methodsFor: aClass under: aProtocol [
	^ aProtocol methods collect: [ :selector | aClass >> selector ]
]

{ #category : #accessing }
WIDEEnvironment >> methodsReferencingSlot: aSlot [
	^ aSlot usingMethods
]

{ #category : #accessing }
WIDEEnvironment >> packages [
	^ RPackage organizer packages
]

{ #category : #accessing }
WIDEEnvironment >> protocolsFor: aClass [
	^ aClass organization protocols
]

{ #category : #accessing }
WIDEEnvironment >> slotsFor: aClass [
	^ aClass slots
]

{ #category : #accessing }
WIDEEnvironment >> tagsFor: aPackage [
	^ aPackage classTags
]
